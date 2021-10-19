clear all;
clc;

N = 1;
b = 1;
a = 0;
n = 1000;
amplitude = (b-a)*rand(N,n)+a;
class_method = Class_Methods;
class_method.Q4(N,n,amplitude,'Uniform(0,1)');

N = 2;
amplitude = (b-a)*rand(N,n)+a;
class_method.Q4(N,n,amplitude,'Uniform(0,1)');

N = 3;
amplitude = (b-a)*rand(N,n)+a;
class_method.Q4(N,n,amplitude,'Uniform(0,1)');

N = 5;
amplitude = (b-a)*rand(N,n)+a;
class_method.Q4(N,n,amplitude,'Uniform(0,1)');

N = 10;
amplitude = (b-a)*rand(N,n)+a;
class_method.Q4(N,n,amplitude,'Uniform(0,1)');
 



N = 1;
amplitude = raylrnd(1,N,n);
class_method.Q4(N,n,amplitude,'rayleigh dist.');

N= 2;
amplitude = raylrnd(1,N,n);
class_method.Q4(N,n,amplitude,'rayleigh dist.');

N=3;
amplitude = raylrnd(1,N,n);
class_method.Q4(N,n,amplitude,'rayleigh dist.');


N=5;
amplitude = raylrnd(1,N,n);
class_method.Q4(N,n,amplitude,'rayleigh dist.');

N=10;
amplitude = raylrnd(1,N,n);
class_method.Q4(N,n,amplitude,'rayleigh dist.');




