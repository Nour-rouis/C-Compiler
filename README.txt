Etape 1 : Exécution de la fichier bison 
Bison -d structfe.y
Il va apparaitre 2 autre fichier :- structfe.tab.c : code source de l’analyseur syntaxique 
					    - structfe.tab.h : fichier intermédiaire entre flex et bison(contient les symboles terminaux retourné par flex et que bison l’utilise dans la grammaire)  

Etape 2 : 
Flex -o struct-Frontend.c ANSI-C.l 
	Créer struct-Frontend.c à partir de ANSI-C.l
	struct-Frontend.c  C’est le code de l’analyseur lexicale 
Etape 3 : 
on va compiler le fichier structfe.tab.c : 
gcc -o structfe.out structfe.tab.c 
	Créer structfe.out (un exécutable, le produit finale de l’analyseur syntaxique ) à partir de structfe.tab.c (code source de l’analyseur syntaxique)
	structfe.out  C’est le code de l’analyseur syntaxique  
Etape 4 : Lancer l’analyseur syntaxique sur le fichier  :
structfe.out main.txt