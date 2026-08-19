// const entrada = require("readline-sync");

// console.log("===REGISTRO DE TEMPERATURAS===");

// const temperaturas = [];

// const quantidade = entrada.questionInt("Quantas temperaturas deseja registrar? ");

// for(let i= 0; i < quantidade; i++) {
//     let temperatura = entrada.questionFloat(`Temperatura ${i+1}: `);
//     temperaturas.push(temperatura);
// }
// console.log("\n--- RELATÓRIO ---");
// console.log(`Temperaturas registradas: ${temperaturas.join (" °C | ")} °C`)

// Mostrar a quantidade de registros
// Mostrar a primeira tempratura
// Mostrar a última temperatura

const entrada = require("readline-sync");

console.log("===REGISTRO DE TEMPERATURAS===");

const temperaturas = [];

const quantidade = entrada.questionInt("Quantas temperaturas deseja registrar? ");

for(let i= 0; i < quantidade; i++) {
    let temperatura = entrada.questionFloat(`Temperatura ${i+1}: `);
    temperaturas.push(temperatura);
}
console.log("\n--- RELATÓRIO ---");
console.log(`Temperaturas registradas: ${temperaturas.join (" °C | ")} °C`)
console.log(`Quantidade de registros: ${temperaturas.length}`);
console.log(`primeira temperatura registrada: ${temperaturas[0]}`)
console.log(`ultima temperatura registrada: ${temperaturas[temperaturas.length -1]}`)
