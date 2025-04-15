# Bubble Sort for 7 elements stored at 8-byte intervals
# Starting at memory address 0
# Register usage:
# x18: Base address (0)
# x19: Array length (7) 
# x8: i (outer loop counter)
# x9: j (inner loop counter)
# x10: Current element address
# x11: Next element address
# x14, x15: Values for comparison
# x20: Swap flag

# Initialize
addi x18, x0, 0        # Base address = 0
addi x19, x0, 7        # Array length = 7
addi x8, x0, 0         # i = 0

outer_loop:
    addi x20, x0, 0        # Reset swap flag
    beq x8, x19, done      # If i == length, exit (array is sorted)
    
    addi x9, x0, 0         # j = 0
    sub x21, x19, x8       # length - i
    addi x21, x21, -1      # length - i - 1 (inner loop bound)
    
inner_loop:
    beq x9, x21, inner_done # If j == bound, exit inner loop
    
    # Calculate address of a[j]
    slli x10, x9, 3        # j * 8 (byte offset)
    add x10, x10, x18      # base + j*8
    
    # Calculate address of a[j+1]
    addi x22, x9, 1        # j + 1
    slli x11, x22, 3       # (j+1) * 8
    add x11, x11, x18      # base + (j+1)*8
    
    # Load values
    ld x14, 0(x10)         # Load a[j]
    ld x15, 0(x11)         # Load a[j+1]
    
    # Compare and swap if needed
    blt x15, x14, swap     # If a[j+1] < a[j], swap
    
continue_loop:
    addi x9, x9, 1         # j++
    beq x0, x0, inner_loop # Continue inner loop
    
swap:
    sd x15, 0(x10)         # a[j] = a[j+1]
    sd x14, 0(x11)         # a[j+1] = a[j]
    addi x20, x0, 1        # Set swap flag (a swap occurred)
    beq x0, x0, continue_loop
    
inner_done:
    beq x20, x0, done      # If no swaps occurred, we're done
    addi x8, x8, 1         # i++
    beq x0, x0, outer_loop # Continue outer loop
    
done:
    # Program is complete - array is sorted