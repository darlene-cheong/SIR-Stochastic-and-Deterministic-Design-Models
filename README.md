# Simulating Disease Dynamics: An SIR Model Approach
This project uses a Susceptible-Infected-Recovered (SIR) model to simulate and analyze the spread of infectious diseases, exploring the impact of infection and recovery rates on disease dynamics over time.
<br><br>

# Context
The SIR (Susceptible-Infected-Recovered) project simulates the spread of an infectious disease within a population using a basic epidemiological model. The model tracks the number of susceptible, infected, and recovered individuals over time, considering parameters such as the recovery rate and infection rate. This project was designed to explore disease dynamics and predict outcomes over a specified time frame, which can provide insights into the potential spread of infections. I worked alongside a mathematics undergraduate student to complete this project in MATLAB, combining our skills to build and analyze the simulation. The simulation runs multiple times to account for variability and generate a range of results. By adjusting factors like population size, infection rate, and recovery rate, the project seeks to understand how these factors influence the disease trajectory.

# Results and Analysis
The simulation demonstrated typical behavior expected from the SIR (Susceptible-Infected-Recovered) model. As the disease spread, the number of susceptible individuals decreased as they became infected, while the number of infected individuals rose. After reaching a peak, the infected population declined as individuals recovered. The results varied across simulation runs due to the inherent randomness in the spread of infections. Each run showed a different trajectory, but the general pattern of infection rise and fall was consistent. On average, the model showed that the number of infected individuals peaked at a certain point in the simulation and then steadily decreased as more individuals recovered. The total population remained constant, as births and deaths were not included in the model, focusing solely on the transitions between susceptible, infected, and recovered states. The average results also highlighted how the infection rate and recovery rate influenced the timing and size of the peak infection. Lower infection rates or higher recovery rates led to a slower spread, while higher infection rates or lower recovery rates caused a quicker rise in infections.

Future improvements could include adding a more complex model that accounts for factors like births, deaths, vaccination, and immunity loss. Additionally, incorporating real-world data for parameter calibration could improve the accuracy and relevance of the simulation in predicting real-world outbreaks.
<br><br>

# Languages Used
- **MATLAB**
