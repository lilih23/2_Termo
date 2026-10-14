const fs = require('fs');

console.log("=== SISTEMA DE MONITORAMENTO INDUSTRIAL ===");

const sensores = [
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 45.5, status: "Operando"},
    {codigo: 1002, tipo: "Temperatura", leituraAtual: 4, status: "Operando"},
    {codigo: 1003, tipo: "Temperatura", leituraAtual: 145.5, status: "Alerta!"},
];
const valoresGravados = JSON.stringify(sensores,null, 2);

fs.writeFileSync('sensores.json', valoresGravados);

console.log(`\nValores gravados com sucesso.`);