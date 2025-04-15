
# Initialize base address and array size
addi x5, x0, 256      # x5 = base address (256)
addi x6, x0, 7        # x6 = array size (7)
    
# Outer loop (i goes from 0 to n-1)
addi x8, x0, 0        # x8 = i = 0
outer_loop:
    # Check if outer loop is done
    beq x8, x6, done      # If i == size, we're done
    
    # Initialize inner loop
    addi x5, x0, 256      # Reset base address to 256
    
    # Calculate size-i-1 without using sub
    addi x9, x6, 0        # x9 = size
    addi x15, x0, 0       # x15 = counter for subtracting
subtract_loop:
    beq x15, x8, subtract_done  # If counter == i, done subtracting
    addi x9, x9, -1       # Decrement x9 (equivalent to subtracting 1)
    addi x15, x15, 1      # Increment counter
    beq x0, x0, subtract_loop   # Loop back
    
subtract_done:
    addi x9, x9, -1       # x9 = (size-i)-1
    addi x10, x0, 0       # x10 = j = 0 (inner loop counter)
    
inner_loop:
    # Check if inner loop is done
    beq x10, x9, inner_done  # If j == (size-i-1), inner loop done
    
    # Calculate addresses for current and next elements
    # Current element at address (base + j*4)
    slli x11, x10, 2      # x11 = j * 4
    add x11, x5, x11      # x11 = base + j*4 (address of current element)
    
    # Next element at address (base + (j+1)*4)
    addi x12, x10, 1      # x12 = j + 1
    slli x12, x12, 2      # x12 = (j+1) * 4
    add x12, x5, x12      # x12 = base + (j+1)*4 (address of next element)
    
    # Load the two elements to compare
    lw x13, 0(x11)        # x13 = current element
    lw x14, 0(x12)        # x14 = next element
    
    # Compare and swap if needed
    blt x14, x13, swap    # If next < current, swap (equivalent to current >= next)
    beq x0, x0, continue  # Unconditional branch to continue
    
swap:
    # Swap the elements
    sw x14, 0(x11)        # Store next at current position
    sw x13, 0(x12)        # Store current at next position
    
continue:
    # Increment inner loop counter and continue
    addi x10, x10, 1      # j++
    beq x0, x0, inner_loop  # Unconditional branch to inner_loop
    
inner_done:
    # Increment outer loop counter and continue
    addi x8, x8, 1        # i++
    beq x0, x0, outer_loop  # Unconditional branch to outer_loop
    
done:
    # End of sort
    addi x0, x0, 0        # NOP (placeholder for end)