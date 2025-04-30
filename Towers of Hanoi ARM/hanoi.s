.text
.global _start

hanoi:
    CMP r0, #0           // Compare the disks with 0
    BEQ finish           // If disks is equal to 0, branch to finish to end the recursion
    SUB r0, r0, #1       // Decrement the number of disks for the recursive call
    PUSH {r1-r3, lr}     // Save the current states for source, destination, auxiliary pegs, and return address
    MOV r4, r2           // Temporarily store the current destination in r4
    MOV r2, r3           // Set the new destination to the auxiliary peg
    MOV r3, r4           // Set the new auxiliary to the original destination
    BL hanoi             // Recursive call to move n-1 disks from source to auxiliary using destination as temporary storage
    MOV r4, r1           // Temporarily store the current source in r4
    MOV r1, r3           // Set the new source to the auxiliary peg
    MOV r3, r4           // Set the new auxiliary to the original source
    BL hanoi             // Recursive call to move n-1 disks from new source to destination using original source as temporary storage
    POP {r1-r3, lr}      // Restore the state of source, destination, auxiliary pegs, and return address
    BX lr                // Return from the function

finish:
    MOV pc, lr           // Set the program counter to the link register to return from the function

_start:
    LDR sp, =stack_loc   // Load the address of the stack location into the stack pointer
    MOV r0, #4           // Initialize r0 with the total number of disks
    MOV r1, #1           // Initialize r1 with the identifier for the source peg
    MOV r2, #2           // Initialize r2 with destination peg
    MOV r3, #3           // Initialize r3 with auxiliary peg
    BL hanoi             // Begin the recursion for the Tower of Hanoi
    B _start             // After ending the hanoi process, loop back to _start (infinite loop)

.data
stack_loc: .word 0x20001000  // Define the initial main stack pointer value

.end
