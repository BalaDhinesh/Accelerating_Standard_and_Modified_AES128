# Accelerating the AES algorithm on an FPGA and comparing the speedup with both AES and Modified AES algorithms

## Deliverables
- Accelerating the AES (Advanced Encryption Standard) and Modified AES algorithms on an FPGA. Implementation using Verilog (including Test benches).
- Wrapping the design using Microblaze/Zynq with AXI interface. 
- C codes to provide input text and for obtaining the encrypted output text.
- Comparing the speedup using our PC. 

## Advanced Encryption Standard (AES) Algorithm
- Encryption specification for electronic data established by NIST (2001).                
- AES128 encrypts data in blocks of 128 bits. However, it **operates on bytes** i.e., 16 bytes - which is represented by a 4x4 matrix containing one byte in each of its cell.    
- Consists of linked operations involving specific substitutions and shuffling to obtain the 128 bit output.             
- AES128 evaluates in **10 rounds**, each containing 4 sub-processes: **SubBytes** (substitution), **ShiftRows**, **MixColumns** (permutation), and **Add Round Key**. 

Description of each of the sub-processes:
- **SubBytes** In this step each byte is substituted by another byte using a lookup table (S-box). This substitution is done in a way that a byte is never substituted by itself and also not substituted by its compliment. The result of this step is a 16 byte (4 x 4) matrix.

- **ShiftRows** Each row is circularly shifted in a specific manner. The first row is not shifted, the second row is shifted once to the left, the third row is shifted twice to the left, and the fourth row is shifted thrice to the left.

- **MixColumns** performs mathematical manipulation on each byte and outputs a completely new byte (except in the last round). This step is a matrix multiplication where each column is multiplied with a specific matrix and thus the position of each byte in the column is changed as a result.          

- **Add Round Keys** - Now the resultant output of the previous stage is XOR-ed with the corresponding round key. Here, the 16 bytes are not considered as a matrix but as 128 bits of data.       

