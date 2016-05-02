Pasos para la prueba y chequeo de que es correcto.

1. ghci // Abrir el comp de haskell

2. Prelude > :set +s // Esto genera después de la ejecución el tiempo para ver

3. Prelude > :l cinco.hs // Cargar el archivo 

4. Torneo > head([x|x <- generarTorneos ([1,2,3,4,5,6,7,8,9,10]), posibleJuego x 1]) // Este devuelve el primer torneo valido posible de los generados.

5. Torneo > ([x|x <- generarTorneos ([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]), posibleJuego x 1]) // Con este te manda todos los posibles.