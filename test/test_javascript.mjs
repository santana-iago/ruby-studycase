import test from "node:test";
import assert from "node:assert/strict";
import { execFileSync } from "node:child_process";

const executar = arquivo => execFileSync(process.execPath, ["comparacoes/javascript/" + arquivo],
  { encoding: "utf8" });

test("metodo de um objeto em JavaScript", () => {
  assert.equal(executar("02_metodo_por_objeto.mjs"),
    "Sou um objeto com metodo proprio\ntrue\nfalse\n");
});
test("closure em JavaScript", () => {
  assert.equal(executar("03_closure.mjs"),
    "[ 37.5, 75, 105 ]\n60\n72\n");
});
