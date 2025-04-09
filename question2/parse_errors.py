import re
import json

log_file = '/tmp/timestamp.log'
output_file = 'question2/errors.json'

pattern = r"^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d+) - ERROR - (.+)$"

errors = []

with open(log_file, 'r') as f:
    for line in f:
        match = re.match(pattern, line)
        if match:
            timestamp, message = match.groups()
            errors.append({"timestamp": timestamp, "error": message})

import os
os.makedirs('question2', exist_ok=True)

with open(output_file, 'w') as f:
    json.dump(errors, f, indent=4)

print(f"Extracted {len(errors)} error entries to {output_file}")
