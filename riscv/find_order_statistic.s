# find_order_statistic.s
.text
find_order_statistic:
.globl find_order_statistic
    # a0 = address of array
    # a1 = array_length
    # a2 = k

    li a3, 0 # a3 = j - outer loop counter
outer_loop:
    bgeu a3, a1, outer_loop_exit # outer loop exit condition (!(j < array_length))
    
    li a4, 1 # a4 = i - inner loop counter
inner_loop:
    bgeu a4, a1, inner_loop_exit # inner loop exit condition (!(i < array_length))
    
    slli a5, a4, 2 # a5 = i * 4 bc sizeof(int) = 4, now a5 is byte-shift address of i-th element
    add a5, a5, a0 # a5 = address of array[i]
    addi a6, a5, -4 # a6 = address of array[i - 1]
    
    lw t1, 0(a6) # t1 = array[i - 1]
    lw t2, 0(a5) # t2 = array[i]
    bgeu t2, t1, skip_swap # if (array[i] >= array[i - 1]) goto skip_swap;
    sw t1, 0(a5) # Mem[a5] = t1 = array[i - 1]
    sw t2, 0(a6) # Mem[a6] = t2 = array[i]
skip_swap:
    addi a4, a4, 1 # i++
    jal zero, inner_loop # next inner loop iteration
inner_loop_exit:
    addi a3, a3, 1 # j++
    jal zero, outer_loop # next outer loop iteration
outer_loop_exit:    
    addi a2, a2, -1 # a2 = k - 1
    slli a2, a2, 2 # a2 = (k - 1) * 4
    add a2, a2, a0 # a2 = (k - 1) * 4 + address of first element of array = address of (k-1)-th element
    lw a0, 0(a2) # a0 = (k-1)-th element = answer		
    ret # return (k-1)-th element;
