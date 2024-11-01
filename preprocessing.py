import re
def preprocess_file(file_path):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        preprocessed_lines = []
        for line in lines:
            stripped_line = line.lstrip()

            # Remove lines where '*' is the first non-space character
            if stripped_line.startswith('*'):
                continue

            # Remove inline comments starting with '*>'
            line = line.split('*>')[0]
            if re.search(r'(?<!\bnot\s)(?<!\bis\s)ZERO', line):
                line = line.replace('ZERO', '0')
            line = line.replace('SPACE', "' '")
            line = line.replace('SPACES', "' '")
            line = line.replace('QUOTE', "'")
            line = line.replace('QUOTES', "'")
            # Strip trailing spaces or any unnecessary formatting
            preprocessed_lines.append(line.rstrip())

        # Join the processed lines into a single block of text
        preprocessed_data = '\n'.join(preprocessed_lines)

        return preprocessed_data

    except Exception as e:
        print(f"Error preprocessing file: {e}")