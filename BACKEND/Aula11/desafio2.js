const entrada = require('readline-sync');

const valorConta = entrada.questionFloat("Digite o valor total da conta: R$ ");

if (valorConta > 100) {
    const valorComDesconto = valorConta * 0.90;

    console.log(`Valor com 10% de desconto: R$ ${valorComDesconto.toFixed(2)}`);
} else {
    console.log(`Valor normal da conta: R$ ${valorConta.toFixed(2)}`);
}
