function B=FormLOSDistanceMatrix(X,Y,map)
	B=zeros(length(X)*length(Y),length(X)*length(Y));
	for i=1:1:length(X)
		for j=1:1:length(Y)
			for k=1:1:length(X)
                for l=1:1:length(Y)
                    B((i-1)*length(Y)+j,(k-1)*length(Y)+l)=Do2LP(map,X(i),Y(j),X(k),Y(l),0,0);
                end
            end
		end
	end
end