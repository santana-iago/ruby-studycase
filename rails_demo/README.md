# O mesmo assunto, mas agora com Rails

Estes arquivos são uma **sobreposição para uma aplicação Rails gerada pelo comando rails new**. Não existe aqui um aplicativo Rails completo (faltam boot, Gemfile.lock, credenciais, configurações etc.). Preferi deixar isso claro, em vez de fingir que meia dúzia de arquivos é um projeto pronto.

## Para testar em um projeto Rails real

~~~bash
gem install rails
rails new pedidos_demo --api
cd pedidos_demo
~~~

Copie os arquivos deste diretório para as mesmas pastas da aplicação gerada. A migration fornecida herda de ActiveRecord::Migration[8.0]; se sua versão de Rails for diferente, ajuste o número de versão da migration para uma versão suportada pelo projeto.

~~~bash
bin/rails db:migrate
bin/rails test test/models/pedido_test.rb
bin/rails server
~~~

Você pode testar com:

~~~bash
curl -X POST http://localhost:3000/pedidos \
  -H "Content-Type: application/json" \
  -d '{"pedido":{"cliente":"Ana","total":180}}'
curl http://localhost:3000/pedidos
~~~

O que é do Ruby? A classe, métodos, lambda do scope, hashes e blocos. O que é do Rails? ApplicationRecord, validations, scope como API do ActiveRecord, recursos REST do router, ActionController e a conexão com banco.

**Importante:** os testes deste diretório exigem um aplicativo Rails real. Eles não fazem parte da suíte Ruby puro do GitHub Actions e **não foram executados neste ambiente**. Este experimento não conta entre os oito exemplos do professor.
