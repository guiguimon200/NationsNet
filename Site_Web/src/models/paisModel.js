var database = require("../database/config");

// function buscarPorNomePais(nomePais) {
//     var instrucaoSql = `SELECT * FROM pais WHERE nomePais = '${nomePais}'`;
  
//     return database.executar(instrucaoSql);
// }

// function buscarPorIdPais(idPais) {
//     var instrucaoSql = `SELECT * FROM pais WHERE idPais = '${idPais}'`;
  
//     return database.executar(instrucaoSql);
// }

function listar() {
    var instrucaoSql = 'select * from pais';

    return database.executar(instrucaoSql);
}

module.exports = {  listar };
// buscarPorNomePais, buscarPorIdPais,