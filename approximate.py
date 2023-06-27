import re

# Read the input TeX file
with open('main.tex', 'r') as file:
    content = file.read()

# Define the regular expression pattern to match numbers
pattern = r"[-+]?\d*\.\d+|\d+"

# Function to replace matched numbers with their truncated form
def truncate_numbers(match):
    number = float(match.group(0))
    truncated_number = int(number * 10000) / 10000  # Truncate to four decimal places
    return str(truncated_number)

# Use regular expression substitution to replace numbers
truncated_content = re.sub(pattern, truncate_numbers, content)

# Write the modified content to an output file
with open('mainL.tex', 'w') as file:
    file.write(truncated_content)
