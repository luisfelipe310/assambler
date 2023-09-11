.data
    prompt1: .asciiz "Ingrese el primer n�mero: "
    prompt2: .asciiz "Ingrese el segundo n�mero: "
    prompt3: .asciiz "Ingrese el tercer n�mero: "
    max_msg: .asciiz "El n�mero m�s peque�o es: "
    
.text
.globl main

main:
    # Solicitar el primer n�mero
    li $v0, 4
    la $a0, prompt1
    syscall

    # Leer el primer n�mero
    li $v0, 5
    syscall
    move $t0, $v0

    # Solicitar el segundo n�mero
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer el segundo n�mero
    li $v0, 5
    syscall
    move $t1, $v0

    # Solicitar el tercer n�mero
    li $v0, 4
    la $a0, prompt3
    syscall

    # Leer el tercer n�mero
    li $v0, 5
    syscall
    move $t2, $v0

    # Encontrar el minimo
    move $t3, $t0  
    bgt $t1, $t3, check_t1
    move $t3, $t1
check_t1:
    bgt $t2, $t3, check_t2
    move $t3, $t2
check_t2:

    # Mostrar el resultado
    li $v0, 4
    la $a0, max_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Salir del programa
    li $v0, 10
    syscall