﻿	 IMPORT ML;
	 
   value_record := RECORD
   UNSIGNED rid;
   UNSIGNED X_1;
   REAL X_2;
	 REAL X_3;
	 REAL X_4;
	 REAL X_5;
	 REAL X_6;
   REAL Y;
   END;
   d := DATASET([{1,5,10.753,3.8275,-5.1651,-0.45723,-65.361,87.567},
		{2,10,36.678,-6.8827,-19.267,15.106,21.841,373.17},
		{3,15,-45.177,4.0883,23.064,133.31,-40.738,973.73},
		{4,20,17.243,9.2923,-40.117,-49.066,-16.075,-118.86},
		{5,25,6.3753,2.7867,-2.6924,-93.59,26.534,-464.71},
		{6,30,-26.154,5.8978,-34.765,-20.478,49.876,-2.7761},
		{7,35,-8.6718,4.1432,-50.289,98.854,-53.647,1048.2},
		{8,40,6.8525,-1.7296,-102.31,31.401,60.512,646.22},
		{9,45,71.568,1.6751,18.648,24.04,31.687,926.5},
		{10,50,55.389,-4.4875,-9.8814,51.891,-3.2575,1110.7},
		{11,55,-26.998,5.0639,-40.726,-47.105,-9.3706,14.341},
		{12,60,60.698,-6.5383,-40.349,3.173,-10.445,839.86},
		{13,65,14.508,-6.0926,27.714,3.4263,-14.549,678.47},
		{14,70,-1.2611,-4.6141,19.585,-18.101,1.1062,493.09},
		{15,75,14.295,-16.782,42.063,27.109,2.4619,942.08},
		{16,80,-4.0993,8.1988,109.88,-4.0917,39.651,674.38},
		{17,85,-2.4829,1.8536,-462.52,6.3303,73.295,806.71},
		{18,90,29.794,-4.3031,2.7143,16.88,22.412,1079.5},
		{19,95,28.181,7.8107,-100.44,7.2777,-10.066,1045.3},
		{20,100,28.344,-9.7556,-6.0129,-34.527,30.009,769.99}],value_record);
   	ML.ToField(d,o);
	X := O(Number IN [1, 2, 3, 4, 5, 6]); // Pull out the X
  Y := O(Number = 7); // Pull out the Y
	
	vars := DATASET([{1},{2},{4}], {UNSIGNED4 number});
	
	modelf := ML.StepRegression.ForwardRegression(X, Y);
	modelb := ML.StepRegression.BackwardRegression(X, Y);
	modelbi := ML.StepRegression.BidirecRegression(X, Y, vars);
	
	OUTPUT(modelf.Steps, NAMED('ForwardSteps'));
	OUTPUT(modelf.BestModel.betas, NAMED('ForwardBestBetas'));
	OUTPUT(modelb.Steps, NAMED('BackwardSteps'));
	OUTPUT(modelb.BestModel.betas, NAMED('BackwardBestBetas'));
	OUTPUT(modelbi.Steps, NAMED('BidirecSteps'));
	OUTPUT(modelbi.BestModel.betas, NAMED('BidirecBestBetas'));
	