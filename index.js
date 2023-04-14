
const express = require("express");
const cors = require("cors");
const app = express();

const loginRoutes = require ("./src/routes/login-route")


app.use(cors());
app.use(express.json());

app.use(loginRoutes)


app.listen(3000, () => {
    console.log("rodando");
})