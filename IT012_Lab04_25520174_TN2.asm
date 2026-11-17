# Ma nguon 3 – if / else
.text
.globl main
main:
  addi $s0, $zero, 4    # i = 4
  addi $s1, $zero, 4    # j = 4
  addi $s2, $zero, 10   # g = 10
  addi $s3, $zero, 3    # h = 3
  bne  $s0, $s1, Else   # neu i != j thi nhay den Else
  add  $s4, $s2, $s3    # f = g + h
  j    Exit
Else:
  sub  $s4, $s2, $s3    # f = g – h
Exit:
  li   $v0, 10
  syscall


# Ma nguon 4 – gia lenh nhanh
.text
.globl main
main:
  addi $t0, $zero, 90
  addi $t1, $zero, 100
  bge  $t0, $t1, Nho
  addi $t2, $zero, 1
Nho:
  li   $v0, 10
  syscall


# Ma nguon 5 – phan bac dien nang
.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"
 
.text
.globl main
main:
  li  $v0, 4
  la  $a0, prompt
  syscall
  li  $v0, 5            # doc kWh, ket qua o $v0
  syscall
  add $s0, $v0, $zero   # $s0 = dien nang (kWh)
  
  addi $a1, $zero, 100	# >>> xac dinh bac (1..4) theo Bang 6, dat vao $s1
  addi $s1, $zero, 1
  
VONG_LAP:
  ble $s0, $a1, End  
  addi $s1, $s1, 1
  addi $a1, $a1, 50
  j VONG_LAP
  
End:
  li $v0, 1		 # >>> in “Bac: “, roi $s1, roi xuong dong
  addi $a0, $s1, 0
  syscall
  li $v0, 4
  la $a0, nl
  syscall
  
  li  $v0, 10
  syscall


