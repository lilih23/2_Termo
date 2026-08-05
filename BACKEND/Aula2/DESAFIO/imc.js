const entrada = require('readline-sync');

console.log("--- CALCULADORA DE IMC ---");

const peso = entrada.questionFloat("Qual o seu peso (Kg)? ");
const altura = entrada.questionFloat("Qual sua altura? ");

const imc = peso / (altura * altura);

console.log("\n--- RESULTADO CALCULO ---");
console.log(`Seu IMC é: ${imc.toFixed(2)} <3`);