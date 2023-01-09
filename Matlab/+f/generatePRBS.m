function PRBS = generatePRBS(n,p,fD,Ts,info)
% PRBS = generatePRBS(n,p,fD,Ts,info)
% generatePRBS generates a prbs signal of length (fD.p.((2^n)-1). 
% If info == 1, it also gives information on the generated signal, such as
% the d° of excitation, sampling frequency, resolution, simulation
% duration. It also plots the power spectral density function of the
% signal.

%generate signal
PRBS = f.prbs(n,p);
%stretch
PRBS = repmat(PRBS',fD,1);
PRBS = reshape(PRBS,numel(PRBS),1);
if info == 1
    %get info
    M = fD*(2^n-1);half = pi/Ts;t_prbs=M*p*Ts;
    formatSpec = ...
    'd° of excitation: %d\nSampling frequency: %.2f\nInterval: %.2f\nSimulation duration: %.2f\n';
    fprintf('PRBS signal:\n')
    fprintf(formatSpec,M,2*half,half/((M-1)/2),t_prbs)
    %Power spectral density fucntion of input
    close all;
    f.pwrSpectralDensityPlot(PRBS,M,Ts,info);
end
end

