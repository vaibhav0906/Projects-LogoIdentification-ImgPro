function [out] = LogoDetect(a)
%Returns dilated image.
%Morphology
s=[0 1 0;1 1 1;0 1 0];
if ndims(a)==3
	a = rgb2gray(a);
end
%Number of dilations.
no = 3;
for i=1:no
	a=imdilate(a,s);
end
d=graythresh(a);
a=im2bw(a,d);
figure,imshow(a);
out = a;
