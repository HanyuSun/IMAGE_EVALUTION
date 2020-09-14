function [NCC]=ncc(I,K)
meani = I - mean(I(:));
meank = K - mean(K(:));
stdi = std(I(:));
stdk = std(K(:));
comb = (meani.*meank)/stdi/stdk;
NCC = mean(comb(:));
end