.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"

.text
.globl main
main:
    
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    li $v0, 5
    syscall
    add $s0, $v0, $zero
    li $v0, 5
    syscall
    add $s1, $v0, $zero
    li $v0, 5
    syscall
    add $s2, $v0, $zero
    li $v0, 5
    syscall
    add $s3, $v0, $zero
    
    sub $s0, $s1, $s0	# >>> usage1 = reading1 - reading0
    sub $s1, $s2, $s1	# >>> usage2 = reading2 - reading1
    sub $s2, $s3, $s2	# >>> usage3 = reading3 - reading2
    add $s3, $s0, $s1	# >>> total = usage1 + usage2 + usage3   (hai lenh add)
    add $s3, $s3, $s2
    
    li $v0, 4	# >>> Thang 1: <usage1>
    la $a0, m1
    syscall
    li $v0, 1
    add $a0, $s0, $zero
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    li $v0, 4	# >>> Thang 2: <usage2>
    la $a0, m2
    syscall
    li $v0, 1
    add $a0, $s1, $zero
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    li $v0, 4	# >>> Thang 3: <usage3>
    la $a0, m3
    syscall
    li $v0, 1
    add $a0, $s2, $zero
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    li $v0, 4	# >>> Tong:    <total>
    la $a0, tot
    syscall
    li $v0, 1
    add $a0, $s3, $zero
    syscall
    
    li $v0, 4
    la $a0, nl
    syscall
    
    li   $v0, 10
    syscall
