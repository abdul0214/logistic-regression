% clear all
load('data_set2Kx17.mat');
alps=letterrecognition(:,1);
alps=char(table2array(alps));
Yall=getMapping(alps);
Xall=letterrecognition(:,[2:17]);
Xall=table2array(Xall);
Xall=zscore(Xall);
Xtest=Xall([16000:end],:);
Ytest=Yall(16000:end)';
%% no of training samples
training_instances=1000;
%% getting response data
Ytrain=Yall(1:training_instances)';
%% 
%% getting predictor data
Xtrain=Xall([1:training_instances],:);
%% Training
tic
Betas=MLR(Xtrain,Ytrain);
e_time=toc
%% Testing
Ypred_test=getPredMLR(Betas,Xtest);
error_test=getError(Ypred_test,Ytest)
Ypred_train=getPredMLR(Betas,Xtrain);
error_train=getError(Ypred_train,Ytrain)
