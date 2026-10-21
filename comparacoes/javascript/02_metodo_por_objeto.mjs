const perfil = {};
perfil.apresentar = () => "Sou um objeto com metodo proprio";
const outro = {};
console.log(perfil.apresentar());
console.log(Object.hasOwn(perfil, "apresentar"));
console.log(Object.hasOwn(outro, "apresentar"));
// No JS e uma propriedade-funcao; no Ruby, um metodo da singleton class.
