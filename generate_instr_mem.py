machine_codes = [
    "10002083",  # lw x1, 256(x0)
    "002081b3"   # add x3, x1, x2
]





new = [] ; instruction = 1 ; count = 0

for i in machine_codes:
    new.append("{InstructionMemory["+str(count + 3)+"], InstructionMemory["+str(count + 2)+"], InstructionMemory["+str(count + 1)+"], InstructionMemory["+str(count)+"]} = 32'h"+str(i)+f"; //{instruction}")
    instruction += 1
    count += 4

for i in new:
    print(i)