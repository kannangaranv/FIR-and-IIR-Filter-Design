%%Specification of filter
fsamp = 4000;
fcuts = [600 900 1400 1600];
mags = [0 1 0];
devs = [0.001259 0.01372 0.001259];

%%impulse response of the filter
[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
n = n + rem(n,2);
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');
impz(hh)
