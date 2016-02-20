function KNNSimpleDriver

% Number of data points
numPt = 200;

% Random seed
rng(22);

% Set of dimensions
ps = (1:10:101);
lenPs = length(ps);

% Generate the baseline random vector
origAvg = 0;
origVar = 1;
origRand = origVar.*randn(numPt, 1) + origAvg;

newAvg = 3;
newVar = 1;
for i=1:lenPs
  
    % Generate the random matrices
    compRand = zeros(numPt, ps(i));
    for j=1:ps(i)
        compRand(:,j) = newVar.*randn(numPt, 1) + newAvg;
    end

    % Run KNN on the given matrices where k = 1 and 3
    KNNSimple(origRand, compRand, numPt, ps(i));
end

end