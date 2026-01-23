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
%Part a
C = 1/(integral2(@(x,y) x.*y,0,1,0,@(x)x));


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

N = 10^5; %Num of observations for each friend

f_4 = @(t) 3 .* t.^2 ./ (60^3);

X = 60*rand(N, 3); %Creating random vars to represent ea friend
T = max(X,[],2); %Taking max across column to find latest time

x_pts = linspace(0,60,1000); %Points for plotting pdf
y_pts = f_4(x_pts); %Evaluating xpts

figure();
plot(x_pts, y_pts, '-g')
xlabel('Time (t) in minutes after 6pm')
ylabel('f(t)')
title('Function f(t) over Time')
grid on

hold on

histogram(T, "Normalization","pdf")

