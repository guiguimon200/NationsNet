var express = require("express");
var router = express.Router();

var paisController = require("../controllers/paisController");

// router.get("/buscar/:nomePais", function (req, res) {
//     paisController.buscarPorNomePais(req, res);
// });

// router.get("/buscar/:idPais", function (req, res) {
//     paisController.buscarPorIdPais(req, res);

// });

router.get("/listarP", function (req, res) {
    paisController.listar(req, res);
});

module.exports = router;