Descripción estructural, comportamental y de máquinas de estados, a través del diseño de un subconjunto del juego de instrucciones del microprocesador MIPS I

El programa que ejecutará se trata de un algoritmo de ordenación (Bubblesort) que almacena el vector a ordenar ({0, 1, 2, 3, 4, 5, 6, 7}) en las posiciones de memoria 1016-1023. Así, pueden observarse
estas posiciones de memoria para comprobar la correcta ejecución del algoritmo (resultado: {7, 6, 5, 4, 3, 2, 1, 0}).

Se pretende implementar este procesador en la placa de prototipado y utilizar los displays de 7 segmentos disponibles para visualizar los datos almacenado en las últimas ocho posiciones de memoria. Para el procesador estas direcciones
serán 4064–4092, ya que las direcciona por byte, mientras que en el BRAM serán 1016–1023, al direccionarse por palabra de 32 bits (se corresponden con la dirección del procesador dividida por 4, lo que elimina los dos últimos bits que siempre son “00”). Reduciendo
suficientemente la frecuencia de funcionamiento del procesador será posible visualizar cómo bubblesort ordena el vector de números leído de memoria (vector inicial: [0, 1, 2, 3, 4, 5, 6, 7] -> vector final: [7, 6, 5, 4, 3, 2, 1, 0]).

La implementación en la placa de prototipado consta del propio procesador, dos divisores de frecuencia, la lógica correspondiente a la gestión de los displays de 7 segmentos y el conversor de hexadecimal a 7 segmentos.

Se utilizará un divisor de frecuencia para reducir la frecuencia de funcionamiento del procesador a 200 Hz (200 ciclos de reloj por segundo), y el otro se utilizará para que la gestión de los displays
de 7 segmentos funcione a la frecuencia necesaria para que puedan visualizarse datos en los displays (dividiendo por 12500, por ejemplo). Estos divisores de frecuencia actuarán como señales de habilitación del procesador y de la gestión de displays de 7 segmentos (contador en anillo, registro para retrasar la habilitación y acceso externo a memoria del procesador), respectivamente.

![image](https://github.com/user-attachments/assets/a65587c9-e040-4e0d-84b9-0da20108a8d6)

![image](https://github.com/user-attachments/assets/079710cc-d863-4e21-8be0-2ca17ad85b71)

Javier Fortuño Martí.
