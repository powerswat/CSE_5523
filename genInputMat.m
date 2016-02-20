function [trainMat, testMat] ...
    = genInputMat(origRand, compRand, numTrainPt, numTestPt, ps)

% Sampling the final points from the two distributions
rng(23);
trainMat = cell(numTrainPt, 2);
currOrigIdx = 1;
currCompIdx = 1;
for i=1:numTrainPt
    coinToss = randi(2);
    if coinToss == 1
        trainMat(i,1) = {[origRand(currOrigIdx),zeros(1, ps-1)]};
        trainMat(i,2) = {1};
        currOrigIdx = currOrigIdx + 1;
    else
        trainMat(i,1) = {compRand(currCompIdx,:)};
        trainMat(i,2) = {-1};
        currCompIdx = currCompIdx + 1;
    end
end

for i=1:numTestPt
    coinToss = randi(2);
    if coinToss == 1
        testMat(i,1) = {[origRand(currOrigIdx),zeros(1, ps-1)]};
        testMat(i,2) = {1};
        currOrigIdx = currOrigIdx + 1;
    else
        testMat(i,1) = {compRand(currCompIdx,:)};
        testMat(i,2) = {-1};
        currCompIdx = currCompIdx + 1;
    end
end

end