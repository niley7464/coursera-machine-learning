function Z = projectData(X, U, K)

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

U_reduce = U(:, 1:K);

Z = X * U_reduce;

end
