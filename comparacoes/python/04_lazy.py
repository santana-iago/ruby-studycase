from itertools import count, islice

potencias = (2 ** expoente for expoente in count())
filtro = (n for n in potencias if n >= 100)
print(list(islice(filtro, 6)))
# Uma generator expression como em Ruby, nao calcula a sequencia inteira.
