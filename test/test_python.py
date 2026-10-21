import subprocess
import sys
import unittest
from pathlib import Path

BASE = Path(__file__).resolve().parents[1] / "comparacoes" / "python"
CASOS = {
    "04_lazy.py": "[128, 256, 512, 1024, 2048, 4096]\n",
    "05_metaprogramacao.py": "False\npt-BR\n",
    "08_pattern_matching.py": "Pedido 42: frete gratis (R$ 180)\n",
}

class ComparacoesPythonTest(unittest.TestCase):
    def test_execucoes(self):
        for arquivo, saida in CASOS.items():
            with self.subTest(arquivo=arquivo):
                resultado = subprocess.run([sys.executable, str(BASE / arquivo)],
                                          capture_output=True, text=True, check=True)
                self.assertEqual(resultado.stdout, saida)
                self.assertEqual(resultado.stderr, "")

    def test_prepend_vs_mro(self):
        resultado = subprocess.run([sys.executable, str(BASE / "06_mro.py")],
                                  capture_output=True, text=True, check=True)
        self.assertIn("[log] iniciando finalizacao\npedido confirmado\n", resultado.stdout)
        self.assertIn("PedidoAuditado -> Auditoria -> Pedido -> object", resultado.stdout)

if __name__ == "__main__":
    unittest.main()
