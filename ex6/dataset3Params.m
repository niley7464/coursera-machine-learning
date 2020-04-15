function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

error_min = inf;

for i = list
    for j = list
        model= svmTrain(X, y, i, @(x1, x2) gaussianKernel(x1, x2, j)); 
        predictions = svmPredict(model,Xval);
        err = mean(double(predictions ~= yval));
        if(err<error_min)
            C = i;
            sigma = j;
            error_min = err;
        end
    end
end

end
