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
***Humming Distance*** Hamming distance is a metric for comparing two binary data strings. While comparing two binary strings of equal length, Hamming distance is the number of bit positions in which the two bits are different. It is used for error detection or error correction when data is transmitted over computer networks. It is also using in coding theory for comparing equal length data words. *In order to calculate the Hamming distance between two strings, and , we perform their XOR operation, (a⊕ b), and then count the total number of 1s in the resultant string.*


__Online AES Calculator:__ http://testprotect.com/appendix/AEScalc
