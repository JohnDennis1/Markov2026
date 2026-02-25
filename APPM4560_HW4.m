%% Problem 1: Gambler's Ruin with Retirement

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

%% Something

