.data
    output_msg: .asciiz "Serie Fibonacci "
    space: .asciiz " "
    
.text
.globl main

main:
    # Inicializar los primeros dos números de la serie
    li $t0, 0  # F(0)
    li $t1, 1  # F(1)
    li $t2, 10 # Cantidad de números en la serie

    # Mostrar mensaje inicial
    li $v0, 4
    la $a0, output_msg
    syscall

    # Bucle para calcular y mostrar la serie
    loop:
        # Mostrar el número actual de la serie
        li $v0, 1
        move $a0, $t0
        syscall

        # Imprimir un espacio
        li $v0, 4
        la $a0, space
        syscall

        # Calcular el siguiente número de la serie
        add $t3, $t0, $t1   # $t3 = $t0 + $t1
        move $t0, $t1       # $t0 = $t1 (F(n-1) se convierte en F(n))
        move $t1, $t3       # $t1 = $t3 (F(n) se convierte en F(n+1))

        # Decrementar el contador
        subi $t2, $t2, 1

        # Comprobar si hemos calculado 10 números
        bnez $t2, loop

    # Salir del programa
    li $v0, 10
    syscall