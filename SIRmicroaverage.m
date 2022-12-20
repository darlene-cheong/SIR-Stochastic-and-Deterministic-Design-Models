
tsave = zeros(clockmax,1);
Ssave = zeros(clockmax,run);
Isave = zeros(clockmax,run);
Rsave = zeros(clockmax,run);
Nsave = zeros(clockmax,run);

b = 1/7; % recovery rate
a = 2*b; % Reproduction number times b
N = 100; % Initial number of people in population
I = 1; % Initial number of infectious people
R = 0; % Initial number of recovered people
S = N-I-R; % Initial number of susceptible people
tmax = 600; % Number of days to run simulation
dt = 1/24; % One hour (24 hours in one day)
clockmax = tmax/dt; % Total number of hours to run simulation 
runmax = 200;

for run = 1:runmax
    b = 1/7; % recovery rate
    a = 2*b; % Reproduction number times b
    N = 100; % Initial number of people in population
    I = 1; % Initial number of infectious people
    R = 0; % Initial number of recovered people
    S = N-I-R; % Initial number of susceptible people
    tmax = 600; % Number of days to run simulation
    dt = 1/24; % One hour (24 hours in one day)
    clockmax = tmax/dt; % Total number of hours to run simulation 
    for clock = 1:clockmax
    if S>0
        first_term=sum(rand(S,1) < dt*a*(I/N));
    else
        first_term=0;
    end
    if I>0
        second_term=sum(rand(I,1) < dt*b); 
    else
        second_term=0;
    end
    t = clock*dt;
    S = S - first_term;
    I = I + first_term -second_term;
    R = R +             second_term;
    N = S+I+R;
    tsave(clock) = t;
    Ssave(clock,run) = S;
    Isave(clock,run) = I;
    Rsave(clock,run) = R;
    Nsave(clock,run) = N;
    end
end


S_average = mean(Ssave,2);
I_average = mean(Isave,2);
R_average = mean(Rsave,2);
N_average = mean(Nsave,2);

plot(tsave,S_average,tsave,I_average,tsave, R_average, tsave, N_average)
legend('Susceptible','Infectious','Recovered', 'Population','Location','northeastoutside')
xlabel('\it{Days}')
ylabel('\it{Number of People}')
