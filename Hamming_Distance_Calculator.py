import matplotlib.pyplot as plt
import numpy as np

def hamming_distance(data1, data2):
    xor = hex(int(data1, 16) ^ int(data2, 16))
    binary = bin(int(xor[2:], 16)).zfill(8)
    setBits = [ones for ones in binary[2:] if ones=='1']     
    ## print ("Hamming distance: ", len(setBits)) 
    return (len(setBits))

if __name__ == "__main__":
    data1_v2 = "a1e699e0f449c2def178774322732a86" #modified-v2
    data1_base = "9cdd85de85b48bed892f02d8a5cbdacb" #base-line
    data1_v1 = "9f28432c77dfa8a05f20ef174e5bf6d4" #modified-v1

    file_base = open("Hamming_Data\data_base.txt","r+")
    data_base = file_base.readlines()
    file_v1 = open("Hamming_Data\data_v1.txt","r+")
    data_v1 = file_v1.readlines()
    file_v2 = open("Hamming_Data\data_v2.txt","r+")
    data_v2 = file_v2.readlines()

    hamm_array_base = []
    hamm_array_v2 = []
    hamm_array_v1 = []

    for i in range(128):
        hamm_array_base.append(hamming_distance(data_base[i][-33:-1],data1_base))
        hamm_array_v2.append(hamming_distance(data_v2[i][-33:-1],data1_v2))
        hamm_array_v1.append(hamming_distance(data_v1[i][-33:-1],data1_v1))
    
    print("Standard AES Avalanche",sum(hamm_array_base)/128)
    print("Modified AES V1 Avalanche",sum(hamm_array_v1)/128)
    print("Modified AES V2 Avalanche",sum(hamm_array_v2)/128)

    xpoints = np.arange(0,128, 1)
    
    plt.plot(xpoints,hamm_array_base, label="base-line", color = "blue")
    plt.plot(xpoints,hamm_array_v2, label="modified-v2", color = "red")
    plt.plot(xpoints,hamm_array_v1, label="modified-v1", color = "green")
    plt.legend(["base-line", "modified-v2", "modified-v1"], loc='upper left')
    plt.show()