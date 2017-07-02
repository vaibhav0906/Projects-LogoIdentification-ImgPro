function out = LargeComp(image)
%Deletes noise and return means of coordinates of logo(s)
	[m n r] = size(image);
	if (m>800 || n>800)
		image = imresize(image,0.5);
	end
ar = meanConComp(image);
%ar contains the means of different connected components, and the number of pixels in each connected component.
count=[0 0 0];
%Count number of connected components according to the number of pixels they have.
%count(1) = Number of small connected components.
%count(2) = Number of medium connected components.
%count(3) = Number of large connected components.
%ar(i,5) = Number of pixels in ith connected component.
i=1;
ub = 1000;	%ub = Upper Threshold Value
lb = 5;	%lb = Lower Threshold Value
max = 0;
ar = NearbyComp(ar);
[m n] = size(ar);
while(i<=m)
	if(ar(i,5)>max)
		max = ar(i,5);
	end
	if ar(i,5)>ub
		count(3)=count(3)+1;
	elseif ar(i,5)<lb
		count(1)=count(1)+1;
	else 
		count(2)=count(2)+1;
	end
	i=i+1;
end
mean = zeros(1,2);
%max
ar
count
%ar = ReduceMat(ar,lb);
if(count(3)>0)
ar = ReduceMat(ar,ub);
else
	if(count(2)>1)
	ar = ReduceMat(ar,lb);
	end
end


[m n] = size(ar);
for i=1:m
	mean(i,1) = ar(i,1);
	mean(i,2) = ar(i,2);
end
%count
%mean
SegmentAll(mean,image);
out = ar;
