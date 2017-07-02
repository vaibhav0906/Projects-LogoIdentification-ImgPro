function out = NearbyComp(ar)
[m n] = size(ar);
threshold = 20;
i = 1;
while(i<=m)
	j=i+1;
	while(j<=m)
		if (abs(ar(i,1)-ar(j,1))<threshold && abs(ar(i,2)-ar(j,2))<threshold)
			ar(i,3) = uint64(ar(i,3)+ar(j,3));
			ar(i,4) = uint64(ar(i,4)+ar(j,4));
			ar(i,5) = uint64(ar(i,5)+ar(j,5));
			ar(i,1) = uint64(ar(i,3)/ar(i,5));
			ar(i,2) = uint64(ar(i,4)/ar(i,5));
			ar(j,:) = [];
			m=m-1;
		else
			j=j+1;
		end
	end
	i=i+1;
end
out = ar;
