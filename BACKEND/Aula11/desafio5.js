const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Digite sua renda mensal: ", (respostaRenda) => {
    let renda = Number(respostaRenda);

    rl.question("Seu nome está limpo? s/n: ", (respostaNome) => {
        let nomeLimpo = respostaNome === "true";

        if (renda > 2000 && nomeLimpo) {
            console.log("Empréstimo Aprovado");
        } else {
            console.log("Empréstimo Negado");
        }

        rl.close();
    });
});
