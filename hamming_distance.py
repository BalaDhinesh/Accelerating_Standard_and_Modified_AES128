def hamming_distance(data, key):
    xor = hex(int(data, 16) ^ int(key, 16))
    binary = bin(int(xor[2:], 16)).zfill(8)
    setBits = [ones for ones in binary[2:] if ones=='1']     
    print ("Hamming distance: ", len(setBits)) 

if __name__ == "__main__":
    plain_text = input("Enter the plain text in hex: ")
    cipher_key = input("Enter cipher key in hex: ")
    hamming_distance(plain_text, cipher_key)
