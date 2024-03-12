# Servicios BIOS de E/S

Este repositorio contiene un programa simple de edición de texto para la terminal, escrito en lenguaje ensamblador para sistemas x86. 

Este programa usa la funciones de las interrupciones 10h y 16h para poder emular el funcionamiento de introducción de texto de una terminal.

El programa permite al usuario escribir texto directamente en la pantalla, con soporte para manejar teclas especiales y comandos básicos de edición.

## Características

- **Escritura en tiempo real**: se van imprimiendo los caracteres que el usuario introduzca por teclado.
- **Soporte para teclas especiales**: se incluye el uso de teclas como _BACKSPACE_ para borrar o _INTRO_ para un salto de línea.
- **Limpieza de pantalla**: al pulsar la combinación de teclas _CTRL + INTRO_ se borrara toda la pantalla.
- **Movimiento del cursor**: el programa actualiza y maneja la posición del cursor conforme el usuario escribe o borra texto.

## Puesta en marcha

### Requisitos

Para ejecutar este programa, necesitarás un entorno que pueda compilar y ejecutar código ensamblador para la arquitectura x86, como DOSBox o un sistema operativo real DOS.

### Compilación y ejecución

1. Tienes que tener instalado un ensamblador compatible como _nasm_.
2. Una vez instalado, tienes que compilar el archivo _.asm_ mediante el siguiente comando:
	```console
	nasm -f bin file_name.asm -o file_name.com
	```
	Siendo _file_name_ el nombre de tu archivo
3. Una vez compilado, ejecuta el archivo es un entorno DOS. Si usamos DOSBox tendremos que ejecutar el siguiente comando dentro del directorio donde se encuentren los archivos _.asm_ y _.com_.
	```console
	dosbox `pwd`
	```
	Se nos abrirá el programa, si presionamos el tabulador, se nos pondrá el nombre del programa, si presionamos _INTRO_ ya estaremos ejecutando el programa.

### Uso

-  **Escribir texto**: Simplemente comienza a escribir para ver los caracteres aparecer en pantalla.
-  **Borrar**: Presiona _BACKSPACE_ para borrar el último carácter escrito.
-  **Nueva línea**: Presiona _INTRO_ para mover el cursor a la siguiente línea.
-  **Salir**: Presiona _ESC_ para terminar la ejecución del programa.
-  **Limpiar pantalla**: Mantén presionado _CTRL_ y presiona _INTRO_ para limpiar la pantalla.
