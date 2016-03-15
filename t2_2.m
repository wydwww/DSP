clc; clear;
close all;
%
fs = 1000;
load data.mat;
n = 2500;
h = hamming(n);
x = zeros(1,n);
for ii = 1:n
    x(ii) = h(ii)*y(ii);
end
%
w = -pi:2*pi/n:pi;
N = 1:n;
X = CTFT(x,N,w);
f = -fs/2:fs/n:fs/2;
figure(1)
subplot(211)
plot(f,abs(X),'LineWidth',2)
xlabel('Frenquency/f(Hz)')
ylabel('|X|')
title(['hamming window signal in [0,2500] after CTFT' ' NO.5130309535'])
xlim([-100 100])
set(gca,'Fontsize',15)
subplot(212)
plot(f,phase(X),'LineWidth',2)
xlabel('Frenquency/f(Hz)')
ylabel('Phase/rads')
set(gca,'YTick',-pi:pi/4:3*pi)
set(gca,'Fontsize',15)
xlim([-100 100])
