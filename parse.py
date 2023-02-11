import pandas as pd

# Read data from CSV file
data = pd.read_csv('data.csv')

# Group data by state and crop, and calculate the total yield
grouped_data = data.groupby(['State', 'Crop']).agg({'Yield': 'sum'})

# Sort the data by yield in descending order for each state
sorted_data = grouped_data.sort_values(['State', 'Yield'], ascending=[True, False])

# Display the top 10 crops based on yield for each state
for state, state_data in sorted_data.groupby('State'):
    print(f'Top 10 crops for {state}:')
    print(state_data.head(10))
    print()
