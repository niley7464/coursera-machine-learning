function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

tmp = X * theta - y;

reg_theta = theta;
reg_theta(1,:) = 0;
J = (sum(tmp.^2) + lambda * sum(reg_theta.^2))/(2*m);

grad(1,:) = (sum((X * theta - y).*X(:,1)))/m;

for i = 2:size(theta,1)
    grad(i,:) = (sum((X * theta - y).*X(:,i)))/m + (theta(i,:)*lambda)/m;
grad = grad(:);

end
