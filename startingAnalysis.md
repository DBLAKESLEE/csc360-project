# Insertion Sort Analysis
- Non-Pipelined Version
		- Number executed instr. = 96
		- Clock cycles = 135
		- CPI = 1.41
- Pipelined Version
		- Number executed instr. = 127
		- Clock cycles = 177
		- CPI = 1.39

# Binary Search Analysis
The best non-pipelined version took 49.33 cycles on average, while the best pipelined took 74.33 on average. Using fairly standard clock speeds of 30 MHz and 115 MHz resulting in execution times of 1.64 and .65 seconds, for single and five-stage pipelines respectively. All algorithms were tested using the Ripes simulator for RISC-V architecture.

There were two main hazards encountered in writing the search algorithm. First was a load-use hazard involved in finding and comparing the midpoint value. The midpoint index was calculated and then the value at it loaded from memory. Immidiately after, the value was compared to the search value. This caused the pipeline to stall for a cycle, and could not be fixed by reordering instructions or calculating earlier or later. Loop unrolling could possibly help here, but that topic is too advanced for this project.

The second was a branch hazard where branches were chained together such that a failed branch would jump to the next branch, which if it failed, would jump again. This was innefficient because the five-stage pipeline automatically calculates for fallthrough, meaning that the pipeline flushed once per failure. The solution was to place all branch statements adjacent in code so that fallthrough would start comparing other branch conditions, and only jump once upon a success.
