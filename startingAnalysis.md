# Insertion Sort Analysis

# Binary Search Analysis (outline)
- T = IQ/R, so solve for T1 >= T5 where T1 is execution time for single-stage and T5 is five-stage
    - Explain the math (probably LaTeX)
    - Non-Pipelined Algorithm: R5 >= 1.51 * R1 (1.51 == Q5/Q1)
    - Pipelined Algorithm: R5 >= 1.63 * R1 (again, 1.63 == Q5/Q1)
- Hazards
    - Data: the load-use (see charts)
    - Control: the branches (see figures, charts)
        - Your branches should all be next to each other, so that the false-fallthrough starts processing the next branch
        - DON'T branch to code that checks another branch, because that's ineffecient (lots of nops)