var database = require("../database/config");


function inserirPontuacao(totalPontos, idUsuario) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", totalPontos);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO tentativa (fkUsuario, fkQuiz, dataTentativa, pontuacao) VALUES ('${idUsuario}', 1 , now(), '${totalPontos}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidas(idUsuario) {

    var instrucaoSql = `SELECT 
                    pontuacao
                    FROM usuario join tentativa on fkUsuario = idUsuario
                    WHERE fkUsuario = ${idUsuario}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idUsuario) {

    var instrucaoSql = `SELECT 
    pontuacao
    FROM usuario join tentativa on fkUsuario = idUsuario
    WHERE fkUsuario = ${idUsuario}
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarTotalPontos(idUsuario) {

    var instrucaoSql = `SELECT SUM(pontuacao) as total FROM usuario join tentativa 
    on fkUsuario = idUsuario WHERE fkUsuario = ${idUsuario}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarPontoMaximo(idUsuario) {

    var instrucaoSql = `SELECT MAX(pontuacao) as maxima FROM usuario join tentativa 
    on fkUsuario = idUsuario WHERE fkUsuario = ${idUsuario}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    inserirPontuacao,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarTotalPontos,
    buscarPontoMaximo
};