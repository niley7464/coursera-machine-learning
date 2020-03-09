function p = predictOneVsAll(all_theta, X)

m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);
X = [ones(m, 1) X];
   
predict = all_theta*X';

for i = 1:m
    [x,ix] = max(predict(:,i),[],1);
    p(i,:) = ix;
end

end