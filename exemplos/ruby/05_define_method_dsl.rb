class Config
  def self.opcao(nome, padrao:)
    define_method(nome) { @valores.fetch(nome, padrao) }
  end
  def initialize(**valores) = @valores = valores
  opcao :cache, padrao: true
  opcao :idioma, padrao: "pt-BR"
end
puts Config.new(cache: false).cache
puts Config.new.idioma
