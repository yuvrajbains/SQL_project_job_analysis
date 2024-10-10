import pandas as pd
import matplotlib.pyplot as plt

# Load the DataFrame from CSV
df = pd.read_csv('/Users/yuvrajbains/Desktop/Projects/SQL/advanced_sql/sql_project_job_analysis/Top_10_Data_Scientist_Skills.csv')

# Count occurrences of each skill
top_skills = df['skills'].value_counts()
top_skills_df = top_skills.reset_index()
top_skills_df.columns = ['skill', 'count']  # Rename columns for clarity

# Print the top skills
print(top_skills_df)

# Plotting the top skills
plt.figure(figsize=(10, 6))
plt.barh(top_skills_df['skill'], top_skills_df['count'], color='skyblue')
plt.xlabel('Number of Job Postings')
plt.title('Top Skills Required for Data Scientist Positions')
plt.gca().invert_yaxis()  # Invert y-axis to have the highest skill at the top
plt.show()

# 7 out of 10 require Python for Data Scientists!