.text
__start:
.globl __start
    la a3 array_length
    lw a3, 0(a3) # a3 = array_length
    
    la a6, array # a6 = address of first element of array
    
    li a4, 0 # a4 = j - outer loop counter
outer_loop:
    bgeu a4, a3, outer_loop_exit # outer loop exit condition (!(j < array_length))
    
    li a5, 1 # a5 = i - inner loop counter
inner_loop:
    bgeu a5, a3, inner_loop_exit # inner loop exit condition (!(i < array_length))
    
    slli a7, a5, 2 # a7 = i * 4 bc sizeof(int) = 4
    add a7, a7, a6 # a7 = address of array[i]
    addi t0, a7, -4 # t0 = address of array[i - 1]
    
    lw t1, 0(t0) # t1 = array[i - 1]
    lw t2, 0(a7) # t2 = array[i]
    bgeu t2, t1, skip_swap # if (array[i] >= array[i - 1]) goto skip_swap;
    sw t1, 0(a7) # Mem[a7] = t1 = array[i - 1]
    sw t2, 0(t0) # Mem[t0] = t2 = array[i]
skip_swap:
    addi a5, a5, 1 # i++
    jal zero, inner_loop # next inner loop iteration
inner_loop_exit:
    addi a4, a4, 1 # j++
    jal zero, outer_loop # next outer loop iteration
outer_loop_exit:    
    la t0 answer # t0 = address of answer cell
    la a3, k 
    lw a3, 0(a3) # a3 = k

    addi a3, a3, -1 # a3 = k - 1
    slli a3, a3, 2 # a3 = (k - 1) * 4
    add a3, a3, a6 # a3 = (k - 1) * 4 + address of first element of array = address of (k-1)-th element
    lw t1, 0(a3) # t1 = (k-1)-th element		
    sw t1, 0(t0) # Mem[t0] = t1 = (k-1)-th element
   
finish:
    li a0, 10 # finish program
    li a1, 0
    ecall
    
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