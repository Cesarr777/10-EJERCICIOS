![Cool Text - Cesar Alexis Peuelas CrdenasNmero de Estudiante 22210335Instituc 469857915740730](https://github.com/user-attachments/assets/7e948af8-cb38-43c5-bf60-90d9e00e949b)


# 50 PROGRAMAS EN ENSAMBLADOR

## Descripción
Este repositorio contiene una colección de 50 programas desarrollados en lenguaje ensamblador (Assembly) en la arquitectura ARM64. Estos ejercicios abarcan diferentes aspectos y desafíos de la programación de bajo nivel, permitiendo explorar y entender cómo se comunican directamente el software y el hardware. A través de estos programas, se busca fortalecer las habilidades en ensamblador y mejorar la comprensión de la arquitectura del procesador, el manejo de memoria, y la optimización de código.

## Objetivo del Repositorio
El objetivo de este repositorio es documentar y compartir los aprendizajes obtenidos en el desarrollo de programas en ensamblador, un lenguaje de bajo nivel que permite un control preciso sobre el hardware. Los programas están diseñados para ser educativos, abordando desde operaciones simples hasta implementaciones más complejas, como algoritmos de ordenamiento o manipulación de bits. Este proyecto representa un esfuerzo por dominar los conceptos fundamentales de ensamblador y aplicar buenas prácticas en la programación de bajo nivel.

## Estructura del Contenido
Cada programa está bien documentado y contiene comentarios que explican su funcionamiento y propósito. Además, cada uno incluye una breve introducción sobre lo que realiza el código, sus entradas y salidas, y en algunos casos se detallan posibles aplicaciones prácticas. Esta estructura está diseñada para facilitar la comprensión de cada programa y su ejecución.

### Enlace a las Grabaciones
Para complementar el aprendizaje, se han realizado grabaciones de la ejecución de los programas en un entorno de desarrollo en RaspbianOS, usando la arquitectura ARM64. Estas grabaciones muestran los pasos de compilación, ejecución y depuración en tiempo real, ayudando a visualizar el flujo de trabajo típico de desarrollo en ensamblador:

- **Programas 1-10**: [Ver grabación](https://asciinema.org/a/3O7OGjaO3WSvS3ojHwNzqa64v)
- **Programas 11-20**: [Ver grabación](https://asciinema.org/a/As2FDs2LW3S29muAqxiE1y3Y2)
- **Programas 21-30**: [Ver grabación](https://asciinema.org/a/5QJIjcaUtgps3aJZNmkzuhvsx)
- **Programas 31-40**: [Ver grabación](https://asciinema.org/a/Zl0rWfcbnnprexoqtkh9naZ0d)
- **Programas 41-50**: [Ver grabación](https://asciinema.org/a/link_programa_41_50)

Cada enlace lleva a una sesión de `asciinema`, permitiendo reproducir y estudiar cada paso en el proceso de desarrollo.

## Temas Aprendidos
A lo largo de estos programas se han puesto en práctica y consolidado los siguientes conceptos clave en ensamblador:

- **Manejo de registros**: Aprendimos a utilizar registros como `R0`, `R1`, etc., para almacenar y manipular datos. Los registros son variables de alta velocidad dentro del procesador y su uso eficiente es crucial para la optimización del código.
  
- **Instrucciones aritméticas y lógicas**: Profundizamos en operaciones como suma, resta, multiplicación, división, y en operaciones de manipulación de bits (AND, OR, XOR, NOT). Estas operaciones son fundamentales para la mayoría de los algoritmos y permiten manejar datos en un nivel granular.

- **Acceso y manipulación de memoria**: Exploramos cómo leer y escribir en posiciones de memoria específicas, utilizando punteros y direcciones de memoria. También aprendimos sobre la importancia de la alineación de datos en memoria y su impacto en el rendimiento del sistema.

- **Estructuras de control**: Implementamos estructuras de control como bucles (`while`, `for`) y condicionales (`if`, `else`) mediante instrucciones de salto y comparaciones directas. La programación en ensamblador requiere un enfoque diferente para implementar estas estructuras, lo cual nos ayuda a entender cómo funcionan a nivel de hardware.

- **Llamadas a funciones y manejo de la pila**: Estudiamos cómo invocar subrutinas y manejar el retorno de funciones, usando la pila para almacenar el contexto de llamadas anidadas. Aprender a manejar la pila manualmente es crucial para programas complejos en ensamblador.

- **Optimización de código**: La escritura de código en ensamblador permite optimizar el uso de los recursos del procesador. Aprendimos técnicas para reducir la cantidad de instrucciones y mejorar la eficiencia del código, lo cual es fundamental para aplicaciones donde el rendimiento es crítico.

## Requisitos
Para ejecutar estos programas, necesitarás:

1. Un entorno ARM64 compatible con RaspbianOS (como una Raspberry Pi).
2. Instalación de herramientas de desarrollo para ensamblador, como:
   - **as** (GNU Assembler): Utilizado para compilar los archivos de código fuente.
   - **ld** (GNU Linker): Utilizado para enlazar los archivos objeto y generar ejecutables.

## Ejecución
Cada programa puede ser compilado, enlazado y ejecutado utilizando los siguientes comandos en la terminal:

```bash
# Compilar el archivo de código fuente a un archivo objeto
as -o programa.o programa.s

# Enlazar el archivo objeto y generar el ejecutable
ld -o programa programa.o

# Ejecutar el programa
./programa



