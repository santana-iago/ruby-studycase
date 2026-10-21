potencias = Enumerator.produce(1) { |n| n * 2 }
filtro = potencias.lazy.select { |n| n >= 100 }
puts filtro.first(6).inspect
puts potencias.class
puts filtro.class
puts filtro.take(3).force.inspect
