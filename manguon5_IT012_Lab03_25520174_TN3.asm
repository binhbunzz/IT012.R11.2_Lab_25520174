# Ma nguon 5 - in mot thong bao va mot so nguyen
.data
msg:   .asciiz "Dien nang (kWh): "
nl:    .asciiz "\n"

prompt1: .asciiz "Nhap chi so cu (kWh): "
prompt2: .asciiz "Nhap chi so moi (kWh): "
label:   .asciiz "Dien nang (kWh): "
newline: .asciiz "\n"

prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"
 
.text
.globl main
main:
    addi $t0, $zero, 150
    li   $v0, 4              # dich vu 4: in chuoi
    la   $a0, msg            # doi so: dia chi cua msg
    syscall
    li   $v0, 1              # dich vu 1: in so nguyen
    add  $a0, $t0, $zero     # doi so: so can in
    syscall
    li   $v0, 4              # in xuong dong
    la   $a0, nl
    syscall
    li   $v0, 10             # dich vu 10: ket thuc
    syscall


# Ma nguon 6 - dien nang tieu thu giua hai chi so
main:
    # --- doc chi so cu vao $s0 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall
    li   $v0, 5              # dich vu 5: doc so nguyen, ket qua o $v0
    syscall
    add  $s0, $v0, $zero     # giu gia tri trong $s0
 
    # >>> doc chi so moi vao $s1 (in prompt2, roi dich vu 5)
    li	 $v0, 4
    la	 $a0, prompt2
    syscall
    li 	 $v0, 5
    syscall
    add  $s1, $v0, $zero
 
    # >>> usage = current - previous, vao $t0
    sub  $t0, $s1, $s0
    # >>> in label, roi usage (dich vu 1), roi newline
    li	 $v0, 4
    la   $a0, label
    syscall
    
    li 	 $v0, 1
    add $a0, $t0, $zero 	 
    syscall
    
    li	 $v0, 4
    la	 $a0, newline
    syscall
    
    li   $v0, 10
    syscall

#ma nguon 7
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
