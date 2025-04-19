machine_codes = [
    "10000593",
    "01100093",
    "02a00113",
    "00900193",
    "01f00213",
    "00500293",
    "01a00313",
    "00b00393",
    "0015a023",
    "0025a223",
    "0035a423",
    "0045a623",
    "0055a823",
    "0065aa23",
    "0075ac23",
    "10000293",
    "00700313",
    "00000413",
    "06640463",
    "10000293",
    "00030493",
    "00000793",
    "00878863",
    "fff48493",
    "00178793",
    "fe000ae3",
    "fff48493",
    "00000513",
    "02950c63",
    "00251593",
    "00b285b3",
    "00150613",
    "00261613",
    "00c28633",
    "0005a683",
    "00062703",
    "00d74463",
    "00000663",
    "00e5a023",
    "00d62023",
    "00150513",
    "fc0006e3",
    "00140413",
    "f8000ee3",
    "00000013"
]




new = [] ; instruction = 1 ; count = 0

for i in machine_codes:
    new.append("{InstructionMemory["+str(count + 3)+"], InstructionMemory["+str(count + 2)+"], InstructionMemory["+str(count + 1)+"], InstructionMemory["+str(count)+"]} = 32'h"+str(i)+f"; //{instruction}")
    instruction += 1
    count += 4

for i in new:
    print(i)