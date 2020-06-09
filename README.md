# TSSOO-taller01

Autor: Fabián Rozas Alfaro
correo: Fabian.rozas@alumnos.uv.cl


Diseño de la solución: 

Se utilizó el mismo diseño para el problema 1, 2 y 3. Debido que nos pedian buscar el total, promedio, el max y el min en cada uno de ellos. 

Primero que todo, se deben almacenar todos los archivos descargados de cada simulación en tres array distintos (uno para executionSummary-NNN.txt, otro para summary-NNN.txt, y otro para usePhone-NNN.txt). Después se recorren los array, buscando y realizando la sumas respectivas. 

En el primer problema se buscan las sumas de timeExecMakeAgents + timeExecCal + timeExecSim en el array de executionSummary y se almacenan en un archivo. Luego para sacar el min, el max y el promedio entramos al nuevo archivo que almacena el tiempo de simulación total de cada uno. Finalmente al obtener el min, max, promedio y el total simulacion o la suma de todas las simulaciones, se almacenan en un archivo llamado metrics.txt y luego se elimina el archivo intermedio. 
Ahora para sacar el min, max, promedio y total de la suma de la memoria por las simulaciones se utiliza el mismo diseño anterior, buscando y realizando las sumas en la columna que correspondan a la memoria. Para luego almacenar los resultados en el mismo archivo metrics.txt y eliminar los intermedios. 

El segundo problema se debe calcular las sumas del tiempo de evacuación de todas las personas simuladas la cual se encuentra en el array de summary, y estas sumas se almacenan en un nuevo archivo. Luego para calcular el total, promedio, min y max se debe entrar en el nuevo archivo y almacenar los resultados en evacuation.txt eliminando los archivos intermedios. Así mismo se deben de encontrar el total, promedio, min y max del tiempo de evacuación pero de los siguientes grupos o tipos de personas simuladas. También almacenando el resultado en el archivo evacuation.txt 

Y finalmente para el último problema, al igual que los dos anteriores, se deben de encontrar el promedio, min y max pero en este caso del uso de teléfonos moviles para cada uno de los instantes de tiempo especificados de cada simulación. Es decir, que se deben encontrar la cantidad de personas que utilizaron el télefono en un determinado tiempo de cada simulación, y almacenarlos en un archivo. Luego para calcular el promedio, el max y el min en un tiempo determinado, se debe de buscar todos los resultados en del determinado tiempo, calculando el promedio de estos, el min y el max. Para finalmente almacenarlos en un archivo llamado usePhone-stats-txt. Así se debe hacer con todos los instantes de tiempo de las simulaciones, quedando el archivo con los 3600 instantes, junto a su promedios, max y min relacionado al uso de télefonos de todas las simulaciones. Sin olvidar eliminar los archivos intermedios. 

