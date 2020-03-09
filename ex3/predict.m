function p = predict(Theta1, Theta2, X)

m = size(X, 1);
num_labels = size(Theta2, 1);
p = zeros(size(X, 1), 1);

X = [ones(m, 1) X];
z_2 = X*Theta1';
a_2 = sigmoid(z_2);

a_2 = [ones(size(a_2),1) a_2];
z_3 = a_2*Theta2';
a_3 = sigmoid(z_3);

for i = 1:m
    [x,ix] = max(a_3(i,:),[],2);
    p(i,:) = ix;
end

end