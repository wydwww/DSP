t = 0 : 1 : 15000-1;
t1 = 0 : 1 : 700-1;
L = length(t);
r = rectwin(L);
fs = 1000;
x1 = (heaviside(t) - heaviside(t-700));
figure
plot(t,y)
set(gca,'Fontsize',15)
ylabel('Amplitude/V')
title('Electricity wave signal')
% x2 = y.*x1;
% % figure
% % plot(t,x2)
% % dw = 1;
% % fLim = 15000-1;    %ÆµÂÊÉÏÏÂÏÞ
% % w = 0 : dw : fLim;
% x3 = CTFT(x2,t,w);
% figure
% plot(t1,x3)
% % h = hamming(L);
% % yh = y.*h.';
% figure
% plot(t,yh)
% YH = CTFT(yh,t,w);
% figure
% plot(t,abs(YH))
