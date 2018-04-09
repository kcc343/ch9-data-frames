# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"

employees <- paste("employee", 1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000

salaries <- runif(100, 40000, 50000)


# Create a vector of 100 salaries in 2018 that have changed from 2017
# Use `runif()` to add a random number between -5000 and 10000 to each of 2017's
# salaries (the negative number means that a salary may have decreased!)

salaries_2018 <- salaries + runif(100, -5000, 10000)

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!

salaries_new <- data.frame(eployees = employees, salaries_2017 = salaries, 
                           salaries_2018, stringsAsFactors = FALSE)

# Create a column 'change' that stores each person's change in salary between
# 2017 and 2018

salaries_new$change <- salaries_2018 - salaries

# Create a column 'got_raise' that is TRUE if the person got a raise (their
# salary went up)

salaries_new$got_raise <- salaries_new$change > 0

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of employee 57

salary_of_57 <- salaries_new[57, "salaries_2018"]

# How many employees got a raise?

nrow(salaries[salaries_new$got_raise == TRUE, ])

# What was the dollar value of the highest raise?

highest_raise <- max(salaries_new$change)


# What was the "name" of the employee who received the highest raise?

highest_name <- salaries_new[salaries_new$change == highest_raise, 'employees']

# What was the largest decrease in salaries between the two years?

largest_decrease <- min(salaries_new$change)

# What was the name of the employee who recieved largest decrease in salary?

lowest_name <- salaries_new[salaries_new$change == largest_decrease, 'employees']

# What was the average salary change?

average_change <- mean(salaries_new$change)
average_change <- sum(salaries_new$change) / nrow(salaries_new)

# For people who did not get a raise, how much money did they lose on average?

lose_average <- mean(salaries_new$change[salaries_new$got_raise == FALSE])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory

write.csv(salaries_new, "salaries.csv")