def hamming_distance(data1, data2):
    xor = hex(int(data1, 16) ^ int(data2, 16))
    binary = bin(int(xor[2:], 16)).zfill(8)
    setBits = [ones for ones in binary[2:] if ones=='1']     
    print ("Hamming distance: ", len(setBits)) 

if __name__ == "__main__":
    data1 = input("Enter the cipher text in hex: ")
    data2 = input("Enter the cipher text with one bit flipped in hex: ")
    hamming_distance(data1, data2)
