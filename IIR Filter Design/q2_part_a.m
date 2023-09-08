%%Specification of the filter
Wp = [900 1400]/2000;
Ws = [600 1600]/2000;
Rp = 0.12;
Rs = 58;

%%Coeffients of the transfer function
[n,Wp] = cheb1ord(Wp,Ws,Rp,Rs);
[a,b] = cheby1(n,Rp,900/1400);
oef_table = table(b',a','VariableNames',{'Numerator_Coefficients','Denominator_Coefficients'})
