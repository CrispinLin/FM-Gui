% Count outdegree
% input:Matrix
% output:vector of nums of LOS points

function Outdegree=DCountOutdegree(D)
    for i=1:1:length(D)
        Outdegree(i)=length(find(D(i,:)>0));
    end
end