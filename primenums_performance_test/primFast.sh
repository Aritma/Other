#!/bin/bash

################################################
#Jmeno: prvocisla.sh
#Pouziti: ./prvocisla.sh <horni hranice mnoziny>
#Priklad: ./prvocisla.sh 100
#
#Script pracuje s polem hodnot, pro zjisteni prvocisel pouziva
#postupnou vylucovaci metodu, kde behem prochazeni pole odstranuje
#vsechny hodnoty, ktere nemohou byt prvocislem.
#Prvocislo nesmi byt delitelne jinym cislem nez cislem 1 a samo sebou.
#Libovolne nasobky dvou cisel vetsich nez 1 nemohou byt prvocisla
#Algoritmus vyuziva principy Eratosthenova sita (to musi vzdy pracovat s kompletni mnozinou)
#
#Pozn.
#Array je pomala konstrukce, jejich tvorba je velmi pomala, samotna iterace nad stejnym array je vyrazne rychlejsi
#Zbytecne opakovani operaci je nezadouci, bash neumi sam optimalizovat opakovany kod
################################################

Max=$1							#horni hranice mnoziny
Array=($(seq 0 $Max))					#pole hodnot od 0 do Max - pouziva array

for x in "${Array[@]}"; do				#for cyklus nad vsemi hodnotami pole
	if [ $x -gt 1 ]; then				#pro cisla vetsi nez 1
		Pocet=$((Max/x))			#pocet nasobku cisla x v mnozine
		if [ $Pocet -ge $x ]; then		#pokud je pocet hodnot mensi nez hodnota, byly jiz vsechny vyskyty nasobku tohoto cisla vyrazeny v predchozich cyklech (hned v prvnim cyklu /2 napriklad zmizi vsechna suda cisla)
			for i in $(seq $x $Pocet); do	#prochazime pouze hodnoty od cisla x do Pocet, ktere jeste nebyly vyrazeny
				Pos=$((x*i))		#Pos jsou nasobky cisla v danem rozsahu
				Array[$Pos]=0		#vsechna cisla, ktera jsou nasobkem kterychkoli dvou cisel od 2 vys nemuzou byt prvocisla, v poli je zmenime na cislo 0 (rychlejsi metoda nez menit rozsah pole, mazat nebo presouvat)
			done
		fi
	else
		Array[$x]=0				#cislo 1 neni prvocislo
	fi
	if [ ${Array[$x]} -gt 1 ]; then			#vsechny hodnoty 0 a 1 jsou vynechany
		echo -n "${Array[$x]} "			#vsechny hodnoty co v poli zustaly (nejsou 0 nebo 1) jsou prvocisla
	fi
done
echo							#odradkovani na konci scriptu


