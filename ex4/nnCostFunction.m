function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

a_1 = [ones(m,1) X];
z_2 = a_1*Theta1';
a_2 = sigmoid(z_2);
a_2 = [ones(size(a_2,1),1) a_2];
z_3 = a_2*Theta2';
a_3 = sigmoid(z_3);

y_new = zeros(m,size(y,2));
for i = 1:m 
    y_new(i,y(i,:)) = 1;
end

J = sum(sum(-y_new.*log(a_3)-(1-y_new).*log(1-a_3)))/m;

reg_theta_1 = Theta1;
reg_theta_1(:,1) = 0;

reg_theta_2 = Theta2;
reg_theta_2(:,1) = 0;

% Regularized
J = J + (lambda/(2*m)) * (sum(sum(reg_theta_1 .^2)) + sum(sum(reg_theta_2 .^2)));

Delta_1 = 0;
Delta_2 = 0;

for i = 1:m
    x = [1 X(i,:)];
    z_2 = x*Theta1';
    a_2 = sigmoid(z_2);
    a_2 = [1 a_2];
    z_3 = a_2*Theta2';
    a_3 = sigmoid(z_3);

    delta_3 = a_3 - y_new(i,:);
    delta_2 = (delta_3*Theta2) .* [1 sigmoidGradient(z_2)];
    delta_2 = delta_2(2:end);

    Delta_1 += Theta1_grad + delta_2'*x;
    Delta_2 += Theta2_grad + delta_3'*a_2;
end

Theta1_grad = Delta_1/m;
Theta1_grad(:,2:end) += (lambda/m)*Theta1(:,2:end);
Theta2_grad = Delta_2/m;
Theta2_grad(:,2:end) += (lambda/m)*Theta2(:,2:end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end