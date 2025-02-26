# Define parameters
b <- 1/7        # Recovery rate
a <- 2 * b      # Reproduction number times b (infection rate)
N <- 20         # Initial population size
I <- 1          # Initial number of infectious individuals
R <- 0          # Initial number of recovered individuals
S <- N - I - R  # Initial number of susceptible individuals
tmax <- 600     # Total time for simulation (in days)
dt <- 1/24      # Time step (1 hour, as there are 24 hours in a day)
clockmax <- tmax / dt  # Total number of hours to run the simulation

# Initialize storage for results
tsave <- numeric(clockmax)
Ssave <- numeric(clockmax)
Isave <- numeric(clockmax)
Rsave <- numeric(clockmax)
Nsave <- numeric(clockmax)

# Run the simulation loop
for (clock in 1:clockmax) {
  t <- clock * dt  # Calculate the current time step (in hours)
  
  # Calculate infection rate and recovery rate
  first_term <- a * S * (I / N)
  second_term <- b * I
  
  # Update the number of susceptible, infected, and recovered individuals
  S <- S - first_term * dt
  I <- I + (first_term - second_term) * dt
  R <- R + second_term * dt
  N <- S + I + R  # Total population (constant in this model)
  
  # Store the results at each time step
  tsave[clock] <- t
  Ssave[clock] <- S
  Isave[clock] <- I
  Rsave[clock] <- R
  Nsave[clock] <- N
}

# Plot the results
plot(tsave, Ssave, type = 'l', col = 'blue', ylim = c(0, N), 
     xlab = 'Days', ylab = 'Number of People', main = 'SIR Model Simulation',
     frame.plot = FALSE)
lines(tsave, Isave, col = 'red')
lines(tsave, Rsave, col = 'green')

# Adjust the legend position to avoid overlapping with the plot
legend('right', legend = c('Susceptible', 'Infectious', 'Recovered'), 
       col = c('blue', 'red', 'green'), lty = 1, cex = 1.1)


