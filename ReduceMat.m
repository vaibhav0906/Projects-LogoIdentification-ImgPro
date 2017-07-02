function out = ReduceMat(ar,val)
%Deletes the rows where number of pixels is less than a given threshold value.
[m n] = size(ar);
i=1;
while(i<=m)
	if(ar(i,5)<val)
		ar(i,:)=[];
		m=m-1;
	else
		i=i+1;
	end
end
out = ar;
