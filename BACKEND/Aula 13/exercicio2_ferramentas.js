const fs = require('fs');
const entrada = require('readline-sync');

const ferramentas = [];
const total = entrada.questionInt("Quantas ferramentas? ");

for (let i = 0; i < total; i++) {
  const nome = entrada.question("Nome: ");
  const quantidade = entrada.questionInt("Quantidade: ");
  const custoUnitario = entrada.questionFloat("Custo: ");

  ferramentas.push({ nome, quantidade, custoUnitario });
}

fs.writeFileSync('ferramentas.json', JSON.stringify(ferramentas, null, 2));

console.log(`${ferramentas.length} itens gravados com sucesso!`);