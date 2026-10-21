evento = {"tipo": "pedido", "dados": {"id": 42, "valor": 180}}

match evento:
    case {"tipo": "pedido", "dados": {"id": identificador, "valor": valor}} if valor >= 100:
        print(f"Pedido {identificador}: frete gratis (R$ {valor})")
    case {"tipo": "pedido", "dados": {"id": identificador}}:
        print(f"Pedido {identificador}: frete normal")
    case _:
        print("Evento nao reconhecido")
