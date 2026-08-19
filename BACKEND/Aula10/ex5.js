const entrada = require('readline-sync')

console.log (" === Sistema de Controle de Qualidade === ")

const qualidade = [];

const quantidade = entrada.questionInt("Quantas pecas deseja avaliar?");

for (let i = 0; i < quantidade; i++) {
    let peca = entrada.questionFloat(`Digite a quantiddade da peca ${i + 1}: `);
    qualidade.push(peca);
}

console.log("\n === Relatorio da Auditoria ===")

console.log(`Qualidades registradas: ${qualidade.join(", ")}`);
const media = qualidade.reduce((a, b) => a + b, 0) / qualidade.length;
console.log(`Media das qualidades: ${media.toFixed(2)}`);
