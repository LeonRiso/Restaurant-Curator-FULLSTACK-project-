const express = require("express");

const router = express.Router();

const restaurantes = require("../controllers/restaurantes")
const clientes = require("../controllers/login");

router.post("/login", clientes.autenticar);
router.get("/restaurantes", restaurantes.listar);
router.get("/restaurantsearch/:id", restaurantes.buscar)
router.get("/restaurantemenu/:id", restaurantes.menu)
router.get("/restaurantreview/:id", restaurantes.review)
module.exports = router;