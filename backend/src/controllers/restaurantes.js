const con = require("../dao/connect");

const listar = (req, res) => {
   let query =  `SELECT r.restID, r.nome AS restNome, c.nome AS catNome, r.endereco
                FROM restaurante r
                INNER JOIN categoria c ON r.catID = c.catID`;

    con.query(query, (err, response) => {
        if(err == undefined){
            res.status(200).json(response).end();
        }else {
            res.status(400).json(err).end();
        }
    })
}

const buscar = (req, res) => {
    const { id } = req.params;

    let query = `SELECT * FROM restaurante WHERE restID LIKE '%${id}%'`;

    con.query(query, (err, response) => {
        if(err == undefined) {
            res.status(200).json(response).end();
        }else {
            res.status(400).json(err).end();
        }
    });
}

const menu = (req, res) =>{
    const {id} = req.params 
    let query = `SELECT * FROM cardapio where restID like '%${id}%'`
    con.query(query, (err, response)=>{
        if(err == undefined){
            res.status(200).json(response).end()
        }else{
            res.status(400).json(err).end()
        }
    })
}

const review = (req, res) =>{
    const {id} = req.params 
    let query = `SELECT * FROM avaliacao where restID like '%${id}%'`
    con.query(query, (err, response)=>{
        if(err == undefined){
            res.status(200).json(response).end()
        }else{
            res.status(400).json(err).end()
        }
    })
}

module.exports = {
    listar,
    buscar,
    menu,
    review
}