module Torneo where
	import Data.List

	generarTorneos :: [a] -> [[a]]
	generarTorneos [] = [[]]
	generarTorneos (x:xs) = concat [intercala x ys | ys <- generarTorneos xs]

	intercala :: a -> [a] -> [[a]]
	intercala x [] = [[x]]
	intercala x (y:ys) = (x:y:ys) : [y:zs | zs <- intercala x ys]

	orden :: (Ord a) => [[a]] -> [a]
	orden [[]] = []
	orden (x:xs) = if listaord x then x else orden xs

	listaord ::(Ord a) => [a] -> Bool
	listaord [] = False
	listaord [x] = True
	listaord (x:y:ys) = if x <= y then listaord (y:ys) else False

	horarios :: (Ord a) => [a] -> [a]
	horarios [] = []
	horarios (x:xs) = (x : horarios xs)

	numUniques :: (Eq a) => [a] -> Int
	numUniques = length . nub

	inter ::(Eq a) =>  [a] -> [a] -> [a]
	inter xs ys = xs `intersect` ys

	pertenece ::(Eq a) => a -> [a] -> Bool
	pertenece n [] = False
	pertenece n (x:xs) =  if (n == x) then True else pertenece n xs
	
	validar ::(Eq a) => (Num a) => [a] -> a -> Bool
	validar (x:xs) n | (x==1) = pertenece n (inter [1,5,8,10,4,6] [1,2,6,9,3]) -- Cambiar la lista por una definida como j1 j2
					 | (x==2) = pertenece n (inter [1,5,8,10,4,6] [2,3,5,7,10]) -- j1 j3
	 				 | (x==3) = pertenece n (inter [1,5,8,10,4,6] [3,4,6,8,1,10]) -- j1 j4
					 | (x==4) = pertenece n (inter [1,5,8,10,4,6] [4,7,9,10,1]) -- j1 j5
					 | (x==5) = pertenece n (inter [1,2,6,9,3] [2,3,5,7,10]) -- j2 j3
	 				 | (x==6) = pertenece n (inter [1,2,6,9,3] [3,4,6,8,1,10]) -- j2 j4
	 				 | (x==7) = pertenece n (inter [1,2,6,9,3] [4,7,9,10,1]) -- j2 j5 
	 				 | (x==8) = pertenece n (inter [2,3,5,7,10] [3,4,6,8,1,10]) -- j3 j4
	 				 | (x==9) = pertenece n (inter [2,3,5,7,10] [4,7,9,10,1]) -- j3 j5
	 				 | (x==10) = pertenece n (inter [3,4,6,8,1,10] [4,7,9,10,1]) --j4 j5	 	 			 	 				 	 				 	 	 				 	 				 	 				 				 	
					 | otherwise = True			 

	posibleJuego ::(Eq a) => (Num a) => [a] -> a -> Bool
	posibleJuego [] n = True
	posibleJuego (x:xs) n = ((validar [x] n) && (posibleJuego xs (n+1)))

	juegos ::(Eq a) => (Enum a)=> (Num a) => [[a]] -> [a]
	juegos [] = []
	juegos (x:xs) | posibleJuego x 1 = x
				  | otherwise = juegos xs
	