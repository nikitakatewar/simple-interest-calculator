
#!/usr/bin/env bash

echo "Simple Interest Calculator"

read -r -p "Enter Principal amount: " principal
read -r -p "Enter Rate of Interest (%): " rate
read -r -p "Enter Time period (years): " time

# Validate numeric inputs
for value in "$principal" "$rate" "$time"; do
    if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Please enter valid numbers."
        exit 1
    fi
done

# Calculate simple interest and total amount
awk -v p="$principal" -v r="$rate" -v t="$time" '
BEGIN {
    if (p <= 0 || r < 0 || t <= 0) {
        print "Error: Principal and time must be positive, and rate cannot be negative."
        exit 1
    }

    interest = (p * r * t) / 100
    total = p + interest

    printf "\nSimple Interest = %.2f\n", interest
    printf "Total Amount = %.2f\n", total
}'
