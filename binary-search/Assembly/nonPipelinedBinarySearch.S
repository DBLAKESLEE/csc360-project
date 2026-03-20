#single.highNot: 54/54
#single.lowNot: 44/44
#single.deepYes: 50/50
#5stage.highNot: 86/54
#5stage.lowNot: 77/44
#5stage.deepYes: 78/50

.data
array:  .word 10, 22, 35, 40, 45, 50, 62, 70, 88, 99  # Sorted array
len:    .word 10                                     # Array length
target: .word 612                                     # Value to find

.text
main:
    la a2, array      # x12: Base address of array
    lw a3, len        # x13: Length
    lw a4, target     # x14: Search value
    
    jal ra, BINARY    # Call the procedure
    
    li a7, 10         # Exit
    ecall

# --- Binary Search Procedure ---
#x10 a0: return
#x12 a2: &A[]
#x13 a3: length of array
#x14 a4: search value
#x28 t3: left
#x29 t4: right
#x30 t5: middle
#x31 t6: temp (used for A[middle])


BINARY:
#init left and right
addi t3, zero, 0
addi t4, a3, -1


LOOP:
blt t4, t3, FAIL

#calculate middle
add t5, t3, t4
srli t5, t5, 1

#get A[middle]
slli t6, t5, 2
add t6, t6, a2
lw t6, 0(t6)


#check if found it
bne a4, t6, IN_UPPER_HALF
addi a0, t5, 0
jalr zero, x1, 0

IN_UPPER_HALF: #value in upper half
bge t6, a4, IN_LOWER_HALF
#L = M + 1
addi t3, t5, 1
beq zero, zero, LOOP

IN_LOWER_HALF: #value in lower half
#R = M - 1
addi t4, t5, -1
beq zero, zero, LOOP


FAIL:
addi a0, zero, -1
jalr zero, x1, 0