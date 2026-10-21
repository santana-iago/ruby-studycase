# Ruby: estudo de caso (e algumas comparações honestas)

Esse repositório nasceu de um trabalho de Linguagens de Programação do CEFET-MG, mas eu quis aproveitar a oportunidade para investigar uma linguagem que me chama atenção há anos. Meu primeiro contato com Ruby aconteceu pelo blog [AkitaOnRails](https://akitaonrails.com/), do Fabio Akita. Voltei a alguns daqueles artigos para entender melhor o que Ruby faz *como linguagem*, antes de falar de Rails.

O que mais gosto no Ruby é a consistência do seu modelo de objetos: um inteiro responde a métodos, uma classe é um objeto e até um método pode ser obtido como objeto. Também acho interessante como a linguagem recompensa experiência. Aprender metaprogramação dá liberdade; aprender quando **não** fazer metaprogramação dá responsabilidade.

Não acredito em uma linguagem universalmente melhor. Quero entender o que Ruby resolve bem, o que outras linguagens fazem de maneira diferente e quando vale escolher cada uma. O texto do Akita sobre [linguagens e LLMs](https://akitaonrails.com/2026/10/11/existem-linguagens-melhores-pra-programar-com-llms/) foi uma referência particularmente boa para essa discussão.

## Como o projeto está organizado

- **exemplos/ruby/**: oito exemplos independentes de Ruby puro, cada um com **no máximo dez linhas**. Estes são os oito exemplos do trabalho.
- **comparacoes/**: programas de comparação em Java, JavaScript, Python e C#. São experimentos complementares; não entram no limite de linhas dos oito exemplos.
- **test/**: testes dos oito exemplos e das comparações em Python/JavaScript.
- **docs/relatorio.md**: texto do relatório com Código, Explicação, Justificativa e comparação para cada exemplo.
- **docs/fontes.md**, **docs/testes.md** e **docs/ruby-vs-rails.md**: referências, instruções de reprodução e limitações.

## Os oito assuntos

| Ruby puro | Comparação | O que quis observar |
| --- | --- | --- |
| 01 — Tudo é objeto | Java | operador como método; primitivos x objetos |
| 02 — Método de um único objeto | JavaScript | método singleton e propriedade própria |
| 03 — Closure e Proc | JavaScript | captura de contexto e passagem de comportamento |
| 04 — Enumerator::Lazy | Python | fluxo infinito e avaliação sob demanda |
| 05 — define_method | Python | criação dinâmica de uma pequena DSL |
| 06 — prepend e super | Python | ordem de resolução de métodos |
| 07 — refinements | C# | extensão localizada x método de extensão estático |
| 08 — pattern matching | Python | desestruturação e validação de dados |

Os códigos Ruby usam só recursos da linguagem e da biblioteca padrão; não dependem do Rails nem de gems externas.

## Testando

Requer Ruby 3.2+ para os exemplos com sintaxe moderna. Os testes Ruby usam Minitest, distribuído com muitas instalações de Ruby; se sua distribuição não o incluir, instale a gem minitest.

~~~bash
ruby test/test_exemplos.rb
ruby exemplos/ruby/01_tudo_e_objeto.rb
python3 -m unittest discover -s test -p 'test_python.py'
node --test test/test_javascript.mjs
~~~

Python 3.10+, Node 18+ e JDK são opcionais para as comparações. O arquivo C# é apenas ilustrativo e não foi incluído na suíte automatizada.

Há um workflow do GitHub Actions em .github/workflows/testes.yml para executar automaticamente a parte reproduzível do estudo.

## Sobre Ruby e Rails

Ruby não é Rails. Ruby é a linguagem. Rails é um framework web construído com ela. A associação é compreensível: Rails popularizou Ruby em aplicações web e tira muito proveito da expressividade da linguagem para criar DSLs como validações, rotas e consultas. Mas o objeto do trabalho são **oito recursos de Ruby puro**. As menções ao Rails aqui são comparações conceituais, sem uma aplicação Rails neste repositório.

## Autoria e fontes

Estudo e exemplos didáticos organizados por Iago Soares Santana. Os pequenos programas são exemplos próprios, **inspirados por conceitos** explicados por Fabio Akita e pela documentação oficial — não são transcrições do código do blog. As fontes e os limites das comparações estão documentados em [docs/fontes.md](docs/fontes.md).

Não há benchmark de desempenho aqui; não seria sério tirar conclusões sobre velocidade a partir de oito trechos tão curtos.
