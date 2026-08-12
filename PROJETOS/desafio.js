const entrada = require(`readline-sync`);

//console.log = ("verificador de Votacao");

const idade = entrada.question("Qual sua idade? ");

if (idade >= 16) {
    console.log("Voce possui idade para votar, APROVADO")
}else {
    console.log("Voce nao possui idade para votar, NEGADO")
}