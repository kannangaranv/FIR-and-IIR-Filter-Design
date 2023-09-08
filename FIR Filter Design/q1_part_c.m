%%specification of the filter
fsamp = 4000;
fcuts = [600 900 1400 1600];
mags = [0 1 0];
devs = [0.001259 0.01372 0.001259];

%%Designing the Kaiser window
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta));

%%Magnitude response of the filter for wp1<w<wp2
[H,f] = freqz(hh,1);
plot(f/pi,20*log10(abs(H)))
ax = gca;
ax.XTick = 9/20:.05:7/10;
ax.YTick = -1:.010:1;
ax.XLim = [9/20 7/10];
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
