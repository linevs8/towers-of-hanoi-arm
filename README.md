# Towers of Hanoi (ARM Assembly)

This project implements the classic Towers of Hanoi puzzle using ARM assembly.

## Files
- `hanoi.s`: The main source code implementing recursive logic for solving the puzzle.
- `hanoi-report.pdf`: A brief explanation of the recursive approach and stack usage.

## Description
The `hanoi` function uses recursion to move disks between pegs using registers and the stack. 
The implementation handles saving and restoring states manually, which is crucial in ARM 
since it doesn’t handle call stacks automatically.

## Author
Daniel Lim
