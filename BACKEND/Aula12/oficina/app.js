const entrada = require('readline-sync');
const oficina = require('./funcoesOficina');

console.log("SISTEMA DE GESTÃO DE OFICINA");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Tempo de uso (meses):");

const total = oficina.calcularOrcamento(peca, horas);
const OrcamentoComDesconto = oficina.valorComDesconto(total);

const garantia = oficina.verificarGarantia(tempoUso);

console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Orcamento com 20% de desconto: R$ ${OrcamentoComDesconto.toFixed(2)}`);
console.log(`Status Garantia: ${garantia}`);
console.log("------------------------------------")
