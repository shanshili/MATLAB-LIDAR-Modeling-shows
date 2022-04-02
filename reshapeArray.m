function [c] = reshapeArray (Array)
n=100;
L = fix(length(Array)/n);
Array = Array(1:(L*n),1);
B = reshape(Array,L,n);
c = reshape(B',L*n,1);
end