function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)

    m = length(y); % number of training examples
    n = length(theta);
    J_history = zeros(num_iters, 1);
    
    for iter = 1:num_iters
    
        new_theta = theta;
        for j = 1:n
            temp = 0;
            for i = 1:m
                temp = temp + (X(i,:)*theta- y(i,:))*X(i,j);
            end
            new_theta(j,:) = new_theta(j,:) - alpha * temp / m;
        end
        theta = new_theta;
    
        J_history(iter) = computeCost(X, y, theta);
    end
    end
    