function [NMSE]=nmse(I,K)
Diff = (double(I)-double(K)).^2;
Diff_sum = sum(Diff(:));
K_2 = K.^2;
K_sum = sum(K_2(:));
NMSE = Diff_sum/K_sum;
end