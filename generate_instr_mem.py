bubble_sort_instructions = [
    # Initialize
    "0x00000913",  # addi x18, x0, 0     # Base address of array
    "0x00700993",  # addi x19, x0, 7     # Length of array = 7
    "0x00000413",  # addi x8, x0, 0      # Outer loop counter i = 0

    # outer_loop:
    "0x03340863",  # beq x8, x19, exit      # If i == length, exit (branch forward 56 bytes)
    "0x00000493",  # addi x9, x0, 0         # j = 0
    "0xfff98313",  # addi x6, x19, -1       # length - 1
    "0x40830333",  # sub x6, x6, x8         # length - 1 - i

    # inner_loop:
    "0x02648063",  # beq x9, x6, inner_done # If j == limit, exit inner loop (branch forward 32 bytes)
    
    # Calculate address of a[j]
    "0x00349393",  # slli x7, x9, 3         # j * 8
    "0x01238393",  # add x7, x7, x18        # base + j*8
    "0x0003b283",  # ld x5, 0(x7)           # Load a[j]
    
    # Calculate address of a[j+1]
    "0x00148e93",  # addi x29, x9, 1        # j+1
    "0x003e9e13",  # slli x28, x29, 3       # (j+1) * 8
    "0x012e0e33",  # add x28, x28, x18      # base + (j+1)*8
    "0x000e3f03",  # ld x30, 0(x28)         # Load a[j+1]
    
    # Compare and swap if needed
    "0x01e2c663",  # blt x5, x30, no_swap   # If a[j] < a[j+1], don't swap (branch forward 12 bytes)
    
    # Swap
    "0x00028f93",  # addi x31, x5, 0        # temp = a[j]
    "0x000f0293",  # addi x5, x30, 0        # a[j] = a[j+1]
    "0x0053b023",  # sd x5, 0(x7)           # Store a[j]
    "0x01f00f13",  # addi x30, x0, 31       # a[j+1] = temp (this is incorrect, should be below)
    "0x000f8f13",  # addi x30, x31, 0       # a[j+1] = temp (correct)
    "0x01ee3023",  # sd x30, 0(x28)         # Store a[j+1]
    "0x00100513",  # addi x10, x0, 1        # Set swap flag
    
    # no_swap:
    "0x00148493",  # addi x9, x9, 1         # j++
    "0xfc000ce3",  # j inner_loop           # Continue inner loop (branch backward 52 bytes)
    
    # inner_done:
    "0x00140413",  # addi x8, x8, 1         # i++
    "0xfa0000e3",  # j outer_loop           # Continue outer loop (branch backward 92 bytes)

    # exit:
    "0x00000013",  # nop                    # Program done (added a nop for the exit point)
]

new = [] ; instruction = 1 ; count = 0

for i in bubble_sort_instructions:
    new.append("{InstructionMemory["+str(count + 3)+"], InstructionMemory["+str(count + 2)+"], InstructionMemory["+str(count + 1)+"], InstructionMemory["+str(count)+"]} = 32'h"+str(i)[2:]+f"; //{instruction}")
    instruction += 1
    count += 4

for i in new:
    print(i)