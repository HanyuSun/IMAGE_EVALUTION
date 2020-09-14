function [ME]=me(I,K)
Diff = double(I)-double(K);
ME = sum(Diff(:))/sum(K(:));
end