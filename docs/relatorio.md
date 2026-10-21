# Projeto — Ruby: o que eu acho interessante na linguagem

**CEFET-MG — Engenharia de Computação — Linguagens de Programação**  
**Aluno:** Iago Soares Santana  
**Linguagem:** Ruby puro, com Rails tratado à parte  
**Códigos:** Ruby 3.3.8; oito exemplos de até dez linhas cada.

## Introdução: por que escolhi olhar Ruby com calma

Conheci Ruby há alguns anos, lendo o Fabio Akita no blog AkitaOnRails. É curioso voltar a um conteúdo que parecia apenas uma introdução e perceber quantos detalhes ele escondia. Akita contribuiu durante anos publicando explicações técnicas sobre Ruby e Ruby on Rails. Hoje eu acompanho o material dele principalmente pelos textos de computação em geral e, mais recentemente, sobre IA e LLMs. Voltei aos antigos tutoriais para montar este estudo de caso. Para o professor Andrei, que comentou em aula que ainda não conhecia o trabalho dele, deixo a indicação: é um divulgador de conteúdo técnico e prático que vale acompanhar.

O que me prende na linguagem é que ela trata valores como objetos e permite recuperar, combinar e até construir comportamentos em tempo de execução. Mas minha impressão não é que a linguagem seja mágica. A mesma liberdade que deixa código elegante pode virar abuso de metaprogramação. Conhecer Ruby em profundidade serve justamente para separar uma solução bem pensada de uma esperteza desnecessária.

É quase impossível não associar Ruby a Ruby on Rails. A popularização do framework explica boa parte disso, mas Ruby é a linguagem e Rails é um conjunto de bibliotecas e convenções. Ao longo do relatório eu separo os dois. Os **oito exemplos abaixo são Ruby puro**, sem gems; as comparações e as referências ao Rails ficam como contexto.

## 1. Tudo é objeto — até o operador de soma

**Código:** [01_tudo_e_objeto.rb](../exemplos/ruby/01_tudo_e_objeto.rb).

**Explicação:** em Ruby, 7 + 5 pode ser expresso como 7.+(5). O operador + é um método do objeto inteiro. Posso recuperar esse método com method(:+) e invocá-lo com call. O programa também exibe as classes de true, nil, String e do símbolo :ruby.

**Justificativa:** gosto desse exemplo porque não é apenas uma curiosidade sintática. A orientação a objetos de Ruby aparece inclusive nos tipos básicos e na reflexão. O primeiro Micro-Tutorial do Akita foi uma boa referência para pensar nessa consistência [1].

**Comparação — Java:** um int primitivo não é um objeto Java; existe Integer para representá-lo como objeto. Ruby não faz essa distinção no nível da linguagem. Não significa que o custo de execução dos dois modelos seja igual. [Código Java](../comparacoes/java/Main.java).

## 2. Um método que pertence a um objeto só

**Código:** [02_metodo_de_um_objeto.rb](../exemplos/ruby/02_metodo_de_um_objeto.rb).

**Explicação:** acrescento apresentar ao objeto perfil sem modificar todos os objetos da classe Object. A consulta a singleton_methods e à singleton_class torna visível o mecanismo.

**Justificativa:** acho esse caso uma ótima porta de entrada para eigenclasses e lookup. É poderoso em adaptações pontuais e testes, mas abusar disso pode esconder comportamento. A tradução de um texto de Yehuda Katz publicada no AkitaOnRails aprofunda self e metaprogramação [5].

**Comparação — JavaScript:** posso atribuir uma função só a perfil, e outro objeto não a terá. O resultado se parece, mas em JavaScript estamos lidando com uma propriedade cujo valor é função, não com a singleton class do Ruby. [Código JavaScript](../comparacoes/javascript/02_metodo_por_objeto.mjs).

## 3. Closure: uma função que se lembra do contexto

**Código:** [03_closure_e_proc.rb](../exemplos/ruby/03_closure_e_proc.rb).

