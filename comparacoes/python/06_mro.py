class Pedido:
    def finalizar(self):
        return "pedido confirmado"

class Auditoria:
    def finalizar(self):
        print("[log] iniciando finalizacao")
        return super().finalizar()

class PedidoAuditado(Auditoria, Pedido):
    pass

print(PedidoAuditado().finalizar())
print(" -> ".join(classe.__name__ for classe in PedidoAuditado.__mro__))
# A ordem do MRO depende da heranca; prepend altera a cadeia Ruby.
