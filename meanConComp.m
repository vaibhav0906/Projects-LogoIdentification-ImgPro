function out = meanConComp(a)
%Returns the means of different connected components.
%Convert the image into grayscale if it is RGB.
if ndims(a)==3
	a = rgb2gray(a);
	end
%Dilate the original image.
a = LogoDetect(a);
%Invert the image i.e. make white parts black and vice versa.
a = RG1(a);
%Find connected components.
cc = bwconncomp(a);
%no = number of connected components.
no = cc.NumObjects;
%[m n] = Image Size.
m=cc.ImageSize;
n=m(1,2);
m=m(1,1);
out = zeros([no 2]);
pix = cc.PixelIdxList;
for i=1:no
	sumx = uint64(0);
	sumy = uint64(0);
	[s s2] = size(pix{i});
	for j=1:s
		[y x] = ind2sub([m n],pix{i}(j));
		sumx = sumx+x;
		sumy = sumy+y;
	end
	out(i,3) = sumx;
	out(i,4) = sumy;
	out(i,5) = s;
	sumx = sumx/s;
	sumy = sumy/s;
	out(i,1) = sumx;
	out(i,2) = sumy;
end
