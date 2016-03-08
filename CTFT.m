function X = CTFT(x,t,w)
%CTFT Continuous time Fourier transform.  
%     x CT signal in one period
%     t time vertor
%     w radian frequency section
dt = t(2)-t(1);   % time interval

X = zeros(1,length(w));
for ii = 1:length(w)
    X(ii) = sum(x.*exp(-1i*w(ii)*t))*dt;
end
