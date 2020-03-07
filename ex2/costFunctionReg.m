function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

reg_theta = theta;
reg_theta(1) = 0;

J = (-y'*log(sigmoid(X*theta)) - (1-y)'*log(1-sigmoid(X*theta)))/m + (lambda/(2*m))*sum(reg_theta.^2);
grad = (((sigmoid(X*theta)-y)'*X)'+lambda*reg_theta)/m;

end