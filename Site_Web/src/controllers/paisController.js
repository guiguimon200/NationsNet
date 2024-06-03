var paisModel = require("../models/paisModel");

// function buscarPorNomePais(req, res) {
//     var nomePais = req.query.nomePais;

//     paisModel.buscarPorNomePais(nomePais).then((resultado) => {
//         res.status(200).json(resultado);
//     });
// }

// function buscarPorIdPais(req, res) {
//     var idPais = req.params.idPais;

//     paisModel.buscarPorIdPais(idPais).then((resultado) => {
//         res.status(200).json(resultado);
//     });
// }

function listar(req, res) {
    paisModel.listar().then((resultado) => {
        res.status(200).json(resultado);
    });
}

module.exports = {
    // buscarPorNomePais,
    // buscarPorIdPais,
    listar,
};