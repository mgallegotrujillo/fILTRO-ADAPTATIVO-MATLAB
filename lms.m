clear all
clc
Fs = 15;
Ts = 1/Fs;
order = 12;
n = 0:100; 
x =2+3*cos(2*pi*n/25)+2*sin(2*pi*n/20)+2*sin(2*pi*n/15); 
x=awgn(x, 10);
x = x/max(x); 
x = x';
b = fir1(order,[0.0450 0.0550]); 
d = filter(b,1,x);
mu = 0.8;
lmss = dsp.LMSFilter(order+1, 'StepSize', mu,'WeightsOutputPort', true ); 
[y,e,w] = step(lmss, x, d);
stem([b' w]); 
title('System Identification by LMS Filter');