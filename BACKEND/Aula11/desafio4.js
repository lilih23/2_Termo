const entrada = require('readline-sync');

const idade = entrada.questionInt("Digite a idade do atleta: ");

if (idade >= 5 && idade <= 10) {
    console.log("Classificacao: Infantil");
} else if (idade >= 11 && idade <= 17) {
    console.log("Classificacao: Juvenil");
} else if (idade >= 18 && idade <= 60) {
    console.log("Classificacao: Adulto");
} else if (idade > 60) {
    console.log("Classificacao: Senior");
} else {
    console.log("Idade fora da faixa de classificacao.");
}
