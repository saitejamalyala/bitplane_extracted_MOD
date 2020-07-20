function [out1,out2] = xor_higherorder_bitplanes_merge_threshold(img1,img2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
A=imread(img1);
A = rgb2gray(A);
B5=bitget(A,5);
B6=bitget(A,6);
B7=bitget(A,7);
B8=bitget(A,8);

P=imread(img2);
P = rgb2gray(P);
Q5=bitget(P,5);
Q6=bitget(P,6);
Q7=bitget(P,7);
Q8=bitget(P,8);

R5 = bitxor(B5,Q5);
R6 = bitxor(B6,Q6);
R7 = bitxor(B7,Q7);
R8 = bitxor(B8,Q8);

higher_merge=zeros(size(A));

higher_merge = bitset(higher_merge,5,R5);
higher_merge = bitset(higher_merge,6,R6);

higher_merge = bitset(higher_merge,7,R7);

higher_merge = bitset(higher_merge,8,R8);

higher_merge = uint8(higher_merge);

out1 = imbinarize(higher_merge,0.5);
out2 = higher_merge;
end

