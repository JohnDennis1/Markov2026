%% Problem 2
clear;
clc;

a = 0.04;
b = 0.16;

% Part A
% Although it's not asked for specifically in part A, it's needed for d.
i_vals = 1:5;
unnorm_pi = exp((a-b) * (i_vals-1) .* i_vals / 2);
pi_theory = unnorm_pi / sum(unnorm_pi);

% Part B

N = 5;
p = zeros(N,N);
K = 0.1;

for n = 1:N
    pn = K * exp(a * n);
    qn = K * exp(b * (n-1));
    
    if n < N
        p(n, n+1) = pn;
    end
    
    if n > 1
        p(n, n-1) = qn;
    end

    p(n, n) = 1 - p(n, max(1, n-1)) - p(n, min(N, n+1));
end

[V,D] = eig(p');

Pi_vec = real(V(:,4)'/sum(V(:,4))); %The fourth column of D had the eigval of 1

% Part C

NumSteps = 1e6;

X = zeros(1,NumSteps);

X(1) = 1;

for n=1:NumSteps-1
    i = X(n);
    r = rand();
    X(n+1) = find(cumsum(p(X(n), :)) >= r, 1);
end

figure()
%Histo for the 1e6 simulated Steps
histogram(X, 'BinEdges', 0.5:1:5.5, 'Normalization', 'probability');
grid("on");

hold on;
plot(1:5, Pi_vec, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);

plot(1:5, pi_theory, 'gx', 'MarkerSize', 10, 'LineWidth', 1.5);

xlabel("State")
ylabel("Portion of Time")

title('Stationary Distribution Comparison');
legend('Simulation (10^6 steps)', 'Numerical (Eigenvector)', 'Analytical (Detailed Balance)');
set(gca, 'XTick', 1:5);

%% Problem 3
clear;
clc;

a = 0.99;

X_0 = 1;

p = [1-a a 0;
    a 0 1-a;
    0 1-a a];

