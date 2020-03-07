function J = computeCost(X, y, theta)

    m = length(y); % number of training examples
    
    temp = X * theta - y;
    temp = temp.^2;
    S = sum(temp(:));
    J = S/(2*m);
    
    end    