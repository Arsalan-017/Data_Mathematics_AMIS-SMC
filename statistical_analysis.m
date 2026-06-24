clc
close all
clear all
alpha_AMIS_SMC = [5.4855, 5.479, 5.47, 5.466, 5.46, 5.454, 5.448, 5.44, 5.436, 5.43, 5.423, 5.416, 5.41, 5.4, 5.39, 5.39, 5.38, 5.377, 5.37, 5.382, 5.39, 5.38, 5.376, 5.37, 5.36, 5.36, 5.352, 5.344, 5.337, 5.33, 5.323];
q_AMIS_SMC = [10.02, 10.03, 10.034, 10.04, 10.04, 10.047, 10.05, 10.06, 10.06, 10.06, 10.067, 10.07, 10.07, 10.07, 10.08, 10.08, 10.08, 10.087, 10.09, 10.147, 10.2, 10.2, 10.2, 10.2, 10.2, 10.2, 10.21, 10.21, 10.21, 10.21, 10.213];
% SSMC_PPO_Sort = sort(q_SSMC_PPO);
% med_SSMC_PPO = median(SSMC_PPO_Sort)
% IQR_SSMC_PPO = iqr(SSMC_PPO_Sort)

alpha_iSMC = [19.05, 19.132, 19.16, 19.2, 19.235, 19.25, 19.32, 19.32, 19.37, 19.384, 19.423, 19.45, 19.46, 19.477, 19.52, 19.52, 19.555, 19.575, 19.576, 19.586, 19.6, 18.623, 19.645, 19.664, 19.676, 19.693, 19.71, 19.723, 19.734, 19.75, 19.766];
q_iSMC = [17.27, 17.27, 17.27, 17.27, 17.27, 17.27, 17.27, 17.27, 17.27, 17.27, 17.276, 17.275, 17.277, 17.277, 17.276, 17.277, 17.278, 17.28, 17.281, 17.28, 17.28, 17.28, 17.284, 17.282, 17.284, 17.284, 17.285, 17.287, 17.285, 17.288, 17.288];
% SSMC_Sort = sort(q_SSMC);
% med_SSMC = median(SSMC_Sort)
% IQR_SSMC = iqr(SSMC_Sort)
 
alpha_SMC = [18.55, 18.56, 18.563, 18.568, 18.574, 18.58, 18.587, 18.59, 18.6, 18.61, 18.62, 18.634, 18.65, 18.66, 18.66, 18.67, 18.674, 18.7, 18.705, 18.715, 18.734, 18.753, 18.76, 18.773, 18.783, 18.781, 18.8, 18.795, 18.826, 18.83, 18.838];
q_SMC = [12, 12, 12, 12, 11.96, 11.96, 11.96, 11.96, 11.96, 11.96, 11.96, 11.96, 11.92, 11.92, 11.92, 11.92, 11.92, 11.92, 11.92, 11.88, 11.88, 11.88, 11.88, 11.88, 11.88, 11.88, 11.84, 11.84, 11.84, 11.84, 11.84];
% SMC_Sort = sort(q_SMC);
% med_SMC = median(SMC_Sort)
% IQR_SMC = iqr(SMC_Sort)

[p_value, h, stats] = ranksum(q_AMIS_SMC, q_iSMC);
r_value = abs(stats.zval)/sqrt(64)
% Display the results
disp(['p-value: ', num2str(p_value)]);
disp(['Test decision (h): ', num2str(h)]);
disp('Test statistics:');
disp(stats);

R = stats.ranksum
U_1 = 31*31 + (31*(32)/2) - R
U_2 = 31*31 -U_1
Ustat = min(U_1, U_2)

%time reduction
t_AMIS_SMC = [11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11];
t_AMIS_SMC_Sort = sort(t_AMIS_SMC);
med_t_AMIS_SMC = median(t_AMIS_SMC_Sort)
IQR_t_AMIS_SMC = iqr(t_AMIS_SMC_Sort)

t_SMC = [18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 17, 17, 17, 17, 17, 17, 17, 17, 17];
t_SMC_Sort = sort(t_SMC);
med_t_SMC = median(t_SMC_Sort)
IQR_t_SMC = iqr(t_SMC_Sort)

t_iSMC = [17, 17, 17, 17, 17, 17, 17, 17, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 15, 15, 15, 15, 15, 15, 14, 14, 14, 14, 14, 13];
t_iSMC_Sort = sort(t_iSMC);
med_t_iSMC = median(t_iSMC_Sort)
IQR_t_iSMC = iqr(t_iSMC_Sort)

%time reduction others
t_Others = [30, 50, 100, 200, 60, 68, 70, 100, 20, 30, 15, 22, 20, 25, 45, 45, 47, 3, 5, 6];
t_Others_Sort = sort(t_Others);
med_Others = median(t_Others_Sort)
IQR_Others = iqr(t_Others_Sort)

[p_value_t, h_t, stats_t] = ranksum(t_AMIS_SMC, t_Others);
r_value_t = abs(stats_t.zval)/sqrt(51)
% Display the results
disp(['p-value: ', num2str(p_value_t)]);
disp(['Test decision (h): ', num2str(h_t)]);
disp('Test statistics:');
disp(stats_t);

R1 = stats_t.ranksum
U1 = 31*20 + (31*(32)/2) - R1
U2 = 31*20 -U1
U_stat = min(U1, U2)

%Fishers test for AMIS-SMC vs conventional SMC
F1 = [60 0; 28 32];
[~,p1,stats1] = fishertest(F1);
fprintf('P-value = %.6f\n',p1);
disp(stats1)

%Fishers test for AMIS-SMC vs integral SMC
F2 = [60 0; 32 28];
[~,p2,stats2] = fishertest(F2);
fprintf('P-value = %.6f\n',p2);
disp(stats2)

