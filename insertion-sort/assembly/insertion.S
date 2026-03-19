# key
# t0: i
# t1: array[i]
# t2: current value
# t3: j
# t4: array[j]
# t5: value at array[j]

.data
	array: .word 4, 5, -1, 100, 1, 22 # array
	n: .word 6 # array size

.text

	lw a1, n # a1 = array size
	la a0, array # a0 = array address
	li t0, 1 # i = 1

for_loop:
	bge t0, a1, end
	slli t1, t0, 2 # compute address array[i]
	add t1, a0, t1 # adding offset to base address of array
	lw t2, 0(t1)
	addi t3, t0, -1 # j = i - 1

while_loop:
	blt t3, x0, insert
	slli t4, t3, 2 # compute address array[j]
	add t4, a0, t4 # adding offset to base address of array
	lw t5, 0(t4) # loading array[j]

	ble t5, t2, insert
	sw t5, 4(t4) # value at array[j+1] = array[j]
	addi t3, t3, -1 # j = j - 1
	beq x0, x0, while_loop

insert:
	slli t4, t3, 2 # array[j] = j + offset 4
	add t4, a0, t4 # adding offset to base address of array
	sw t2, 4(t4) # storing array[j + offset] into current value
	addi t0, t0, 1 # i = i + 1
	beq x0, x0, for_loop

end:
	li a7, 10
	ecall
