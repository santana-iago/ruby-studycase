#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
echo "== Ruby =="
ruby test/test_exemplos.rb
echo "== Python =="
python3 -m unittest discover -s test -p 'test_python.py'
echo "== JavaScript =="
node --test test/test_javascript.mjs
echo "== Java (comparacao) =="
javac comparacoes/java/Main.java
java -cp comparacoes/java Main
