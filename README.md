# Accelerating the Advanced Encryption Standard Algorithm and Implementing Modified AES Algorithm
To accelerate the AES algorithm on FPGA and compare the speedup with both AES and Modified AES algorithms.

## Deliverables:
- Accelerating the AES (Advanced Encryption Standard) and Modified AES algorithms on FPGA. Implementation using Verilog (including Test benches).
- Wrapping the design using Microblaze/Zynq with AXI interface. 
- C codes to provide input text and for obtaining encrypted output text.
- Comparing the speedup using our PC. 

## What is Advanced Encryption Standard (AES) Algorithm?
- Encryption specification for electronic data established by NIST (2001).                
- AES128 encrypts data in blocks of 128 bits. However, it **operates on bytes** i.e., 16 bytes - which is represented by a 4x4 matrix containing one byte in each of its cell.    
- Consists of linked operations involving specific substitutions and shuffling to obtain the 128 bit output.             
- AES128 evaluates in **10 rounds**, each containing 4 sub-processes: **SubBytes** (substitution), **ShiftRows**, **MixColumns** (permutation), and **Add Round Key**.             
- **SubBytes** substitutes each byte in the matrix with a different byte, with the help of a LUT (Look-up Table).            
- **ShiftRows** performs circular shifting of each row of the matrix in a specific fashion.            
- **MixColumns** performs mathematical manipulation on each byte and outputs a completely new byte (except in the last round).                
- **Add Round Keys** - Output of previous *MixColums* is bitwise XOR-ed with a *Round Key*.             
- **Decryption** in AES is just the reverse process of encryption.            
[Reference](https://www.geeksforgeeks.org/advanced-encryption-standard-aes/)

## Modified AES:

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

Fig1,2,3

As you can see from the tables that, there has been an increaese in avalanche effect for certain random flips in the input, in the Modified AES V2, while not in Modified AES V1 as compared to the Baseline-AES.. But this result can't be a more generalised way of stating security performance in AES algorithms. 

Hence we now, fix the input data and key same as mentioned above and flip each bit in the input and compute the Avalanche effect. The same for all the three algorithms has been plotted in the figure as shown below,

Graph1

From this grpah, we also compute the average Avalnche effect for each of the algorithm and the results are as follows,

| Method | Avalanche Effect |
| :---: | :---: |
| Base-line | 63.9375 % |
| Modified V1 |64.1953125%|
|Modified V2 | 63.9921875%|

From the above we can infer that the Modified AES V1 has significant improvement in the Avalanche effect, while the Modified AES V2 has a marginal improvement in the Avalnche effect.

__Online AES Calculator:__ http://testprotect.com/appendix/AEScalc
