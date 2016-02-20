function KNNSimpleDriver

% Number of data points
numTrainPt = 200;
numTestPt = 1000;

% Random seed
rng(23);

% Set of dimensions
ps = (1:10:101);
lenPs = length(ps);

% Generate the baseline random vector
origAvg = 0;
origVar = 1;
origRand = origVar.*randn(numTestPt, 1) + origAvg;

newAvg = [3, zeros(1,101)];
newVar = 1;
errorRates = zeros(lenPs,2);
for i=1:lenPs
  
    % Generate the random matrices
    compRand = zeros(numTestPt, ps(i));
    for j=1:ps(i)
        compRand(:,j) = newVar.*randn(numTestPt, 1) + newAvg(j);
    end

    % Generate a training and a testing input matrix by sampling the 
    % two given distributions
    [trainMat, testMat] ...
        = genInputMat(origRand, compRand, numTrainPt, numTestPt, ps(i));
    
    % Run KNN on the given matrices where k = 1
    errorRates(i,1) = KNNSimple(trainMat, testMat, numTrainPt, numTestPt, 1);
    
    % Run KNN on the given matrices where k = 3
    errorRates(i,2) = KNNSimple(trainMat, testMat, numTrainPt, numTestPt, 3);
end

plot(errorRates(:,1));
hold on
plot(errorRates(:,2));
hold off

end