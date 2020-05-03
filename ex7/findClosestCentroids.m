function idx = findClosestCentroids(X, centroids)

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

tmp = zeros(K,1);
for i = 1:size(X,1)
    for j = 1:K
        tmp(j,:) = sum((centroids(j,:)-X(i,:)).^2 + (centroids(j,:)-X(i,:)).^2);
    end
    [val idx(i)] = min(tmp);
end

end

