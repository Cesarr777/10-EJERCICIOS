// ChatGPT 4o - Fecha: 2024-10-07
// Programa en ARM64 Assembly para RaspbianOS que pide dos números y muestra la suma
// Grabar esta corrida en asciinema.org, con tus generales de estudiante, seguido de la compilación, ejecución, depuración en GEF.
// Recuerda vincular tu asciinema a tu correo para evitar que se borre en 7 días.
/* using System;

class Program
{
    static void Main()
    {
        // Solicitar al usuario la cantidad de elementos
        Console.Write("Ingrese la cantidad de elementos: ");
        if (!int.TryParse(Console.ReadLine(), out int cantidadElementos) || cantidadElementos <= 0)
        {
            Console.WriteLine("Número inválido.");
            return;
        }

        // Crear un arreglo para almacenar los elementos ingresados
        int[] elementos = new int[cantidadElementos];

        // Leer cada número del usuario y almacenarlo en el arreglo
        for (int i = 0; i < cantidadElementos; i++)
        {
            Console.Write("Ingrese un numero: ");
            if (!int.TryParse(Console.ReadLine(), out elementos[i]))
            {
                Console.WriteLine("Número inválido.");
                return;
            }
        }

        // Encontrar el valor máximo en el arreglo
        int maximo = elementos[0];
        for (int i = 1; i < cantidadElementos; i++)
        {
            if (elementos[i] > maximo)
            {
                maximo = elementos[i];
            }
        }

        // Mostrar el valor máximo
        Console.WriteLine("El valor máximo es: " + maximo);
    }
}
*/

// Programa en ARM64 Assembly para RaspbianOS que encuentra el máximo en un arreglo
// El usuario ingresa los elementos del arreglo, y el programa muestra el valor máximo.

// ChatGPT 4o - Fecha: 2024-10-07
// Programa en ARM64 Assembly para RaspbianOS que pide dos números y muestra la suma
// Grabar esta corrida en asciinema.org, con tus generales de estudiante, seguido de la compilación, ejecución, depuración en GEF.
// Recuerda vincular tu asciinema a tu correo para evitar que se borre en 7 días.

.data
    prompt1:    .asciz "Ingrese el primer numero: "  // Mensaje para pedir el primer número
    prompt2:    .asciz "Ingrese el segundo numero: " // Mensaje para pedir el segundo número
    resultMsg:  .asciz "Resultado de la suma: "      // Mensaje para mostrar el resultado
    newline:    .asciz "\n"                          // Nueva línea
    buffer:     .space 100                           // Espacio reservado para leer el número ingresado
    resultBuffer: .space 12                          // Buffer para almacenar el resultado como cadena

.text
    .global _start

_start:
    // Pedir el primer número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt1                // Dirección del mensaje "Ingrese el primer numero"
    mov x2, #26                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el primer número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar el número
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir el primer número leído (en ASCII) a un entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función de conversión
    mov w4, w0                      // Almacenar el primer número en w4

    // Pedir el segundo número
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =prompt2                // Dirección del mensaje "Ingrese el segundo numero"
    mov x2, #27                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Leer el segundo número
    mov x0, #0                      // Descriptor de archivo para STDIN
    ldr x1, =buffer                 // Dirección del buffer para almacenar el número
    mov x2, #100                    // Longitud máxima a leer
    mov x8, #63                     // Syscall para 'read' (63)
    svc #0                          // Ejecutar syscall

    // Convertir el segundo número leído (en ASCII) a un entero
    ldr w1, =buffer                 // Dirección del buffer
    bl atoi                         // Llamar a la función de conversión
    mov w5, w0                      // Almacenar el segundo número en w5

    // Sumar los dos números
    add w6, w4, w5                  // Realizar la suma y almacenar el resultado en w6

    // Mostrar mensaje "Resultado de la suma: "
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultMsg              // Dirección del mensaje "Resultado de la suma"
    mov x2, #21                     // Longitud del mensaje
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Convertir el resultado a ASCII y almacenar en el buffer
    mov w0, w6                      // Mover el resultado de la suma a w0
    ldr x1, =resultBuffer           // Dirección del buffer para el resultado
    bl itoa                         // Llamar a la función para convertir el número a ASCII

    // Mostrar el contenido del buffer resultante
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =resultBuffer           // Dirección del buffer que contiene el resultado convertido
    mov x2, #12                     // Longitud máxima del buffer de resultado
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Imprimir una nueva línea para separar el resultado del prompt de la shell
    mov x0, #1                      // Descriptor de archivo para STDOUT
    ldr x1, =newline                // Dirección del carácter de nueva línea
    mov x2, #1                      // Longitud de un carácter
    mov x8, #64                     // Syscall para 'write' (64)
    svc #0                          // Ejecutar syscall

    // Terminar el programa
    mov x8, #93                     // Syscall para 'exit' (93)
    svc #0                          // Ejecutar syscall

// Función atoi: convierte una cadena ASCII a un entero
// Entrada: w1 = dirección de la cadena
// Salida: w0 = número entero
atoi:
    mov w0, #0                      // Inicializar el resultado a 0
    mov w9, #10                     // Valor 10 en w9 para las multiplicaciones
atoi_loop:
    ldrb w2, [x1], #1               // Cargar el siguiente carácter de la cadena
    sub w2, w2, '0'                 // Convertir carácter ASCII a valor numérico
    cmp w2, #9                      // Si es mayor que 9, fin de cadena
    bhi atoi_done
    mul w0, w0, w9                  // Multiplicar el resultado por 10 usando el registro w9
    add w0, w0, w2                  // Agregar el dígito al resultado
    b atoi_loop                     // Repetir para el siguiente carácter
atoi_done:
    ret                             // Retornar con el resultado en w0

// Función itoa: convierte un entero a una cadena ASCII
// Entrada: w0 = número entero
// Salida: x1 = dirección de la cadena donde se almacena el resultado
itoa:
    mov x2, x1                      // Copiar la dirección del buffer al registro de trabajo
    add x2, x2, #11                 // Mover el puntero al final del espacio reservado
    mov w9, #10                     // Valor 10 en w9 para las divisiones
itoa_loop:
    udiv w3, w0, w9                 // Dividir el número por 10 usando w9
    msub w4, w3, w9, w0             // Obtener el dígito restante
    add w4, w4, '0'                 // Convertir el dígito a ASCII
    sub x2, x2, #1                  // Retroceder el puntero
    strb w4, [x2]                   // Almacenar el dígito en la cadena
    mov w0, w3                      // Continuar con el cociente
    cbnz w0, itoa_loop              // Repetir mientras haya dígitos
    mov x0, x2                      // Retornar la dirección del inicio de la cadena en x0
    ret                             // Retornar


    https://asciinema.org/a/3O7OGjaO3WSvS3ojHwNzqa64v
