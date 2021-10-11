clear all;
clc;

N = 10;
b = 1;
a = 0;
n = 1000000;
%amplitude = (b-a)*rand(N,n)+a;
%amplitude = raylrnd(1,10,n);
amplitude = 1;

class_method = Class_Methods;


class_method.Q4(N,n,amplitude);