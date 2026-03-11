%% Problem 2
clear;
clc;

% Part B

N = 5;
p = zeros(N,N);
a = 0.04;
b = 0.16;
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

X_0 = randn(1,5);

for i=1:NumSteps

end

%% Problem 3
clear;
clc;

a = 0.99;

X_0 = 1;

p = [1-a a 0;
    a 0 1-a;
    0 1-a a];
