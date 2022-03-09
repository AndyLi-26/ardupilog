clc; clear all; close all;
close all;
log=Ardupilog('00000046.BIN');
log=cleanup(log);
figure;
i=9;
subplot(i,1,1);
log.plot('BAT/Volt'); 
%log.plot('BAT/VoltR');
title(sprintf("max=%.2f min=%.2f landing=%.2f",max(log.BAT.Volt),min(log.BAT.Volt),log.BAT.Volt(end)));

subplot(i,1,2);
log.plot('BAT/Curr'); 
%log.plot('BAT/CurrTot');
title(sprintf("max=%.2f min=%.2f landing=%.2f",max(log.BAT.Curr),min(log.BAT.Curr),log.BAT.Curr(end)));

subplot(i,1,3);
plot(log.BAT.TimeS,log.BAT.Curr.*log.BAT.Volt);
xlabel("Time(s)");ylabel("Power(V*I)");grid on;
%total_Power=;
%title()

subplot(i,1,4);
log.plot('ARSP/Airspeed');
title(sprintf("max=%.2f min=%.2f landing=%.2f",max(log.ARSP.Airspeed),min(log.ARSP.Airspeed),mean(log.ARSP.Airspeed)));

% subplot(i,1,5);
% Distance covered
% subplot(i,1,6);
% Vertical ascent and descent - rate, time and distance
% subplot(i,1,7);
% Transition altitude
% subplot(i,1,8);
% PWM outputs time series
saveas(gcf,'myfigure.pdf')