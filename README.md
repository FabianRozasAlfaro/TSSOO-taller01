# Explicación del diseño de la solución

Autor: Fabián Rozas Alfaro

Correo: Fabian.rozas@alumnos.uv.cl

El diseño consiste básicamente en el análisis y posterior funcionamiento del script, basado en los requerimientos de cada uno de los problemas planteados en el taller 1. Esté debe de poder lograr  un orden de los comandos de Linux, realizando cada una de los problemas requeridos y finalmente una implementación exitosa.    
Los problemas son los siguientes:

•	Problema 1: Se necesita el tiempo de simulación y la memoria utilizada por la simulación.

•	Problema 2: Se necesitan los cálculos de todas las personas simuladas, Residentes, Visitantes tipo I, Residentes separados por grupo etario y Visitantes tipo I separados por grupo etario.

•	Problema 3: Se necesita el cálculo del úso de teléfonos en el instate de tiempo específico.

Se utilizó un diseño similar para los 3 problemas, puesto que se pide buscar el total de estos datos y poder calcular el promedio, max y el min en cada uno de ellos.
Primero que todo, se deben de buscar los archivos descargados de cada simulación y almacenarlos en tres array distintos (uno para todos los archivos executionSummary-NNN.txt, otro para summary-NNN.txt, y otro para usePhone-NNN.txt). Después se recorren los array, buscando y realizando la sumas, o extracción de datos respectivos.

En el primer problema, se realiza la extracción de las sumas que se componen por los campos de timeExecMakeAgents, timeExecCal y timeExecSim, que se encuentran en el array dónde están almacenados todos los archivos de executionSummary-NNN.txt. Los resultados de las sumas se almacenan en un nuevo archivo. Estas sumas representan el tiempo de simulación total para cada executionSummary-NNN.txt. Luego para sacar el min, el max y el promedio visualizamos el tiempo de simulación total de cada una de las simulaciones almacenadas en el nuevo archivo. Finalmente al obtener el min, max, promedio y la suma total del tiempo de todas las simulaciones, se almacenan en un archivo llamado ‘metrics.txt’.

Ahora para sacar el min, max, promedio y suma total de la memoria utlizada por las simulaciones, se utiliza el mismo diseño anterior. Se busca en el array la columna o campo que representa la memoria utilizada, y realizando las sumas correspondientes para almacenarlas en un nuevo archivo. Luego, se calcula el promedio, max y min en dicho archivo. Para almacenar los resultados en el archivo ‘metrics.txt’. 

En el segundo problema se debe calcular las sumas del tiempo de evacuación de todas las personas simuladas. Dicho campo se encuentra en los archivos de summary-NNN.txt, que como dicho anteriormente se almacenaron en un array. Se extraen los campos necesarios para realizar las sumas del tiempo de evacuación y se almacenan en un nuevo archivo. Luego, para calcular el total, promedio, min y max se debe entrar en el nuevo archivo, realizar las operaciones correspondientes y almacenar los resultados en ‘evacuation.txt’. Así mismo se deben de encontrar el total, promedio, min y max del tiempo de evacuación, pero de los siguientes grupos o tipos de personas simuladas, y también almacenar los resultados en el archivo evacuation.txt.

Para el último problema, al igual que los dos anteriores, se pide encontrar y calcular el promedio, min y max. Pero, en este caso se basan en el campo del úso de teléfonos móviles para cada uno de los instantes de tiempo especificados en los archivos de usePhone-NNN.txt almacenados en el array correspondiente. Es decir, que se deben encontrar la cantidad de personas que utilizaron el télefono en un determinado tiempo de cada simulación, y almacenarlos en un archivo. Luego para calcular el promedio, el max y el min en un tiempo determinado, se debe de buscar en dicho archivo todos los resultados en el determinado tiempo, calculando el promedio de estos, el min y el max. Para finalmente almacenar los resultados en un archivo llamado ‘usePhone-stats.txt’. 
