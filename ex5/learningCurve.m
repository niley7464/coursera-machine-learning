function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
    theta = trainLinearReg(X(1:i,:),y(1:i),lambda);
    [J_train,grad_train] = linearRegCostFunction(X(1:i,:),y(1:i),theta,0);
    [J_val,grad_val] = linearRegCostFunction(Xval,yval,theta,0);
    error_train(i) = J_train;
    error_val(i) = J_val;

end