**Explicação:** criar_desconto recebe uma porcentagem e devolve uma lambda. Mesmo quando o método já terminou, a lambda ainda conhece aquele valor. Em Ruby ela é um Proc, e o &cupom a passa como bloco para map.

**Justificativa:** em vez de produzir um número, o método produz uma regra reutilizável. Blocos e closures aparecem por toda parte em APIs idiomáticas do Ruby. O artigo Anatomia de Ruby Blocks/Closures foi especialmente útil aqui [4].

**Comparação — JavaScript:** closures também preservam variáveis do escopo onde nasceram, mas a forma de passar o comportamento para Array.map é diferente. Não é uma funcionalidade exclusiva do Ruby; o interessante é a integração de blocos com métodos e Proc. [Código JavaScript](../comparacoes/javascript/03_closure.mjs).

## 4. Enumeradores lazy e uma sequência infinita

**Código:** [04_enumerator_lazy.rb](../exemplos/ruby/04_enumerator_lazy.rb).

**Explicação:** Enumerator.produce gera potências de dois sem um fim definido. lazy faz a seleção ser avaliada sob demanda; first(6) percorre só o trecho necessário para retornar seis resultados.

**Justificativa:** isso pode economizar memória quando não preciso materializar um fluxo inteiro. É um exemplo de composição de comportamentos que parece simples, mas exige entender quando a avaliação acontece. Não significa que lazy seja sempre mais rápido.

**Comparação — Python:** generators e itertools permitem avaliação adiada parecida. Python também resolve muito bem esse tipo de problema. O que muda é a forma como Ruby encadeia mensagens entre objetos Enumerator. [Código Python](../comparacoes/python/04_lazy.py).

## 5. Metaprogramação: um pedaço de DSL em dez linhas

**Código:** [05_define_method_dsl.rb](../exemplos/ruby/05_define_method_dsl.rb).

**Explicação:** o método de classe opcao chama define_method, criando novos métodos de instância com nomes escolhidos em tempo de execução. O resultado parece uma mini linguagem de configuração: opcao :cache, padrao: true.

**Justificativa:** esse talvez seja meu exemplo favorito. Entender que a declaração dentro do corpo da classe é apenas uma chamada de método ajuda a entender várias APIs do Rails. Mas ela funciona perfeitamente fora dele. O Micro-Tutorial III do Akita explora métodos dinâmicos [3].

**Comparação — Python e Rails:** Python pode usar setattr e property para acrescentar atributos dinamicamente. Rails usa recursos equivalentes da própria linguagem para escrever APIs como validates :cliente, presence: true; essa última chamada, porém, depende do ActiveRecord. [Código Python](../comparacoes/python/05_metaprogramacao.py).

## 6. prepend, super e a ordem dos métodos

**Código:** [06_prepend_e_super.rb](../exemplos/ruby/06_prepend_e_super.rb).

**Explicação:** Auditoria entra na frente de Pedido na cadeia de busca de métodos. Quando finalizar é chamado, o módulo registra a operação e usa super para continuar a busca na implementação original.

**Justificativa:** acho interessante poder adicionar um comportamento transversal sem reescrever a classe inteira. Em projetos grandes, porém, isso exige testes e atenção ao lookup. A FAQ oficial do Ruby detalha o funcionamento de prepend [10].

**Comparação — Python:** mixins e MRO resolvem problema semelhante usando a ordem das classes na herança múltipla, mas não são a mesma operação do prepend. [Código Python](../comparacoes/python/06_mro.py).

## 7. Refinements: alterando um comportamento sem abrir a classe globalmente

**Código:** [07_refinements.rb](../exemplos/ruby/07_refinements.rb).

**Explicação:** refine acrescenta slug para String. O using ativa o refinement em um escopo léxico; ele não aparece como método próprio de String em toda a aplicação. O programa imprime false antes de ativar, depois o slug e, por fim, false na consulta aos métodos de instância definidos diretamente na classe.

