#!/bin/bash

#PROBLEMA 1
#se almacenan en un array los archivos executionSummary.txt
array=(`find . -name '*.txt' | sort | grep execution | grep -v '._'`)

#podemos ver con
#echo ${array[@]}
# que nos almacenó todos los archivos executionSummary.txt en un array

#eliminamos todo lo que contenga en el archivo sum.txt
#ya que cada vez que ejecutamos el codigo guardaremos
cat /dev/null > sum.txt
#ahora recorremos este array y almacenamos las sumas en sum.txt
for i in "${array[@]}"; do $i | chmod +x $i | cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$6+$7+$8} END{print sum}' >> sum.txt; done

#eliminamos lo que contenga metricts.txt por la misma razon de sum.txt
cat /dev/null > metrics.txt
#########
echo tsimTotal:promedio:min:max >> metrics.txt
#sacamos el min, el max, el promedio y el total de la suma
cat sum.txt | awk 'BEGIN{min=9999999999; max=0}{ if($1<min){min=$1}; if($1>max){max=$1}; total+=$1; count+=1;} END{print total":"total/count":"min":"max}' >> metrics.txt

#eliminamos todo lo que contenga sum.txt para volver a ocupar este archivo
rm sum.txt
#recorremos el array y almacenamos en sum.txt las sumas de la memoria utilizada por todas las simulaciones
for i in "${array[@]}"; do $i | chmod +x $i | cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$10} END{print sum}' >> sum.txt ; done

echo memUsed:promedio:min:max >> metrics.txt
#sacamos el min, el max, el promedio y el total de la suma de  memoria utilizada por todas las simulaciones
cat sum.txt | awk 'BEGIN{min=9999999999; max=0}{ if($1<min){min=$1}; if($1>max){max=$1}; total+=$1; count+=1;} END{print total":"total/count":"min":"max}' >> metrics.txt

#mostramos los resultados
more metrics.txt
#eliminamos todos los archivos intermedios
rm sum.txt

