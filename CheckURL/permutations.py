import itertools

# Define the alphabet with lowercase letters
alphabet = 'abcdefghijklmnopqrstuvwxyz'

# Generate all permutations of length 4
permutations = itertools.permutations(alphabet, 3)

# Open a text file for writing
with open('permutations.txt', 'w') as file:
    # Write each permutation to the file
    for perm in permutations:
        file.write(''.join(perm) + '\n')

print("Permutations saved to 'permutations.txt'.")
