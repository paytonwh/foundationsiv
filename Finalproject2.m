%Set path and change file type
cd ('/Users/payto/Desktop/GPN/gitFound4')
% Replace 'your_file.csv' with your actual file name
found4 = readtable('Foundations4 Dataset .csv');

% Replace 'your_data.mat' with the desired output file name
save('found4data.mat', 'found4');
%% 
%Load compatible file
load ('found4data.mat')
%% set variables 
age = found4.age;
edu = found4.education_yrs;
gender= found4.gender;
faq= found4.facquisition;
fgen= found4.fgen;
sleeplat = found4.psqi_sleeplatencymin;
tst = found4.psqi_hourssleep;
sleepqual= found4.psqi_sleepquality;
%% 
%Get summary statistics for variable
summary(found4(:, {'psqi_hourssleep', 'psqi_sleeplatencymin', 'psqi_sleepquality', 'fgen', 'age', 'gender','education_yrs'}));

%%
%Make histograms for individual variables, no histogram for gender and self
%reported sleep quality as they are categorical variables
figure
histogram(age,10)
xrange = [60 84];
title('AGE')
xlabel('Age')
ylabel('Frequency')

figure
histogram(edu,10)
xrange = [10 25];
title('Education')
xlabel('Education')
ylabel('Frequency')

figure
histogram(found4.psqi_hourssleep,20)
xrange = [0 10]
title('Total Sleep Time')
xlabel('TST')
ylabel('Frequency')

figure
histogram(sleeplat,20)
xrange = [0 10];
title('sleep latency')
xlabel('Sleep Latency')
ylabel('Frequency')


figure 
histogram(fgen,10)
xrange = [0 1];
title('Generalization Performance')
xlabel('Generalization Performance')
ylabel('Frequency')

%%
%Scatter plots for each variable against fgen 
figure;
scatter(sleeplat, fgen, [], 'k', 'filled', 'MarkerFaceAlpha',0.2)
xlabel('sleep latency ')
ylabel('fgen')

figure;
scatter(sleepqual, fgen)
scatter(sleepqual, fgen, [], 'k', 'filled','filled', 'MarkerFaceAlpha',0.2 )
xlabel('sleep quality ')
ylabel('fgen')

figure;
scatter(tst, fgen)
scatter(tst, fgen, [], 'k', 'filled', 'filled', 'MarkerFaceAlpha',0.2)
xlabel('total sleep time ')
ylabel('fgen')

%%
%Conduct Pearson's Correlations on the continuous variables 
[R_sq_num, P_sq_num] = corrcoef(sleepqual,fgen);
disp(['Pearson Correlation (Sleep Quality): r = ', num2str(R_sq_num(1, 2)), ', p = ', num2str(P_sq_num(1, 2))]);

%Conduct Spearman's correlation on sleep latency and generalization because it is not normally
%distributed. 
[rho_sl, p_rho_sl] = corr(sleeplat, fgen, 'Type', 'Spearman');
disp(['Spearman Correlation (Sleep Latency): rho = ', num2str(rho_sl), ', p = ', num2str(p_rho_sl)]);

%Conduct Pearson's correlation on total sleep time and generalization
%performance
[R_tst, P_tst] = corrcoef(tst, fgen);
disp(['Pearson Correlation (Total Sleep Time): r = ', num2str(R_tst(1, 2)), ', p = ', num2str(P_tst(1, 2))]);

%%
%Conduct simple linear regression on sleep quality without covariates
sleepqualregression = fitlm(sleepqual,fgen)
figure;
plot(sleepqualregression)

%Conduct simple linear regression on sleep quality and fgen with covariates
sleepqual_data_table = table(fgen, sleepqual, age, gender, edu, faq);
sleepqualregression2 = fitlm(sleepqual_data_table, 'fgen ~  sleepqual + age + gender + edu + faq')
figure; plot (sleepqualregression2)
%%
%Conduct simple linear regression on sleep latency and check residual
%distribution without covariates
sleeplatregression = fitlm(sleeplat,fgen) 
figure; plot(sleeplatregression)

%Conduct simple linear regression on sleep latency and fgen with covariates
sleeplat_data_table = table(fgen, sleeplat, age, gender, edu, faq);
sleeplatregression2 = fitlm(sleeplat_data_table, 'fgen ~  sleeplat + age + gender + edu + faq')
figure; plot (sleeplatregression2)

%%
%Conduct simple linear regression on total sleep time and check residual
%distribution without covariates
tstregression = fitlm(tst,fgen)
figure; plot(tstregression)

%Conduct simple linear regression on sleep latency and fgen with covariates
tst_data_table = table(tst, age,gender, edu, fgen,faq);
tstregression2 = fitlm(tst_data_table, 'fgen ~ tst + age + gender + edu + faq')
figure; plot (tstregression2)

%%
%Conduct multiple regression on all variables without covariates
multiplereg_table = table (fgen, tst, sleeplat, sleepqual, age, gender, edu, faq)
multiplereg = fitlm(multiplereg_table, 'fgen ~ tst + sleeplat + sleepqual');

