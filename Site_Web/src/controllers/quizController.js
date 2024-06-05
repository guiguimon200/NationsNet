var quizModel = require("../models/quizModel");
// var aquarioModel = require("../models/aquarioModel");

function inserirPontuacao(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo scriptquiz.html
    var totalPontos = req.body.totalPontosServer;
    var idUsuario = req.params.idUsuario;

    if (totalPontos == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        quizModel.inserirPontuacao(totalPontos, idUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o insert! estou no controller, Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function buscarUltimasMedidas(req, res) {

    var idUsuario = req.params.idUsuario;

    quizModel.buscarUltimasMedidas(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMedidasEmTempoReal(req, res) {

    var idUsuario = req.params.idUsuario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    inserirPontuacao,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}