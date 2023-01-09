function [fs,spectrum] =  pwrSpectralDensityPlot(signal,M,Ts,info)
% [fs,spectrum] = pwrSpectralDensityPlot(inputSignal,M,Ts)
% pwrSpectralDensityPlot returns the frequency vector and associated
% amplitude plots the power spectral density function of
% inputSignal, with degree of excitation M and samplis time Ts.
omega = (2*pi)/Ts;
step = omega/M ;
frequency_vector = 0:step:(M-1)*step;
fourU = fft(signal(1:M));
Phi = abs(frd(fourU,frequency_vector))^2;
tmp = Phi.ResponseData(:);

fs = frequency_vector(1:(M-1)/2);
spectrum = tmp(1:(M-1)/2);

if info == 1
    figure()
    plot(frequency_vector(1:(M-1)/2),tmp(1:(M-1)/2));
    title('\Phi_{uu}(w)')
end
end

