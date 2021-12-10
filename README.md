# Accelerating the Advanced Encryption Standard Algorithm and Implementing Modified AES Algorithm
To accelerate the AES algorithm on FPGA and compare the speedup with both AES and Modified AES algorithms.

## Deliverables:
- Accelerating the AES (Advanced Encryption Standard) and Modified AES algorithms on FPGA. Implementation using Verilog (including Test benches).
- Wrapping the design using Microblaze/Zynq with AXI interface. 
- C codes to provide input text and for obtaining encrypted output text.
- Comparing the speedup using our PC. 

## Standard Advanced Encryption Standard (AES) Algorithm
- Encryption specification for electronic data established by NIST (2001).                
- AES128 encrypts data in blocks of 128 bits. However, it **operates on bytes** i.e., 16 bytes - which is represented by a 4x4 matrix containing one byte in each of its cell.    
- Consists of linked operations involving specific substitutions and shuffling to obtain the 128 bit output.             
- AES128 evaluates in **10 rounds**, each containing 4 sub-processes: **SubBytes** (substitution), **ShiftRows**, **MixColumns** (permutation), and **Add Round Key**. 

Here is a small description of each of the steps that occurs inn each round:
- **SubBytes** In this step each byte is substituted by another byte.(Its performed using a lookup table also called the S-box.This substitution is done in a way that a byte is never substituted by itself and also not substituted by another byte which is a compliment of the current byte.The result of this step is a 16 byte (4 x 4 ) matrix like before.

- **ShiftRows** Each row is shifted a particular number of times. The first row is not shifted, the second row is shifted once to the left, the third row is shifted twice to the left, and the fourth row is shifted thrice to the left.

- **MixColumns** performs mathematical manipulation on each byte and outputs a completely new byte (except in the last round).This step is basically a matrix multiplication where each column is multiplied with a specific matrix and thus the position of each byte in the column is changed as a result.          

- **Add Round Keys** - Now the resultant output of the previous stage is XOR-ed with the corresponding round key. Here, the 16 bytes is not considered as a grid but just as 128 bits of data.       

[Reference](https://www.geeksforgeeks.org/advanced-encryption-standard-aes/)

## Modified AES Algorithm
In order to enhance the randomness in the encryption and make it more complicated for decryption, two modified versions of the Standard AES algorithm has been presented in the following papers, and we have tried implementing them and analysing them in terms of their security performance using Avalanche effect comparison.

### Modified AES V1

### Modified AES V2
In this article titled ["Modified Advanced Encryption Standard Algorithm
for Information Security"](https://pdfs.semanticscholar.org/7ee8/572e5457eb6bc043ecbefc933dda52f98875.pdf), (by O.C Abikoye (et. al)), there has been *two changes made to the standard AES algorithm namely in the Sub-bytes and Shift-rows step.* However, we have only incorporated the change in the Sub-bytes step, and used the same standard Shift-rows step in the implementation of the same.

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

### References

**Online AES Calculator:**  http://testprotect.com/appendix/AEScalc
1. https://aircconline.com/ijcnc/V9N2/9217cnc06.pdf
2. https://pdfs.semanticscholar.org/7ee8/572e5457eb6bc043ecbefc933dda52f98875.pdf
3. https://www.researchgate.net/publication/326596710_An_Efficient_AES_Implementation_using_FPGA_with_Enhanced_Security_Features
4. http://www.iajet.org/documents/vol.3/no.1/Enhancement%20the%20Security%20of%20AES%20Against%20Modern%20Attacks%20by%20Using%20Variable%20Key%20Block%20Cipher.pdf
