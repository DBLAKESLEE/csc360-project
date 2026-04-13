# Insertion Sort Analysis
Data observed from Ripes single-stage simulator:

- Non-Pipelined Version
		- Number executed instr. = 127
		- Clock cycles = 127
		- CPI = 1
		- Clock rate = 11.11
- Pipelined Version
		- Number executed instr. = 127
		- Clock cycles = 127
		- CPI = 1
		- Clock rate = 11.11
- Compiler Version
		- Number executed instr. = 123
		- Clock cycles = 123
		- CPI = 1
		- Clock rate = 9.09

Using the above data observed when running the programs through Ripes, execution time was calculated for each:
- Non-Pipelined Version: 11.431 s
- Pipelined Version: 11.431 s
- Compiler Version: 13.531 s

Data observed from Ripes 5-stage simulator:

- Non-Pipelined Version
		- Number executed instr. = 127
		- Clock cycles = 177
		- CPI = 1.39
		- Clock rate = 10.99
- Pipelined Version
		- Number executed instr. = 127
		- Clock cycles = 177
		- CPI = 1.39
		- Clock rate = 11.24
- Compiler Version
		- Number executed instr. = 123
		- Clock cycles = 163
		- CPI = 1.33
		- Clock rate = 9.52

Using the above data observed when running the programs through Ripes, execution time was calculated for each:
- Non-Pipelined Version: 16.063 s
- Pipelined Version: 15.706 s
- Compiler Version: 17.184 s

Due to the many branch instructions, there were many instances of "nop" and "flush" when observing the 5-stage processor. It was interesting to visualize the datapaths and forwarding that occurred. The hazards mostly occurred due to branch instructions, though there were also data hazards due to dependencies, as well as load-use hazards in two locations. 

# Binary Search Analysis
The best non-pipelined version took 49.33 cycles on average, while the best pipelined took 74.33 on average. Using fairly standard clock speeds of 30 MHz and 115 MHz resulting in execution times of 1.64 and .65 seconds, for single and five-stage pipelines respectively. All algorithms were tested using the Ripes simulator for RISC-V architecture.

There were two main hazards encountered in writing the search algorithm. First was a load-use hazard involved in finding and comparing the midpoint value. The midpoint index was calculated and then the value at it loaded from memory. Immidiately after, the value was compared to the search value. This caused the pipeline to stall for a cycle, and could not be fixed by reordering instructions or calculating earlier or later. Loop unrolling could possibly help here, but that topic is too advanced for this project.

The second was a branch hazard where branches were chained together such that a failed branch would jump to the next branch, which if it failed, would jump again. This was innefficient because the five-stage pipeline automatically calculates for fallthrough, meaning that the pipeline flushed once per failure. The solution was to place all branch statements adjacent in code so that fallthrough would start comparing other branch conditions, and only jump once upon a success.