[Reference](https://www.geeksforgeeks.org/advanced-encryption-standard-aes/)

## AES Implementation Analysis
Here is the analysis of the Standard AES implemented in Verilog and C and accelerated using Microblaze. ([Source code](https://github.com/BalaDhinesh/Modified-AES/tree/main/Baseline-AES))

#### Block design
![image](https://user-images.githubusercontent.com/64545984/145572486-463e6a0c-879d-4626-845e-9dbe31bb8286.png)
[Custom AES IP(my_ip_aes_bram) code](https://github.com/BalaDhinesh/Modified-AES/tree/main/ip_repo/myip_aes_bram_1.0) 

#### Reports

##### Timing Report
![image](https://user-images.githubusercontent.com/64545984/145572947-140ad821-d403-4e07-a699-8dd676fa9f60.png)

##### Resource Utilization Report
![image](https://user-images.githubusercontent.com/64545984/145572997-2497a659-75f5-416a-8f23-4eabeedf2375.png)

##### Power analysis report
![image](https://user-images.githubusercontent.com/64545984/145574561-7588bd99-2f5a-423d-ac30-9efb1d2b8faf.png)

##### Noise Analysis Report
![image](https://user-images.githubusercontent.com/64545984/145573061-3ca2eeb4-963f-41e9-8407-e496d74eb166.png)

### Software Development of AES using Vitis
To run the same code in ________________ [Source Code](https://github.com/BalaDhinesh/Modified-AES/blob/main/VitisIDE/aes_encryption.c)

##### Output in Serial console

__No of cycles in hardware:__ 447(50MHz)

__No of cycles in behavioural software simulation:__ 35500(50MHz)

__No of cycles in Laptop/PC:__ 1256371(3.671GHz)

__Time taken in Hardware:__ 0.00894 ms

__Time taken in Laptop/PC:__ 0.34ms

__Speedup Achieved:__  38.013x (times)

##### Performance from the PC/Laptop of AES code
![image](https://user-images.githubusercontent.com/64545984/145573559-f44572da-2fe2-4ed2-8963-06e09100a68d.png)

To compare the running time of the AES algorithm in Laptop/PC with that of hardware, we used a [C reference from online](https://github.com/openluopworld/aes_128) and ran it on our local machine and used `perf` profiler to compute the time taken to run it.


## Modified AES Algorithm
In order to enhance the randomness in the encryption and make it more complicated for decryption, two modified versions of the Standard AES algorithm have been presented in the following papers, and we tried implementing them and analysing them in terms of their security using Avalanche effect.

### Modified AES V1
In this article tilted [“Modified AES Cipher Round and Key Schedule”](https://www.researchgate.net/publication/332557093_Modified_AES_Cipher_Round_and_Key_Schedule), (by Edjie M. De Los Reyes (et. al), there are modifications in the key schedule. The two modifications to the standard AES are in (1) the key schedule algorithm and (2) the cipher round algorithm. 

***Key scheduling algorithm*** of AES is modified by introducing an additional byte substitution process and round constant addition through XOR prior to the generation of the subkeys to prevent the cipher key bits from being used directly.

***Cipher round algorithm*** modifications to the AES cipher round are inclusions of XOR key permutation after the SubBytes operation and Modulo Addition key permutation after the ShiftRow operation from rounds one to nine. In the final round  of the encryption, round ten, modulo addition is added after the SubBytes operation.
### Modified AES V2
In this article titled ["Modified Advanced Encryption Standard Algorithm
for Information Security"](https://pdfs.semanticscholar.org/7ee8/572e5457eb6bc043ecbefc933dda52f98875.pdf), (by O.C Abikoye (et. al)), there are *two changes made to the AES algorithm namely in the Sub-bytes and Shift-rows step.* However, we have only incorporated the change in the Sub-bytes step, and used the standard Shift-rows step in the implementation of the same.

***Sub-bytes*** was modified to make it round key dependent; this is to ensure that a change in the key is easily discovered in the cipher text. To achieve that, the 16 bytes round key was used to obtain four eight-bit keys XORkey0, XORkey1, XORkey2, XORkey3 by XORing all the bytes of the corresponding row (Row i) in the round key matrix.

After obtaining the XORkeys, each XORkeyi was then added to all of the bytes in the corresponding row (Row i) of the state matrix before substituting the values in the S-Box. After obtaining the new state matrix S, the bytes are then substituted in the substitution table (S-Box) using normal SubBytes operation.

## Hamming Distance and Avalanche Effect Comparison
### Hamming Distance
Hamming distance is a metric for comparing two binary data strings. While comparing two binary strings of equal length, Hamming distance is the number of bit positions in which the two bits are different. It is used for error detection or error correction when data is transmitted over computer networks. It is also using in coding theory for comparing equal length data words. 

*In order to calculate the Hamming distance between two strings, and , we perform their XOR operation, (a⊕ b), and then count the total number of 1s in the resultant string.*

### Avalance Effect
In cryptography, the avalanche effect is the desirable property of cryptographic algorithms, typically block ciphers and cryptographic hash functions, wherein if an input is changed slightly (for example, flipping a single bit), the output changes significantly (e.g., half the output bits flip). In the case of high-quality block ciphers, such a small change in either the key or the plaintext should cause a drastic change in the ciphertext. If a block cipher or cryptographic hash function does not exhibit the avalanche effect to a significant degree, then it has poor randomization, and thus a cryptanalyst can make predictions about the input, being given only the output. This may be sufficient to partially or completely break the algorithm. Thus, the avalanche effect is a desirable condition from the point of view of the designer of the cryptographic algorithm or device.

***Avalanche effect = (Hamming distance/Block size) ∗ 100 %***

### Comparison with a given input and key
For the computation and analysis of Avalanche effect for Baseline AES and both the versions of Modified AES, we have taken the following as the key, **Key:128’h000102030405060708090a0b0c0d0e0f** and the input as, **Input:128’h4142434445464748494a4b4c4d4e4f50**. 

We randomly selected few bits in the input and flipped and computed the cipher key and inturn the Hamming distance and Avalanche effect. The results are tabulated as follows,

<img width="489" alt="image" src="https://user-images.githubusercontent.com/64090461/145546462-65a35852-896c-47ad-9f61-a227534296cb.png">

<img width="491" alt="image" src="https://user-images.githubusercontent.com/64090461/145546528-7a88c109-fcea-4393-950e-62802efb39e3.png">

<img width="485" alt="image" src="https://user-images.githubusercontent.com/64090461/145546581-e54863a5-875b-4bda-9f3e-8cc5bbdb88dc.png">


As you can see from the tables that, there has been an increaese in avalanche effect for certain random flips in the input, in the Modified AES V2, while not in Modified AES V1 as compared to the Baseline-AES.. But this result can't be a more generalised way of stating security performance in AES algorithms. 

Hence we now, fix the input data and key same as mentioned above and flip each bit in the input and compute the Avalanche effect. The same for all the three algorithms has been plotted in the figure as shown below,

![image](https://user-images.githubusercontent.com/64090461/145546650-c3f96bbc-d0d3-4e3e-bcc2-fc3c78460552.png)

From this grpah, we also compute the average Avalnche effect for each of the algorithm and the results are as follows,

| Method | Avalanche Effect |
| :---: | :---: |
| Base-line | 63.9375 % |
| Modified V1 |64.1953125%|
|Modified V2 | 63.9921875%|

From the above we can infer that the Modified AES V1 has significant improvement in the Avalanche effect, while the Modified AES V2 has a marginal improvement in the Avalnche effect.

## Experimenting Open-Source Silicon Compilers
With the advent of open-source technologies for Chip development, there were several RTL designs, EDA Tools which were open-sourced. The missing piece in a complete Open source chip development was filled by the SKY130 PDK from Skywater Technologies and Google. 

[OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) provides a completely automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, Fault, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII. Another open source framework [SiliconCompiler](https://github.com/siliconcompiler/siliconcompiler) was also developed very recently that converts RTL source code to silicon.

So with lots of curiosity, we tried to compile our verilog code using the above-mentioned Silicon Compilers that run automation scripts which perform Synthesis, Floor Planning, Placement, Clock Tree Synthesis, Fake antenna and diode swapping, Routing, RC Extraction, Static Timing Analysis, Sign-off steps (Design Rule Check and Layout Versus Schematic), finally with GDSII Extraction.

At the very first time when we tried running our code in OpenLane Silicon Compiler, there were few errors that occured in the synthesis part. These were rectified by changing the coding style, and adding clock edges at appropriate places. Further then the compilation advanced till Placement and there few conflicts that arised. These conflicts were difficult to debug systematically, so we followed even better coding style and different strategies to debug the error with some level of understanding from the error logs generated. 

After these changes, the compilation was successfull till Global routing, wherein the routing passed on and it moved to Static Timing Analysis which throwed an "Hold Violation" Error. At this point the error logs weren't understandable, since everything was mapped to clock buffers and so on. Hence we tried tweaking some default parameters in configuration used for running these exports as mentioned in the "OpenLane Documentation" such as `GLB_RESIZER_HOLD_SLACK_MARGIN`, `GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT`, `PL_RESIZER_HOLD_SLACK_MARGIN`, and `PL_RESIZER_HOLD_MAX_BUFFER_PERCENT`. Even then, the same error continues to occur and we are in the process of understanding the exact intermediate steps involved in the automation part and making it work. Here is the [flow summary report](final_summary_report.csv) that was generated, this states the clock frequency, area and the width of each of the traces.

### References

**Online AES Calculator:**  http://testprotect.com/appendix/AEScalc
1. https://aircconline.com/ijcnc/V9N2/9217cnc06.pdf
2. https://pdfs.semanticscholar.org/7ee8/572e5457eb6bc043ecbefc933dda52f98875.pdf
3. https://www.researchgate.net/publication/326596710_An_Efficient_AES_Implementation_using_FPGA_with_Enhanced_Security_Features
4. http://www.iajet.org/documents/vol.3/no.1/Enhancement%20the%20Security%20of%20AES%20Against%20Modern%20Attacks%20by%20Using%20Variable%20Key%20Block%20Cipher.pdf
