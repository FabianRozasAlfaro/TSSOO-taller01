#!/bin/bash

############# PROBLEMA 1 ###################
echo PROBLEMA 1
#se almacenan en un array los archivos executionSummary.txt
array=(`find . -name '*.txt' -print | sort | grep execution | grep -v '._'`)

#se recorre el array y se almacenan las sumas en sum.txt
for i in "${array[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$6+$7+$8} END{print sum}' >> sum.txt; done

#eliminamos lo que contenga metricts.txt para que no se guarde todo cada vez que ejecutamos
rm metrics.txt
#########

#sacamos el min, el max, el promedio y el total de la suma y se almacena en metrics.txt
cat sum.txt | awk 'BEGIN{min=9999999999; max=0}{ if($1<min){min=$1}; if($1>max){max=$1}; total+=$1; count+=1;} END{print "tsimTotal:"total/count":"min":"max}' >> metrics.txt

#eliminamos todo lo que contenga sum.txt para volver a ocupar este archivo
rm sum.txt
#recorremos el array y almacenamos en sum.txt las sumas de la memoria utilizada por todas las simulaciones
for i in "${array[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$10} END{print sum}' >> sum.txt ; done

#sacamos el min, el max, el promedio y el total de la suma de  memoria utilizada por todas las simulaciones
cat sum.txt | awk 'BEGIN{min=9999999999; max=0}{ if($1<min){min=$1}; if($1>max){max=$1}; total+=$1; count+=1;} END{print "memUsed:"total/count":"min":"max}' >> metrics.txt

#se muestran resultados
more metrics.txt
#se eliminan los archivos intermedios
rm sum.txt



########### PROBLEMA 2 ###################
echo PROBLEMA 2

array2=(`find . -name '*.txt' -print | sort | grep summary | grep -v '._'`)

#alls
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{sum+=$8; count+=1; if($8<min && $8!=0){min=$8}; if($8>max){max=$8}}END{print sum":"count":"min":"max}' >> sum.txt; done

rm evacuation.txt
cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "alls:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#residents
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==0){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}}END{print sum":"count":"min":"max}' >> sum.txt; done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "residents:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#visitorsI
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==1){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}}END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "visitorsI:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#residents-G0
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==0 && $4==0){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "residents-G0:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#residents-G1
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==0 && $4==1){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "residents-G1:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#residents-G2
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==0 && $4==2){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "residents-G2:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#residents-G3
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==0 && $4==3){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "residents-G3:"total/count":"min":"max}' >> evacuation.txt
rm sum.txt

#visitorsI-G0
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==1 && $4==0){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "visitorsI-G0:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#visitorsI-G1
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==1 && $4==1){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "visitorsI-G1:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#visitorsI-G2
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==1 && $4==2){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "visitorsI-G2:"total/count":"min":"max}' >> evacuation.txt

rm sum.txt

#visitorsI-G3
for i in "${array2[@]}"; do cat $i | grep -v $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0; min=9999999999; max=0}{if($3==1 && $4==3){sum+=$8; count+=1; if($8<min && $8!=0){min=$8};if($8>max){max=$8}}} END{print sum":"count":"min":"max}' >> sum.txt ;done

cat sum.txt | awk -F ':' 'BEGIN{min=9999999999; max=0}{ if($3<min){min=$3}; if($4>max){max=$4}; total+=$1; count+=$2} END{print "visitorsI-G3:"total/count":"min":"max}' >> evacuation.txt

more evacuation.txt
rm sum.txt

########### PROBLEMA 3 ###########
echo "PROBLEMA 3"

array3=(`find . -name '*.txt' -print | sort | grep usePhone | grep -v '._'`)

printf "timestamp:prom:min:max\n" >> $usePhoneOutFile

for i in ${array3[@]};
do
        timeStamp=(`cat $i | tail -n+3 | cut -d ':' -f 2`)
        usePhone=(`cat $i | tail -n+3 | cut -d ':' -f 3`)

        for j in ${timeStamp[@]};
        do
                printf "%d:\n" $j >> $tmpStamp
                timeStampStats=$(cat $tmpStampe | awk -F ':' 'BEGIN{min=999999; max=0}{if($j<min){min=$j};if($j>max){max=$j}{total+=$j; count+=1;} END {print total/count":"min":"max}')
        done

        echo "%i : %i\n" $timeStamp $timeStampStats >> usePhone-stats.txt
        rm -f $tmpUsePhone
        rm -f $tmpStampPhone
done

more usePhone-stats.txt

