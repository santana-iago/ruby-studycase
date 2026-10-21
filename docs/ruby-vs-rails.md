# Ruby não é Rails. Mas é difícil falar de Ruby sem falar dele.

O Ruby on Rails colocou Ruby diante de muito mais gente. O que chamou atenção foi a quantidade de convenções que o framework resolve: estrutura de aplicação, MVC, rotas, ORM, migrations, validations, renderização e testes. Ruby, por sua vez, oferece blocos, reflexão, metaprogramação, módulos e uma sintaxe enxuta. O Rails usa essas ferramentas para criar uma linguagem de domínio para aplicações web.

No exemplo 05 do trabalho, escrevi a expressão 'opcao :cache, padrao: true'. Ela parece uma declaração especial, mas é só uma chamada de método executada no corpo da classe. O Rails faz algo parecido quando escrevemos 'validates :cliente, presence: true' ou 'has_many :comentarios'. A declaração é Ruby; o comportamento implementado é do framework.

**Ruby puro:** posso escrever scripts, ferramentas CLI, parsers, pequenos serviços, tarefas de automação e bibliotecas sem carregar toda a estrutura de uma aplicação web. Boa liberdade para criar APIs expressivas.

**Rails:** para aplicações web com regras de negócio, CRUD, persistência, autenticação, formulários e equipes que aceitam convenções, resolve muito trabalho repetitivo. Muitas vezes é uma excelente troca.

**Quando escolher outra coisa?** Computação científica e treinamento de modelos têm ecossistema especialmente forte em Python. Sistemas de baixo nível podem exigir Rust ou C++. Concorrência massiva e certos tipos de serviços têm vantagens em outros ambientes. É mais interessante medir as restrições do projeto do que defender uma linguagem como identidade pessoal.

O texto de Akita de 11/10/2026 compara também **Ruby puro x Ruby on Rails** em uma tarefa de fila e mostra por que é fácil fazer uma comparação injusta quando o gargalo real está em outro componente do sistema: https://akitaonrails.com/2026/10/11/existem-linguagens-melhores-pra-programar-com-llms/

## Sobre a menor visibilidade do Ruby

Tenho a impressão de que Ruby aparece muito menos nas conversas sobre projetos novos do que Python e TypeScript, especialmente perto de IA, dados e automação. Isso não significa que Ruby parou de ser usado ou que seu total absoluto de usuários esteja necessariamente em queda: faltam dados comparáveis para afirmar isso. O Stack Overflow Developer Survey 2025 registra um salto de sete pontos percentuais na adoção de Python, e o Octoverse 2025 mostra Python crescendo entre contribuintes e dominando projetos de IA. Essa rede de bibliotecas, tutoriais, colegas e vagas torna mais fácil uma equipe começar por Python e continuar usando Python.

Rails também criou uma associação tão forte com a linguagem que, fora do mundo web, muita gente nem considera Ruby. Para mim, isso é uma perda: o aprendizado de Ruby puro continua valioso, mesmo se o próximo projeto for escrito em outra linguagem. Em equipes experientes, dá para aproveitar blocos, DSLs e metaprogramação sem transformar o código num quebra-cabeça; a exigência é entender custos de manutenção, instrumentação e desempenho.
