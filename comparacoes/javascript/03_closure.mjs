function criarDesconto(porcentagem) {
  return preco => Number((preco * (1 - porcentagem / 100)).toFixed(2));
}
const cupom = criarDesconto(25);
console.log([50, 100, 140].map(cupom));
console.log(cupom(80));
console.log(criarDesconto(10)(80));
