%% Problem 1

%% Problem 2
clear;
clc;

%Part A
p = [0.9 0.1 0;
    0 0.125 0.875;
    0.4 0 0.6];

%Part B
num_hrs1 = 1/p(2,2);

%Part C
num_hrs2 = 1/p(1,2) + 1/p(2,3) + 1/p(3,1);

%Part D
num_hrs3 = num_hrs1/num_hrs2;

%Part E
p_50 = p^50; %p_{ij}^k represent the prob of going from state i to j after k moves

%Part 5

%% Problem 3
clear;
clc;

%Part A
%X_0 = 2 -> X_1 = 3 -> X_2 = 4 -> X_3= 5 -> X_4 = 5

p25 = (2/3)^3*1;

fprintf("There only exists one path where X_4 = 5 given X_0 = 2. Calulating the probability comes to (2/3)^3 or %.4f \n", p25);

%Part B
p = [1 0 0 0 0;
    1/3 0 2/3 0 0;
    0 1/3 0 2/3 0;
    0 0 1/3 0 2/3;
    0 0 0 0 1];

%Part C
p_4 = p^4;

p4_25 = p_4(2,5);

fprintf("The probability X_4 = 5 given X_0 = 2 is equal to %.4f by looking at the p^4(2,5) entry", p4_25);

%% Problem 4
clear;
clc;

p = [0.5 0.5 0 0 0 0;
    0 0.5 0.5 0 0 0;
    (1/3) 0 (1/3) (1/3) 0 0;
    0 0 0 0.5 0.5 0;
    0 0 0 0 0 1;
    0 0 0 0 1 0];

%Part A

%Part B
p_5 = p^5;

p_5(1,5)
