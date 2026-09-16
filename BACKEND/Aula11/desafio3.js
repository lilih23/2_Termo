const entrada = require('readline-sync');

const precoAlcool = entrada.questionFloat("Digite o preco do litro do alcool: R$ ");
const precoGasolina = entrada.questionFloat("Digite o preco do litro da gasolina: R$ ");

const resultado = precoAlcool / precoGasolina;

if (resultado < 0.7) {
    console.log("Abasteca com ALCOOL");
} else {
    console.log("Abasteca com GASOLINA");
}
