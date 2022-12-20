%%
b = 1/7; % recovery rate
a = 2*b; % Reproduction number times b
N = 20; % Initial number of people in population
I = 1; % Initial number of infectious people
R = 0; % Initial number of recovered people

S = N-I-R; % Initial number of susceptible people
tmax = 600; % Number of days to run simulation
dt = 1/24; % One hour (24 hours in one day)
clockmax = tmax/dt; % Total number of hours to run simulation 

tsave = zeros(clockmax,1);
Ssave = zeros(clockmax,1);
Isave = zeros(clockmax,1);
Rsave = zeros(clockmax,1);
Nsave = zeros(clockmax,1);
for clock = 1:clockmax
    t = clock*dt;
    first_term = a*S*(I/N);
    second_term = b*I;
    S = ((-1)*first_term)*dt + S;
    I = (first_term-second_term)*dt+I;
    R = (second_term)*dt + R;
    N = S+I+R;
    tsave(clock) = t;
    Ssave(clock) = S;
    Isave(clock) = I;
    Rsave(clock) = R;
    Nsave(clock) = N;
end

plot(tsave,Ssave,tsave,Isave,tsave, Rsave, tsave, Nsave)
legend('Susceptible','Infectious','Recovered',  'Population','Location','northeastoutside')
xlabel('\it{Days}')
ylabel('\it{Number of People}')
