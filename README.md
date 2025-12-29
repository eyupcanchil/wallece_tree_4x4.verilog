What is a Wallace tree?
The Wallace Tree 4×4 is a multiplier architecture used to multiply two 4-bit numbers at high speed in hardware.
It adds partial products (bits formed by AND operations) in parallel using full adders and half adders in a tree structure. The goal is to quickly reduce the large number of partial products to two rows and obtain the result with a final adder.
It is faster but uses more hardware than classic multipliers.


History of the Wallace Tree
The Wallace Tree was introduced by Chris Wallace in 1964.
The goal was to reduce the addition delay by reducing partial products in parallel in binary multiplication operations and to design faster multipliers.
This approach has become one of the cornerstones of today's high-speed arithmetic circuits based on FPGAs and ASICs.
