function [errorRate] ...
    = KNNSimple(trainMat, testMat, numTrainPt, numTestPt, numNeighbor)

% Calculate distances between every two data points
tic;
distMat = zeros(numTestPt, numTrainPt);
for i=1:numTestPt
    firstMat = cell2mat(testMat(i,1));
    for j=1:numTrainPt
        secondMat = cell2mat(trainMat(j,1));
        distMat(i,j) = norm(firstMat - secondMat);
    end
end
toc

% Find the nearest neighbor point(s) for each data point
classResults = zeros(numTestPt,1);
if numNeighbor == 1
    [minDists, minIdcs] = min(distMat,[],2);
    classResults = cell2mat(trainMat(minIdcs,2));
else
    [sortedDist, sortedIdcs] = sort(distMat, 2);
    for i=1:numTestPt
        overallScore = sum(cell2mat(trainMat(sortedIdcs(i,1:3),2)));
        if overallScore > 0
            classResults(i) = 1;
        else
            classResults(i) = -1;
        end
    end  
end

% Validate the classfication results
grdTruthMat = cell2mat(testMat(:,2));
validation = (classResults == grdTruthMat);
errorRate = ((numTestPt - sum(validation)) / numTestPt);

end