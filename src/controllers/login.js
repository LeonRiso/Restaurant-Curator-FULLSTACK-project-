const con = require("../dao/connect");

const autenticar = (req, res) => {
    const {email, senha} = req.body;

    let query = `SELECT * FROM clientes WHERE email = '${email}' AND senha = '${senha}'`;

    con.query(query, (err, response) => {
        if (err) {
          console.error(err);
          res.status(401).json(err).end();
        } else if (response.length === 0) {
          res.status(401).json({"msg": "Email ou senha inválidos"}).end();
        } else {
          let cliente = response[0];
          delete cliente.senha;
          res.status(200).json(cliente).end();
        }
      });
    }      

module.exports = {
    autenticar
}