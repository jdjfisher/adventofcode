import sys
import os

assert len(sys.argv) >= 2, "missing arg"

file_path = sys.argv[1]

assert os.path.exists(file_path), "invalid file path"

with open(file_path, "r") as file:
    most_cals, cals = 0, 0

    for line in file:
        try:
            cals += int(line)
        except ValueError:
            most_cals = max(most_cals, cals)
            cals = 0

    most_cals = max(most_cals, cals)

    print(most_cals)

# --------------------------------

with open(file_path, "r") as file:
    cal_totals = []
    cals = 0

    for line in file:
        try:
            cals += int(line)
        except ValueError:
            cal_totals.append(cals)
            cals = 0

    cal_totals.append(cals)
    top_cals = sorted(cal_totals)[-3:]

    print(sum(top_cals))
