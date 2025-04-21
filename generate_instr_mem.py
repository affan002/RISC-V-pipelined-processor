machine_codes = [
    "00a00413",
    "00a00493",
    "00940133"
]





new = [] ; instruction = 1 ; count = 0

for i in machine_codes:
    new.append("{InstructionMemory["+str(count + 3)+"], InstructionMemory["+str(count + 2)+"], InstructionMemory["+str(count + 1)+"], InstructionMemory["+str(count)+"]} = 32'h"+str(i)+f"; //{instruction}")
    instruction += 1
    count += 4

for i in new:
    print(i)