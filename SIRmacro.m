%% Define parameters for the SIR model
b = 1/7; % Recovery rate is the rate at which infected individuals recover
a = 2*b; % Reproduction number times recovery rate is infection rate based on the reproduction number
N = 20; % Initial population size
I = 1;  % Initial number of infectious individuals
R = 0;  % Initial number of recovered individuals

S = N-I-R; % Initial number of susceptible individuals (total population minus infected and recovered)
tmax = 600; % Total time for the simulation in days
dt = 1/24; % Time step (1 hour, as there are 24 hours in a day)
clockmax = tmax/dt; % Total number of hours to run the simulation, based on the time step

%% Initialize storage arrays for results
tsave = zeros(clockmax,1);  % Store time points (in hours)
Ssave = zeros(clockmax,1);  % Store number of susceptible individuals over time
Isave = zeros(clockmax,1);  % Store number of infectious individuals over time
Rsave = zeros(clockmax,1);  % Store number of recovered individuals over time
Nsave = zeros(clockmax,1);  % Store total population (constant in this model) over time

%% Run the simulation loop
for clock = 1:clockmax
    t = clock*dt;  % Calculate the current time step (in hours)
    
    % Calculate the rate of infection (first term) and the rate of recovery (second term)
    first_term = a*S*(I/N);  % Infection rate is dependent on the number of susceptible and infected individuals
    second_term = b*I;      % Recovery rate is proportional to the number of infected individuals
    
    % Update the number of susceptible individuals (S)
    S = ((-1)*first_term)*dt + S;
    
    % Update the number of infected individuals (I)
    I = (first_term - second_term)*dt + I;
    
    % Update the number of recovered individuals (R)
    R = (second_term)*dt + R;
    
    % Update the total population (N) - in this model, N is constant
    N = S + I + R;
    
    % Store the results at each time step
    tsave(clock) = t;        % Store the current time
    Ssave(clock) = S;        % Store the current number of susceptible individuals
    Isave(clock) = I;        % Store the current number of infected individuals
    Rsave(clock) = R;        % Store the current number of recovered individuals
    Nsave(clock) = N;        % Store the current population (constant)
end

%% Plot the results
plot(tsave, Ssave, tsave, Isave, tsave, Rsave, tsave, Nsave)  % Plot each compartment (S, I, R, N) over time
legend('Susceptible','Infectious','Recovered', 'Population','Location','northeastoutside')  % Add a legend for clarity
xlabel('\it{Days}')  % Label the x-axis with 'Days' (since time is in hours, divided by 24 for days)
ylabel('\it{Number of People}')  % Label the y-axis to indicate the number of individuals in each group
