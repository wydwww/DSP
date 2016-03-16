clc; clear;
close all;
%%
f1 = 20;
A1 = 2;
pha1 = pi/4;
f2 = 19.5;
A2 = 1;
pha2 = 0;
fs = 1000;
dt = 1/fs;
t = -1:dt:1;
f = 780;    % Least Common Multiple of x1 and x2
%%
x1 = mySin(f1,A1,pha1,t,fs);
x2 = mySin(f2,A2,pha2,t,fs);
x = x1+x2;
%%
%Task1_1
figure
plot(t,x,'LineWidth',2)
xlabel('t')
ylabel('x')
title(['Harmonic Signal x(t)' ' NO.5130309535'])
xlim([min(t) max(t)])
set(gca,'Fontsize',15)
%%
T = 1/f;
k = -50:1:50;
Xk = CTFS(x,t,T,k,f);
%%
%Task1_2
figure
subplot(211)
stem(k,real(Xk),'b','LineWidth',2)
xlabel('f(Hz)')
ylabel('real')
title(['real part of X_k(f)' ' NO.5130309535'])
xlim([min(k) max(k)]);
set(gca,'Fontsize',15)
subplot(212)
stem(k,imag(Xk),'r','LineWidth',2)
xlabel('f(Hz)')
ylabel('imagery')
title(['imagery part of X_k(f)' ' NO.5130309535'])
xlim([min(k) max(k)]);
set(gca,'Fontsize',15)
%
figure
subplot(211);
stem(k,abs(Xk),'b','LineWidth',2);
xlabel('f(Hz)'); ylabel('|X_k|'); title(['Modulus of X_k(f)' ' NO.5130309535']);
set(gca,'Fontsize',15)
subplot(212);
stem(k,angle(Xk),'r','LineWidth',2);
xlabel('f(Hz)'); ylabel('phase(X_k) (rad)'); title(['Phase of X_k(f)' ' NO.5130309535']);
set(gca,'Fontsize',15)
%%
%Task1_4
A3 = 1;
D = 0.2;
x3 = mySqu(A3,D,fs,t);
x4 = x3.*x;
dw = 0.01;
fLim = 500;    %limit of frequency
w = -fLim*2*pi : dw : fLim*2*pi;
% figure
% plot(t,x4)
X = CTFT(x4,t,w);
figure
subplot(211)
plot(t,x4,'LineWidth',2)
xlabel('t')
ylabel('x(t)')
title(['Harmonic Signal x(t) in [-0.1,0.1]' ' NO.5130309535'])
set(gca,'Fontsize',15)
subplot(212)
plot(w/2/pi,abs(X),'LineWidth',2)
xlabel('Frenquency')
ylabel('|X|')
xlim([-fs/2 fs/2])
title(['x(t) after CTFT' ' NO.5130309535'])
set(gca,'Fontsize',15)
%%
%Task1_5
x5 = mySqu(A3,0.4,fs,t);
x6 = x5.*x;
X1 = CTFT(x6,t,w);
figure
subplot(211)
plot(t,x6,'LineWidth',2)
xlabel('t')
ylabel('x(t)')
title(['Harmonic Signal x(t) in [-0.2,0.2]' ' NO.5130309535'])
set(gca,'Fontsize',15)
subplot(212)
plot(w/2/pi,abs(X1),'LineWidth',2)
xlabel('Frenquency')
ylabel('|X|')
xlim([-fs/2 fs/2])
title(['x(t) after CTFT' ' NO.5130309535'])
set(gca,'Fontsize',15)
%%
%1_6
t1 = -0.1 : dt/10 : 0.1;
t2 = -0.2 : dt/5 : 0.2;
L1 = length(t1);
h1 = hamming(L1);
r = rectwin(L1);
L2 = length(t2);
h2 = hamming(L2);
%
x11 = mySin(f1,A1,pha1,t1,fs);
x21 = mySin(f2,A2,pha2,t1,fs);
x01 = x11+x21;
x12 = mySin(f1,A1,pha1,t2,fs);
x22 = mySin(f2,A2,pha2,t2,fs);
x02 = x12+x22;
xhh1 = x01.*h1.';
xhh2 = x02.*h2.';
X01 = CTFT(xhh1,t1,w);
X02 = CTFT(xhh2,t2,w);
figure
subplot(211)
plot(t1,xhh1,'LineWidth',2)
xlabel('t')
ylabel('x(t)')
title(['Harmonic Signal x(t) in hamming window [-0.1,0.1]' ' NO.5130309535'])
set(gca,'Fontsize',15)
subplot(212)
plot(w/2/pi,abs(X01),'LineWidth',2)
xlabel('Frenquency')
ylabel('|X|')
xlim([-fs/2 fs/2])
title(['hamming windowed x(t) after CTFT' ' NO.5130309535'])
set(gca,'Fontsize',15)
%
figure
subplot(211)
plot(t2,xhh2,'LineWidth',2)
xlabel('t')
ylabel('x(t)')
title(['Harmonic Signal x(t) in hamming window [-0.2,0.2]' ' NO.5130309535'])
set(gca,'Fontsize',15)
subplot(212)
plot(w/2/pi,abs(X02),'LineWidth',2)
xlabel('Frenquency')
ylabel('|X|')
xlim([-fs/2 fs/2])
title(['hamming windowed x(t) after CTFT' ' NO.5130309535'])
set(gca,'Fontsize',15)
%%
%1_4
X41 = CTFT(x01,t1,w);
figure
subplot(211)
plot(t1,x01,'LineWidth',2)
xlabel('t')
ylabel('x(t)')
title(['Harmonic Signal x(t) in [-0.1,0.1]' ' NO.5130309535'])
set(gca,'Fontsize',15)
subplot(212)
plot(w/2/pi,abs(X41),'LineWidth',2)
xlabel('Frenquency')
ylabel('|X|')
xlim([-fs/2 fs/2])
title(['x(t) after CTFT' ' NO.5130309535'])
set(gca,'Fontsize',15)
%
X42 = CTFT(x02,t2,w);
figure
subplot(211)
plot(t2,x02,'LineWidth',2)
xlabel('t')
ylabel('x(t)')
title(['Harmonic Signal x(t) in [-0.2,0.2]' ' NO.5130309535'])
set(gca,'Fontsize',15)
subplot(212)
plot(w/2/pi,abs(X42),'LineWidth',2)
xlabel('Frenquency')
ylabel('|X|')
xlim([-fs/2 fs/2])
title(['x(t) after CTFT' ' NO.5130309535'])
set(gca,'Fontsize',15)
