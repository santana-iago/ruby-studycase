# Como conferi o que está aqui

## Ambiente inicial

Os oito exemplos Ruby foram rodados com Ruby 3.3.8 (Linux). Saídas esperadas ficam em test/test_exemplos.rb. O teste invoca cada script num processo separado para não deixar uma modificação de classe interferir na próxima.

~~~bash
ruby --version
ruby test/test_exemplos.rb
~~~

Além de conferir a saída, o teste verifica **exatamente oito arquivos Ruby** no diretório e que cada um tem **até dez linhas**. Esse segundo teste importa porque o trabalho acadêmico não permite mais de dez linhas por funcionalidade.

## Comparações externas

~~~bash
python3 -m unittest discover -s test -p 'test_python.py'
node --test test/test_javascript.mjs
javac comparacoes/java/Main.java
java -cp comparacoes/java Main
~~~

O teste Python compara saídas e a resolução de métodos do exemplo com MRO. O Node executa dois exemplos e compara as saídas com resultados esperados. O Java mostra o contraste entre o primitivo int e Integer como objeto; o C# fica como exemplo conceitual, pois requer compilador .NET próprio e não está coberto pelos testes.

O GitHub Actions roda Ruby, Python, JavaScript e Java em ambiente limpo. A parte de Rails **não está incluída no CI**: é uma demonstração para colar em um projeto gerado com rails new; veja rails_demo/README.md.

## Limites honestos do estudo

- Esses exemplos verificam comportamento, não rendimento em produção.
- 'Método singleton' Ruby não é a mesma implementação de propriedade com função no JavaScript.
- 'Refinement' Ruby não é o mesmo mecanismo de extension method C#.
- Um exemplo com MRO do Python não é uma implementação idêntica de prepend.
- Não interpretei saídas de exemplos como benchmark de memória, velocidade ou escalabilidade.
- Os prints do relatório representam saídas da execução Ruby e podem ser regenerados localmente pelo comando ruby.

## Primeira execução automática

O workflow foi executado no commit ced93480dd43976a201e38119afe56b550725f0b, com conclusão **success** em 21/10/2026. [Ver execução no GitHub Actions](https://github.com/santana-iago/ruby-studycase/actions/runs/39527272097). Essa execução valida apenas as tarefas incluídas no workflow, não os arquivos Rails e C#.
