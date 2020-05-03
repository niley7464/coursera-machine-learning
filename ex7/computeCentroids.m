function centroids = computeCentroids(X, idx, K)

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);

for i = 1:K
    indexes = idx == i;
    centroids(i, :) = mean(X(indexes, :));
end

end

