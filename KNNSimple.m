function KNNSimple(origRand, compRand, numPt, ps)

% Sampling the final points from the two distributions
rng(22);

finalInput = cell(numPt, 2);
for i=1:numPt
    pickedIdx = randi(200);
    coinToss = randi(2);
    if coinToss == 1
        finalInput(i,1) = {[origRand(pickedIdx),zeros(1, ps-1)]};
        finalInput(i,2) = {1};
    else
        finalInput(i,1) = {compRand(pickedIdx,:)};
        finalInput(i,2) = {-1};
    end
end


% Calculate distance between every pair


end