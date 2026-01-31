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
p_50 = p^50;
