# Ma nguon 6 – duyet va in mang reading
.data
nl:      .asciiz "\n"
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
 
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 13   # n = 13
Loop:
  beq  $s2, $s3, Done   # i == n thi thoat
  sll  $t1, $s2, 2      # $t1 = 4 * i
  add  $t1, $t1, $s0    # $t1 = dia chi reading[i]
  lw   $a0, 0($t1)      # $a0 = reading[i]
  li   $v0, 1
  syscall	
  li   $v0, 4
  la   $a0, nl
  syscall
  addi $s2, $s2, 1      # i = i + 1
  j    Loop
Done:
  li   $v0, 10
  syscall

# Ma nguon 7 - du lieu
.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
reading: .word 1080, 1289, 1533, 1792, 2026, 2215, 2369
         .word 2493, 2597, 2696, 2810, 2954, 3123
usage:   .space 48

# Ma nguon 8 – dien nang tung thang
.text
.globl main
main:
  la   $s0, reading     # $s0 = dia chi nen reading
  la   $s1, usage       # $s1 = dia chi nen usage
  addi $s2, $zero, 0    # i = 0
  addi $s3, $zero, 12   # n = 12 thang
Loop:
  beq $s2, $s3, Done	# >>> thoat neu i == nl
  sll $t1, $s2, 2	# 25520174(dung $t1 luu buoc nhay, $t2 luu dia chi nen cau cac mang trong reading) tinh dia chi reading[i]
  add $t2, $s0, $t1
  lw $t3, 0($t2)	# 25520174 $t3 = reading[i], $t4 = reading[i+1]
  lw $t4, 4($t2)
  sub $t5, $t4, $t3	# 25520174 $t5 = $t4 - $t3 (dien nang thang i+1)
  add $t6, $s1, $t1	# 25520174($t6 luu dia chi nen cua cac mang trong usage) tinh dia chi usage[i], luu $t5 vao usage[i]
  sw $t5, 0($t6)
  add $s4, $s4, $t5     # 25520174 c?ng d?n ?i?n n?ng các tháng vào $s4
  
Check_Max:		# 25520174 
  bne $s2, $zero, MAX
  add $s5, $zero, $t5  
  j Print
  
MAX:
  blt $s5, $t5, UPDATE_MAX
  j Print

UPDATE_MAX:
  add $s5, $zero, $t5
  add $s6, $zero, $s2

Print:
  li $v0, 4		# 25520174 in “Thang “, i+1, “: ", $t5, xuong dong
  la $a0, m1
  syscall
  li $v0, 1
  addi $a0, $s2, 1
  syscall
  li $v0, 4
  la $a0, m2
  syscall
  li $v0, 1
  add $a0, $zero, $t5
  syscall
  li $v0, 4
  la $a0, nl
  syscall
  addi $s2, $s2, 1	# >>> i = i + 1, quay lai Loop
  j Loop
  
Done:
  li $v0, 4
  la $a0, mt
  syscall
  li $v0, 1
  add $a0, $zero, $s4
  syscall
  li $v0, 4
  la $a0, nl
  syscall
  li $v0, 4
  la $a0, mm
  syscall
  li $v0, 1
  addi $a0, $s6, 1
  syscall
  li $v0, 4
  la $a0, lp
  syscall
  li $v0, 1
  add $a0, $zero, $s5
  syscall
  li $v0, 4
  la $a0, rp
  syscall 
  li   $v0, 10
  syscall
  
  
