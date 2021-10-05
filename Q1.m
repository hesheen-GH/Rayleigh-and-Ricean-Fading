n = 1000;
N = 1;
delta_x = 0.1;
mean = 0;
std_dev = sqrt(1); 
x_axis = 0:delta_x:10;
z_sigma = 1; %calculated from prelab

x = std_dev.*randn(N,n)+mean;
y = std_dev.*randn(N,n)+mean;

z = x+i*y;

pdf = hist(abs(z),x_axis)/(n*delta_x);
pdf1 = raylpdf(x_axis, z_sigma);


plot(x_axis,pdf1);
hold on;
plot(x_axis,pdf,'r');
hold off;
legend('Ideal R.V. Rayleigh','R.V Z PDF');
title('Question 1');
xlabel('x');
ylabel('f(x)');