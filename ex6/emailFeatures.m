function x = emailFeatures(word_indices)
    
% Total number of words in the dictionary
n = 1899;

% You need to return the following variables correctly.
x = zeros(n, 1);

len = length(word_indices);

for i = 1:len
    x(word_indices(i,:),:)=1;
end

end
