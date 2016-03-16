clc,clear
close all

dt = 0.1;   % time interval
f0 = 1/8;   % fundamental frequency
T0 = 1/f0;  % period
N = 1/2;    % number of periods
omega = 2*pi*f0;

%% function of a sinusoid signal
t = -N*T0:dt:N*T0-dt;
x = sin(omega*t);

k = -3:1:3;
Xk = zeros(1,length(k));
for ii = 1:length(k)
    Xk(ii) = 1/T0*sum(x.*exp(-1j*k(ii)*omega*t)*dt);
end

figure
subplot(221)
stem(k,real(Xk))
xlabel('k'),ylabel('Real')
title('Real')
ylim([-1,1])
set(gca,'XTick',-3:1:3)
%
subplot(223)
stem(k,imag(Xk))
xlabel('k'),ylabel('Imag')
title('Imag')
%
subplot(222)
stem(k,abs(Xk))
ylabel('Modulus')
title('Modulus')
%
subplot(224)
stem(k,angle(Xk))
ylabel('Phases')
title('Phases')
%
