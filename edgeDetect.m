
function edge=edgeDetect(map)
    global mapWidth;
    global mapHeight;
    edge=5*map-[map(2:end);zeros(1,mapWidth)]-[zeros(1,mapWidth);map(1:end-1)]-[zeros(mapHeight,1),map(:,2:endl)]-[zeros(mapHeight,1),map(:,1:endl-1);];
    edge=find(edge>0);
    plot(edge);
end