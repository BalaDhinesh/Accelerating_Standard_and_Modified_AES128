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


__Online AES Calculator:__ http://testprotect.com/appendix/AEScalc
