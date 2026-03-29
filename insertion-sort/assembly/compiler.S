.data
    array: .word 4, 5, -1, 100, 1, 22
    n: .word 6
    
.text
    lw a1, n
    la a0, array

insertionSort:
        li      a7, 2
        blt     a1, a7, LBB0_8
        addi    a6, a0, 4
        li      t1, 1
        mv      t0, a6
        li      t2, 1
        j       LBB0_4
LBB0_2:
        addi    a5, a5, -2
LBB0_3:
        slli    a5, a5, 2
        addi    t2, t2, 1
        addi    a7, a7, 1
        add     a5, a5, a6
        sw      a2, 0(a5)
        addi    t0, t0, 4
        beq     t2, a1, LBB0_8
LBB0_4:
        slli    a2, t2, 2
        add     a2, a2, a0
        lw      a2, 0(a2)
        mv      a4, t0
        mv      a5, a7
LBB0_5:
        lw      a3, -4(a4)
        bge     a2, a3, LBB0_2
        sw      a3, 0(a4)
        addi    a5, a5, -1
        addi    a4, a4, -4
        blt     t1, a5, LBB0_5
        li      a5, -1
        j       LBB0_3
LBB0_8:
        li a7, 10
        ecall
        ret
