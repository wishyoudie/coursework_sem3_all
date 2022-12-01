# main.s
.text
main:
.globl main
    addi sp, sp, -16 # malloc
    sw ra, 12(sp)    # save ra

    la a0, array
    lw a1, array_length
    lw a2, k
    call find_order_statistic	# a0 = findOrderStatistic(array, array_length, k);

    la t0, answer
    sw a0, 0(t0) # Mem[t0] = a0 = (k-1)-th element
finish:
    lw ra, 12(sp)    # restore ra
    addi sp, sp, 16  # free
    li a0, 0
    ret      # return 0;
    
.rodata
array_length: 
    .word 6
k:            
    .word 3
.data
array:        
    .word 4, 3, 5, 7, 2, 8
answer:       
    .word 0