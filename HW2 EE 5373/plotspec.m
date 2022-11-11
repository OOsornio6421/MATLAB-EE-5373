% plotspec(x,Ts) plots the spectrum of the signal x
% Ts = time (in seconds) between adjacent samples in x

function plotspec(x)

N=length(x);                               % length of the signal x

if mod(N,2)~=0 
    N1=N-1;                      % N is not even
else
    N1=N;
end

t=(1:N1);
ssf=(-N1/2:N1/2-1)/N;                   % frequency vector
fx=fft(x(1:N1));                            % do DFT/FFT
fxs=fftshift(fx);                          % shift it for plotting
subplot(2,1,1), plot(t,x(1:N1))                  % plot the waveform
xlabel('time'); ylabel('amplitude')     % label the axes
subplot(2,1,2), plot(ssf,abs(fxs))         % plot magnitude spectrum
xlabel('frequency'); ylabel('magnitude')   % label the axes

%verify parseval equalize power using
%sum(abs(fxs).^2)/N
%sum(abs(x).^2)
% use axis([0,2,-1.1,1.1]) for specsquare.eps
