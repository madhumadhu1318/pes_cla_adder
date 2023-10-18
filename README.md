# Carry Look-Ahead Adder

The adder produce carry propagation delay while performing other arithmetic operations like multiplication and divisions as it uses several additions or subtraction steps. This is a major problem for the adder and hence improving the speed of addition will improve the speed of all other arithmetic operations. Hence reducing the carry propagation delay of adders is of great importance. There are different logic design approaches that have been employed to overcome the carry propagation problem. One widely used approach is to employ a carry look-ahead which solves this problem by calculating the carry signals in advance, based on the input signals. This type of adder circuit is called a carry look-ahead adder.

Here a carry signal will be generated in two cases:

Input bits A and B are 1
When one of the two bits is 1 and the carry-in is 1.
In ripple carry adders, for each adder block, the two bits that are to be added are available instantly. However, each adder block waits for the carry to arrive from its previous block. So, it is not possible to generate the sum and carry of any block until the input carry is known. The i^{th}     block waits for the i-1^{th}     block to produce its carry. So there will be a considerable time delay which is carry propagation delay. 


![logic block](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/0e59aeaf-63eb-4a22-be10-4663b663c3c6)


Consider the above 4-bit ripple carry adder. The sum S_{3}     is produced by the corresponding full adder as soon as the input signals are applied to it. But the carry input C_{4}     is not available on its final steady-state value until carry C_{3}     is available at its steady-state value. Similarly C_{3}     depends on C_{2}     and C_{2}     on C_{1}     . Therefore, though the carry must propagate to all the stages in order that output S_{3}     and carry C_{4}     settle their final steady-state value. 

The propagation time is equal to the propagation delay of each adder block, multiplied by the number of adder blocks in the circuit. For example, if each full adder stage has a propagation delay of 20 nanoseconds, then S_{3}     will reach its final correct value after 60 (20 × 3) nanoseconds. The situation gets worse, if we extend the number of stages for adding more number of bits. 

Carry Look-ahead Adder : 
A carry look-ahead adder reduces the propagation delay by introducing more complex hardware. In this design, the ripple carry design is suitably transformed such that the carry logic over fixed groups of bits of the adder is reduced to two-level logic. Let us discuss the design in detail. 


![logic gates](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/3690520b-9d16-42b7-8ca6-4a2a68eee27a)

![TT](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/263e7168-2971-47e7-9b68-630c1cb8d886)


# Simulation
iverilog pes_bcdbin.v pes_bcdbin_tb.v

./a.out


![2](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/80e777da-ac96-4816-858d-b8f629630674)


![Screenshot 2023-10-18 182122](https://github.com/madhumadhu1318/pes_cla_adder/assets/90201844/d4ba3e61-cc6d-4864-9202-83b1babd5636)
















