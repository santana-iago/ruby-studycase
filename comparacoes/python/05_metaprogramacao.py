class Config:
    def __init__(self, **valores):
        self.valores = valores

def opcao(nome, padrao):
    def getter(self):
        return self.valores.get(nome, padrao)
    setattr(Config, nome, property(getter))

opcao("cache", True)
opcao("idioma", "pt-BR")
print(Config(cache=False).cache)
print(Config().idioma)