**Justificativa:** gostei desse exemplo porque responde a um risco do monkey patching: afetar todo o programa para resolver uma necessidade local. Refinements têm detalhes de escopo que precisam ser estudados; não são um sistema de isolamento absoluto [11].

**Comparação — C#:** extension methods permitem escrever "texto".Slug(), mas são resolvidos estaticamente pelo compilador. Ruby usa lookup dinâmico com refinements ativados no escopo. A semelhança está na intenção, não na implementação. [Código C#](../comparacoes/csharp/07_refinements_vs_extensions.cs).

## 8. Pattern matching com desestruturação e intervalo

**Código:** [08_pattern_matching.rb](../exemplos/ruby/08_pattern_matching.rb).

**Explicação:** o case ... in examina um Hash aninhado que representa um pedido. Além de conferir a estrutura e o tipo do evento, ele extrai id e valor; a expressão (100.. => valor) combina comparação de intervalo com a captura da variável. Se não passar, tenta outro padrão.

**Justificativa:** são menos condicionais soltas e fica mais explícito o formato de entrada esperado. É útil para eventos e mensagens estruturadas. Assim como nas outras ferramentas, um padrão complexo demais pode piorar a leitura.

**Comparação — Python:** match/case também desestrutura dicionários, mas a restrição de valor no exemplo é escrita como guard: if valor >= 100. [Código Python](../comparacoes/python/08_pattern_matching.py).

## E o Rails?

Quando penso em aplicação web convencional — rotas, banco, validação, CRUD, organização de controller e testes — entendo muito bem o sucesso de Rails. Ele pega a expressividade do Ruby e acrescenta convenções, ferramentas e integração. Um validação do ActiveRecord parece quase português: validates :cliente, presence: true. Mas não existe esse método no Ruby puro: é o framework criando sua própria DSL.

Eu não escolheria Rails para tudo. Bibliotecas de IA e ciência de dados puxam muita gente para Python. Para infraestrutura de baixo nível, existem ferramentas mais apropriadas. A melhor linguagem sempre depende do problema, das bibliotecas e da equipe. Isso aparece até no artigo recente do Akita que compara linguagens na programação com LLMs [7].

## O lugar do Ruby em 2026

Tenho a sensação de que Ruby perdeu espaço nas escolhas mais comuns de quem começa um projeto hoje, principalmente porque Python se tornou quase um idioma padrão para scripts, automação, dados e IA. Quanto mais gente usa Python, mais bibliotecas e exemplos surgem; isso alimenta sua escolha por iniciantes e também por equipes experientes. A curva de aprendizagem ajuda, mas a disponibilidade de ecossistema e profissionais conta muito.

Há indicadores para essa diferença de visibilidade: a pesquisa Stack Overflow 2025 registra crescimento de sete pontos percentuais na adoção de Python em relação a 2024, e o GitHub Octoverse 2025 aponta Python entre as linguagens com mais contribuintes e muito presente em projetos de IA [12][13]. Esses levantamentos não provam, por si só, que o número absoluto de usuários de Ruby esteja caindo. Meu argumento é mais sobre a **perda de protagonismo relativo**, especialmente fora do Rails. O próprio sucesso histórico do Rails talvez tenha deixado Ruby mais associada a uma só área do que deveria.

Ainda considero Ruby uma linguagem que vale a pena estudar. Nem toda técnica que aprendi aqui será usada no próximo sistema, mas entender closures, lookup, DSLs e metaprogramação mudou meu jeito de enxergar outras linguagens. Para mim, isso já justifica o trabalho.

## Referências

A lista comentada de fontes e links está em [fontes.md](fontes.md). O leitor também pode executar os exemplos e reproduzir os testes conforme [testes.md](testes.md). A interpretação e as comparações são minhas; os códigos são exercícios próprios inspirados pelas leituras.
