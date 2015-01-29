
function FindLOSherClick(hObject,eventdata, handles)
tic;
	global Map ;
	global lastX;
	global lastY;
	global los;
    global cutoff;
	los=findFineLOS(Map,los,lastX,lastY,10,2);
    disp('FinLos End');
    if cutoff~=0
        los=findCutoff(Map,los,lastX,lastY,10,2,3,cutoff);
    end
    Drawmap(Map);
	disp('Map Refreshed');
toc;
end
