%% Problem 1: Grid Markov Chain 1
clear;
clc;
%Part A
S = 0:4;

p = [0 1 0 0 0;
    1/3 0 2/3 0 0;
    0 0.5 0 0.5 0;
    0 0 2/3 0 1/3;
    0 0 0 1 0];

%Part B

[V,D] = eig(p');

%The fourth column of D had the eigval of 1
Pi_vec = real(V(:,4)'/sum(V(:,4))); 

%Part D

q_0 = [0 0 1 0 0];

q_50 = q_0 * (p^50);

figure();
plot(S,q_50,'r', 'DisplayName','q{50}');
hold on;
plot(S, Pi_vec, '-y', 'DisplayName','\pi');
xlabel('States');
ylabel('Probabilities');
title('Markov Chain State Distribution at n=50 and Stationary Distribution');
legend('Location', 'best');

%% Problem 3: Galton-Watson Process
clear;
clc;

%Part A
p_extinct_half = 1;

%Part B
p_extinct_one = 1; %For both A and B mu is leq 1 thus prob of extinct = 1

%Part C
p_extinct_two = fzero(@(x) x - exp(2*(x-1)), 0.5);

%% Problem 4: Galton-Watson Process (Binary)
clear;
clc;

%Part B

a = 0.49;
num_avalanches = 1000;
max_gen = 200;
extinct_count = 0;

for i = 1:num_avalanches
    X = 1; % Start with 1 particle (Generation 0)
    for g = 1:max_gen
        if X == 0
            extinct_count = extinct_count + 1;
            break;
        end
        % Each of the X particles has a 1-a chance to have 2 kids
        Z = binornd(X, 1-a); 
        X = 2 * Z;
    end
end

p_extinct = a/(1-a);

%% Problem 5: Exponential Distribution
clear;
clc;

%Part B
syms t
lambda_A = 2; %rates
lambda_B = 3;

%using erlang distribution
F_A = 1 - exp(-lambda_A*t) - (lambda_A*t)*exp(-lambda_A*t);
F_B = 1 - exp(-lambda_B*t) - (lambda_B*t)*exp(-lambda_B*t);

%calculated as hours, but converted to minutes
expected_hours = int(1 - F_A * F_B, t, 0, inf);
expected_minutes = double(expected_hours * 60);