install.packages("ggplot2")
install.packages("gridExtra")

# Load required library
library(ggplot2)
library(gridExtra)

# Read the data from the file
data <- read.table("C:/Users/BATIKAN YILMAZ/Documents/Question_1.txt",dec = ",")

# Assign column names if needed
colnames(data) <- c("X1", "X2", "Y")

# Perform multiple regression
model <- lm(Y ~ X1 + X2, data = data)

# Display the summary of the regression
summary(model)

# Create a 2D scatter plot with regression lines for X1 and X2
plot_x1 <- ggplot(data, aes(x = X1, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Regression Analysis for X1", x = "X1", y = "Y")

plot_x2 <- ggplot(data, aes(x = X2, y = Y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Regression Analysis for X2", x = "X2", y = "Y")

# Arrange the plots in a single grid
library(gridExtra)
grid.arrange(plot_x1, plot_x2, ncol = 2)
