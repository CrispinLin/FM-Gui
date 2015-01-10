function B=FormB(X,Y,map)
	B=zeros(length(X),length(X));
	for i=1:1:length(X)
		for j=1:1:length(Y)
			B(i,j)=Do2LP(X(i),Y(j),map);
		end
	end
end