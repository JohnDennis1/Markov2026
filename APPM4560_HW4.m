%% Problem 1: Gambler's Ruin with Retirement
clear;
clc;

%Part B
E = @(i,p,q,s) i + (p-q)/s * (1 - ((1-sqrt(1 - 4*p*q))/(2*p))^i);

%Part C

q = 0.4; %Prob of losing one dollar
p = 0.35; %Prob of winning a dollar
s = 0.25; %Prob of deciding to retire
i = 10; %starting amount

theoAnswer = E(i,p,q,s);

N = 100000; %num of sims

EVs = zeros(1,N);
win = p+q;

for k = 1:N
    money = i;

    while money > 0 
        u = rand;
        if u < q
            money = money - 1; % Lose a dollar
        elseif u < win
            money = money + 1; % Win a dollar
        else
            break;
        end
    end
    EVs(k) = money;
end

empiricalAnswer = mean(EVs);

fprintf('After running the game 100 000 times, the EV is %.3f\n',empiricalAnswer);

%% Problem 2: Greedy Management
clear;
clc;

%Part A
n=6;
p = zeros(n,n);
p(1,6)=1;
for k=2:n
    for i=1:k
        p(k,i) = binopdf(i-1,k-1,0.9);
    end
end

%Part B
r = p(2:end,2:end);
I = eye(n-1);

A = (I-r);
b = ones(n-1,1);
%Time for the machines to fail from each state
x = A \ b;

%Part C
[V,D] = eig(p');

Pi_vec = V(:,6)'/sum(V(:,6));

prob_one_machine = Pi_vec(2); %prob that there's only one machine working a
% randomly chosen week (in the long run)

fprintf('Prob that only one machine is working in a random week is %.3f\n', ...
    prob_one_machine);
