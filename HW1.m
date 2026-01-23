%% Problem 1
clear;
clc;

%Initializing variables
num_seats = 98;
num_tickets = 100;
p_miss = 0.02;
lambda = num_tickets * p_miss;

%Part A
p_overflow_poi = poisscdf(1,lambda);

%Part B
p_overflow_exact = binocdf(1,num_tickets,p_miss);

%Part C
p_filled_poi = poisspdf(2, lambda)/ poisscdf(2, lambda);

%% Problem 2
clear;
clc;

C = 1/(integral2(@(x,y) x.*y,0,1,0,@(x)x));

function f_xy = PDF(X,Y,C)
f_xy = C*X*Y;
end

%% Problem 3
clear;
clc;

%Part B
f_3 = @(u) u.^4 ./ (1+u.^6);

exact_ans = integral(f_3,0,1); %exact area below f(x)

a = 1:0.1:5;

N = floor(10.^a); %Number of points

E_N = zeros(size(N));
for i = 1:length(N)

    x = rand(i,1); %Generating i random points
    y = rand(i,1);

    below = y < f_3(x); %checking to see if y values are below f(x

    E_N(i) = mean(below); %finding proportion of points below f(x)
end

figure();
plot(N,E_N,'-r')
xlabel('N')
ylabel('E(N)')
title('E(N) vs N (area estimate via MC)')
grid on

%% Problem 4
clear;
clc;

f_4 = @(t) 3 * t.^2 ./ 60^3;