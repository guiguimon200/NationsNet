const question = document.querySelector(".question");
const answers = document.querySelector(".answers");
const spnQtd = document.querySelector(".spnQtd");
const textFinish = document.querySelector(".finish span");
const content = document.querySelector(".content");
const contentFinish = document.querySelector(".finish");
const btnRestart = document.querySelector(".finish button");
const image = document.querySelector(".image");
const ponto = document.querySelector(".ponto")

import questions from "./quizjs.js";

let currentIndex = 0;
let questionsCorrect = 0;
let totalPontos = 0;
// let listaPontos = [];

btnRestart.onclick = () => {
  content.style.display = "flex";
  contentFinish.style.display = "none";

  currentIndex = 0;
  questionsCorrect = 0;
  loadQuestion();
};

function nextQuestion(e) {
    const item = questions[currentIndex];
    item.answers.forEach((answer) => {
        const div = document.createElement("div");
    
        div.innerHTML = `
        <button class="answer" data-correct="${answer.correct}">
          ${answer.option}
        </button>
        `;
    
        answers.appendChild(div);
      });

  if (e.target.getAttribute("data-correct") === "true") {
    questionsCorrect++;
    totalPontos += item.pontuacao;
  }

  if (currentIndex < questions.length - 1) {
    currentIndex++;
    loadQuestion();
  } else {
    finish();
    inserirPontuacao();
  }
}

function finish() {
  textFinish.innerHTML = `Você acertou ${questionsCorrect} de ${questions.length}`;
  content.style.display = "none";
  contentFinish.style.display = "flex";
  console.log(`Voce fez ${totalPontos} pontos`);

  if (totalPontos == 0) {
    ponto.innerHTML = `Você não fez pontos`;
  } else if (totalPontos == 1) {
    ponto.innerHTML = `Você fez ${totalPontos} ponto`;
  } else {
    ponto.innerHTML = `Você fez ${totalPontos} pontos`
  }

}

function loadQuestion() {
  spnQtd.innerHTML = `${currentIndex + 1}/${questions.length}`;
  const item = questions[currentIndex];
  answers.innerHTML = "";
  question.innerHTML = item.question;
  image.innerHTML = item.image;

  item.answers.forEach((answer) => {
    const div = document.createElement("div");

    div.innerHTML = `
    <button class="answer" data-correct="${answer.correct}">
      ${answer.option}
    </button>
    `;

    answers.appendChild(div);
  });

  document.querySelectorAll(".answer").forEach((item) => {
    item.addEventListener("click", nextQuestion);
  });
}

loadQuestion();

function inserirPontuacao() {
    var idUsuario = sessionStorage.ID_USUARIO;
    let totalPontosVar = totalPontos;
    console.log(totalPontosVar);

    // Enviando o valor da nova input
fetch(`/quizes/inserirPontuacao/${idUsuario}`, {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({
    // crie um atributo que recebe o valor recuperado aqui
    // Agora vá para o arquivo routes/usuario.js
    totalPontosServer: totalPontosVar
  }),
})
  .then(function (resposta) {
    console.log("resposta: ", resposta);

    if (resposta.ok) {
      console.log("Insert realizado com sucesso...");
      finalizarAguardar();

    } else {
      throw "Houve um erro x";
    }
  })
  .catch(function (resposta) {
    console.log(`#ERROu: ${resposta}`);
    finalizarAguardar();
  });

return false;
}