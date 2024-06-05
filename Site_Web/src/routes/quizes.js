var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post(`/inserirPontuacao/:idUsuario`, function (req, res) {
    quizController.inserirPontuacao(req, res);
});

router.get("/ultimas/:idUsuario", function (req, res) {
    quizController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idUsuario", function (req, res) {
    quizController.buscarMedidasEmTempoReal(req, res);
});

module.exports = router;