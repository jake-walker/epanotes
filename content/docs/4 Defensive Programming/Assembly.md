---
title: "Assembly"
---

* 32 bits = 4 bytes = 1 DWORD

## Registers

### General Purpose

| Name | 32-bit | 16-bit | 8-bit | Description |
| --- | --- | --- | --- | --- |
| Accumulator Register | EAX | AX | AH/AL | Commonly for the results of addition and multiplication instructions. |
| Base Register | EBX | BX | BH/BL | |
| Counter Register | ECX | CX | CH/CL | Commonly used for counting (e.g. loops). |
| Data Register | EDX | DX | DH/DL | |
| Base Pointer | EBP | BP | - | For referencing arguments and local variables. |
| Stack Pointer | ESP | SP | - | Points to the last item on the stack. |
| Source Pointer | ESI | SI | - | |
| Destination Index | EDI | DI | - | |


### Special Registers

| Register | Name | Description |
| --- | --- | --- |
| EIP | Extended Instruction Pointer | Points to the next instruction to be executed |
| EFLAGS | | Represent the outcome of computations and control CPU |
| CS, DS, ES, FS, GS, SS | Segment registers | Describe segments of memory |

## GDB Reference
* `list main` - show high level source code
* `disas main` - disassemble, showing assembly code
* `x/s 0x4005a4` - show content of given memory address
* `break *0x40052f` - add breakpoint at given address
* `run` - run the program
* `x $rbp -4` - print the RBP register

## Instructions

Intel-style assembly has destination first (`<mnemonic> <dest>,<src>`), AT&T-style assembly has source first (`<mnemonic> <src>,<dest>`). _`<loc>` represents a memory location to jump to if the condition is met._

Some of the instructions below have multiple variants, the assembler tries to work out the right instruction to use (e.g. `mov` may become `mvol` for moving a long value or `movb` for moving a byte value).

| Instruction | Description |
| --- | --- |
| **Moving** | |
| `mov eax,ebx` | Copy contents of EBX to EAX |
| `mov eax,0x42` | Copy value `0x42` into EAX |
| `mov eax,[0x4037c4]` | Copy 4 bytes at the given location in memory to the EAX |
| `mov eax,[ebx]` | Copy 4 bytes in the EBX register into the EAX (pointer) |
| `mov eax,[ebx+esi*4]` | Copy 4 bytes at memory location specified by equation into the EAX |
| **Arithmetic** | | 
| `sub eax,0x10` | Subtract 10 from the EAX |
| `add eax,ebx` | Add EBX to the EAX and store result in EAX |
| `inc edx` | Increment EDX by 1 |
| `dec edx` | Decrement EDX by 1 |
| `mul 0x50` | Multiply EAX by `0x50` and store result in EDX:EAX |
| `div 0x75` | Divides EDX:EAX by `0x75` and store result in EAX and remainder in EDX |
| **Bitwise** | |
| `xor eax,eax` | Clear EAX register (XOR EAX with EAX, store result in EAX) |
| `or eax,0x7575` | Perform logical OR on EAX and `0x7575` |
| `mov eax 0xA`<br>`shl eax,2` | Shift EAX register left by 2 bits |
| `mov bl,0xA`<br>`ror bl,2` | Rotate BL register right by 2 bits |
| **Comparisons** |  |
| `cmp <dst>,<src>` | Set zero flag (ZF) and carry flag (CF):<br><ul><li>dst=src? ZF=1, CF=0</li><li>dst&lt;src? ZF=0, CF=1</li><li>dst&gt;src? ZF=0, CF=0</li></ul>|
| `test <dst>,<src>` | Returns 1 if matching bits from operands are 1, else 0 |
| `jz <loc>` | Jump if ZF=1 (equal) |
| `jnz <loc>` | Jump if ZF=0 (not equal) |
| `je <loc>` | Jump if ZF=1 (equal, equivalent to `jz`) |
| `jne <loc>` | Jump if ZF=0 (not equal, equivalent to `jnz`) |
| `jg <loc>` | dest > src (signed) |
| `jge <loc>` | dest >= src (signed) |
| `ja <loc>` | dest > src (unsigned) |
| `jae <loc>` | dest >= src (unsigned) |
| `jl <loc>` | dest < src (signed) |
| `jle <loc>` | dest <= src (signed) |
| `jb <loc>` | dest < src (unsigned) |
| `jbe <loc>` | dest <= src (unsigned) |
| `jo <loc>` | Jump if OF=1 (overflow) |
| `js <loc>` | Jump if SF=1 (sign flag) |
| `jecxz <loc>` | Jump if ECX=0 |
