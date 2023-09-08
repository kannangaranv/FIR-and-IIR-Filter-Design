%%Specification of the filter and Normalizinf frequencies
Wp = [900 1400]/2000;
Ws = [600 1600]/2000;
Rp = 0.12;
Rs = 58;

%%Transforming into digital filters
[n,Wp] = cheb1ord(Wp,Ws,Rp,Rs);
[z,p,k] = cheb1ap(n,0.12);
[A,B,C,D] = zp2ss(z,p,k);  

%%Bilinear transformation
fs = 4e3;
f1 = 900; u1 = 2*fs*tan(f1*(2*pi/fs)/2);
f2 = 1400; u2 = 2*fs*tan(f2*(2*pi/fs)/2);
[At,Bt,Ct,Dt] = lp2bp(A,B,C,D,sqrt(u1*u2),u2-u1);
[Ad,Bd,Cd,Dd] = bilinear(At,Bt,Ct,Dt,fs);
[hd,fd] = freqz(ss2sos(Ad,Bd,Cd,Dd),2048,fs);

%%Magnitude response of filter
plot(fd/2000,mag2db(abs(hd)))
xline([f1/2000 f2/2000],"-",["Lower" "Upper"]+" passband edge", ...
    LabelVerticalAlignment="middle")
ax = gca;
ax.XTick = 9/20:.05:7/10;
ax.YTick = -1:.010:2;
ax.XLim = [9/20 7/10];
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')