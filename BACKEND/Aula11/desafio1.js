const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ");
const anoNascimento = entrada.questionInt("Digite seu ano de nascimento: ");

const anoAtual = new Date().getFullYear();
const idade = anoAtual - anoNascimento;

console.log(`\nOlá, ${nome}! Você tem ${idade} anos.`);

if (idade >= 16) {
    console.log("Você já tem idade mínima para votar.");
} else {
    console.log("Você ainda não tem idade mínima para votar.");
}