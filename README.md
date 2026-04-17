# csc360-project
The files in this project are divided up by algorithm, and are further organized by folders naming what is contained in them. The 'Figures' folders contain the flowcharts and related screenshots and data from Ripes. The final paper with extra detail and clarity on the algoritms and related analysis can be found in the common folder 'paper'.

# Division of Labor
We decided to each handle one of the two algoritms. Dawson worked on the insertion sort algorithm, while Mark worked on the binary search algorithm. This proved to work well, as each team member's work was distributed across the various deliverables for each algorithm. As challenges arose, the team members would discuss and help each other where it was needed. 

Similarly with the paper and presentation, Dawson and Mark each produced work related to their researched algorithm. 

# General Challenges
The project floundered for a little while due to disorganization, but this was solved by conferencing with each other, asking the professor questions, and good planning.

# Challenges on Insertion Sort
One challenge that Dawson faced while working with the insertion sort algorithm was uncontrolled iteration of the i variable (outer loop variable) in his assembly file. For example, for an array of size 5, it is expected that i would iterate only 4 (n-1) times, but the iteration would not stop. This was resolved by realizing that the chosen processor while testing was a 5-stage processor without hazard detection or forwarding, which caused memory hazards so that the conditions to exit the iterative loop were never met. After correcting this--by switching to either a single-stage processor or a 5-stage processor with hazard detection and forwarding--the issue was resolved, and the algorithm functioned as expected. This challenge ultimately helped to gain confidence using Ripes, as well as isolating potential hazards in the algorithm.

# Challenges on Binary Search
Mark had significant challenges with the recursive aspect of the binary search until he remembered that it is easier done with a loop. In addition to simplifying the algorithm, it had the happy effect of reducing stack overhead.

Another challenge was converting C to assembly, which he tried to do via copy-pasting into Ripes. This produced such a volume of code unrelated to the algorithm that he gave up, converted it by hand, and then hooked it into a simple test harness. He later found an online compiling tool that produced just the code for the algorithm and nothing further.

One final challenge was improving the speed by restructuring the branches, where he learned how to place all branch instructions next to each other, so only one jump needs to occur. This is in contrast to his first algorithm, which jumped from one branch condition to the next, creating more frequent control hazards.
