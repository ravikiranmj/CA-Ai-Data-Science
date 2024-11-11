import itertools

# Define the alphabet with lowercase letters
alphabet = 'abcdefghijklmnopqrstuvwxyz'

# Generate all combinations of length 4 with repetition allowed
combinations = itertools.product(alphabet, repeat=4)

# Open a text file for writing
with open('combinations.txt', 'w') as file:
    # Write each combination to the file
    for combo in combinations:
        file.write(''.join(combo) + '\n')

print("Combinations with repetitions saved to 'combinations.txt'.")