%Conduct multiple regression on all variables with covariates
multiplereg_cov = fitlm(multiplereg_table, 'fgen ~ tst + sleeplat + sleepqual + age + gender + edu + faq');

%% 
%Run everything again without sleep latency outliers 

disp('Run without Sleep Latency Outliers')

%Set path and change file type
cd ('/Users/payto/Desktop/GPN/gitFound4')
% Replace 'your_file.csv' with your actual file name
found4_2 = readtable('Foundations4 Dataset.2.csv');

% Replace 'your_data.mat' with the desired output file name
save('found4data2.mat', 'found4_2');
%% 
%Load compatible file
load ('found4data2.mat')
%% set variables 
age2 = found4_2.age;
edu2 = found4_2.education_yrs;
gender2= found4_2.gender;
faq2= found4_2.facquisition;
fgen2= found4_2.fgen;
sleeplat2 = found4_2.psqi_sleeplatencymin;
tst2 = found4_2.psqi_hourssleep;
sleepqual2= found4_2.psqi_sleepquality;
%% 
%Get summary statistics for variable
summary(found4_2(:, {'psqi_hourssleep', 'psqi_sleeplatencymin', 'psqi_sleepquality', 'fgen', 'age', 'gender','education_yrs'}));

%%
%Make histograms for individual variables, no histogram for gender and self
%reported sleep quality as they are categorical variables
figure
histogram(age2,10)
xrange = [60 84];
title('AGE_2')

figure
histogram(edu2,10)
xrange = [10 25];
title('Education_2')

figure
histogram(sleeplat2,20)
xrange = [0 10];
title('sleep latency_2')

%how do i deal with the weird distribution of fgen? 
figure 
histogram(fgen2,10)
xrange = [0 1];
title('Generalization Performance_2')

%%
%Conduct Pearson's Correlations on the continuous variables 
[R_sq_num2, P_sq_num2] = corrcoef(sleepqual2,fgen2);
disp(['Pearson Correlation (Sleep Quality2): r = ', num2str(R_sq_num2(1, 2)), ', p = ', num2str(P_sq_num2(1, 2))]);

%Conduct Spearman's correlation on sleep latency and generalization because it is not normally
%distributed. 
[R_sl2, P_sl2] = corrcoef(sleeplat2, fgen2);
disp(['Pearson Correlation (Sleep Latency2): r = ', num2str(R_sl2(1,2)), ', p = ', num2str(P_sl2(1,2))]);

%Conduct Pearson's correlation on total sleep time and generalization
%performance
[R_tst2, P_tst2] = corrcoef(tst2, fgen2);
disp(['Pearson Correlation (Total Sleep Time2): r = ', num2str(R_tst2(1, 2)), ', p = ', num2str(P_tst2(1, 2))]);

%%
%Conduct simple linear regression on sleep quality without covariates
sleepqualregression3 = fitlm(sleepqual2,fgen2)
disp(sleepqualregression3)
figure; plot(sleepqualregression3)

%Conduct simple linear regression on sleep quality and fgen with covariates
sleepqual_data_table2 = table(fgen2, sleepqual2, age2, gender2, edu2, faq2);
sleepqualregression4 = fitlm(sleepqual_data_table2, 'fgen2 ~  sleepqual2 + age2 + gender2 + edu2 + faq2')
disp(sleepqualregression4)
figure; plot (sleepqualregression4)
%%
%Conduct simple linear regression on sleep latency and check residual
%distribution without covariates
sleeplatregression3 = fitlm(sleeplat2,fgen2)
disp(sleeplatregression3)
figure; plot(sleeplatregression3)

%Conduct simple linear regression on sleep latency and fgen with covariates
sleeplat_data_table2 = table(fgen2, sleeplat2, age2, gender2, edu2, faq2);
sleeplatregression4 = fitlm(sleeplat_data_table2, 'fgen2 ~  sleeplat2 + age2 + gender2 + edu2 + faq2')
disp(sleeplatregression4)
figure; plot (sleeplatregression4)

%%
%Conduct simple linear regression on total sleep time and check residual
%distribution without covariates
tstregression3 = fitlm(tst2,fgen2)
disp(tstregression3)
figure; plot(tstregression3)

%Conduct simple linear regression on sleep latency and fgen with covariates
tst_data_table2 = table(tst2, age2,gender2, edu2, fgen2,faq2);
tstregression4 = fitlm(tst_data_table2, 'fgen2 ~ tst2 + age2 + gender2 + edu2 + faq2')
disp(tstregression4)
figure; plot (tstregression4)

%%
%Conduct multiple regression on all variables without covariates
multiplereg_table2 = table (fgen2, tst2, sleeplat2, sleepqual2, age2, gender2, edu2, faq2)
multiplereg2 = fitlm(multiplereg_table2, 'fgen2 ~ tst2 + sleeplat2 + sleepqual2');
disp(multiplereg2)


%Conduct multiple regression on all variables with covariates
multiplereg_cov2 = fitlm(multiplereg_table2, 'fgen2 ~ tst2 + sleeplat2 + sleepqual2 + age2 + gender2 + edu2 + faq2');
disp(multiplereg_cov2)
