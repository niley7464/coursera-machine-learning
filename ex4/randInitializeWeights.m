function W = randInitializeWeights(L_in, L_out)

W = zeros(L_out, 1 + L_in);

epsilon_init = 0.2;
W = rand(L_out,L_in + 1)*2*epsilon_init - epsilon_init;

end
