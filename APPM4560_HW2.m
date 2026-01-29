%% Problem 1: Power-Law Sampling

%Part d
clear;
clc;

x_0 = 10; %setting params
gam = 4;
C = (gam-1)*(x_0)^(gam-1);

pwr_pdf = @(x) C*x.^(-gam);
x = linspace(10, 60, 1000);

sample100 = inverse_pwr_samp(x_0, gam,100); %inverse sampling for N = 100, 1000, 10000
sample1000 = inverse_pwr_samp(x_0, gam, 1000);
sample10000 = inverse_pwr_samp(x_0, gam, 10000);


figure(); %creating plots with 3 normalized histograms and theoretical pdf overlayed
histogram(sample100,"Normalization","pdf");
hold on
histogram(sample1000, "Normalization","pdf");

histogram(sample10000, "Normalization", "pdf");

plot(x, pwr_pdf(x), 'LineWidth', 2);
xlim([0 60]);
hold off;
xlabel('x values');
ylabel('Probability Density');
title('Histogram of Inverse Power Samples and PDF');
legend('Sample Size 100', 'Sample Size 1000', 'Sample Size 10000', 'PDF');

%% Problem 2: Gamma Sampling
clear;
clc;

%Part b
N = 1e6; %number of samples
Us = rand(N,1); %N uniformly sampled variables
roots = zeros(N,1); %intializing roots for newton's method

gam_cdf = @(x) 1-exp(-x).*(x+1); %gamma cdf for this problem
gam_pdf = @(x) x .* exp(-x); %gamma pdf for this problem

tic
for i = 1:N
    roots(i) = newtons(Us(i),gam_cdf,gam_pdf); %calling newton's method N times
end
time_newtons = toc;

%Part c

g = @(x) 0.5 * exp(-x/2); %proposal 

h = @(x) gam_pdf(x)/g(x); %ratio of f(x)/g(x)

c = h(2); %Optimal val for c
p = 1/c; %acceptance rate

tic
acptd_sample = accept_reject(gam_pdf,g,c,N);
time_AR = toc;

%Part d
tic
sample3 = exprnd(1,N,1) +exprnd(1,N,1);
time_sumExp = toc;

%Part e
x2 = linspace(0,16,1000);

figure();
histogram(acptd_sample,"Normalization","pdf")
hold on
plot(x2,gam_pdf(x2),'r')
xlabel('x values');
ylabel('Probability Density');
title('Histogram of Gamma Samples and PDF');
legend('Gamma Samples via AR', 'PDF');
