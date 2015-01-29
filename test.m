clear; 
clc;
tic;
load('Mapdata_Zero.mat')
[Xs,Ys]=GenScatterPoints(data,250,300,200,250,2);
disp('generate scatter points')
toc;
[TD,DD,BD,RD]=LOSDisMatrix(292,245,Xs,Ys,280,240,3,1.8,data);
disp('form LOS Distance Matrix')
TaoT=TD/(3*10^8);
TaoD=DD/(3*10^8);
TaoB=BD/(3*10^8);
TaoR=RD/(3*10^8);
disp('form Tao')
toc;
Fmin=2*10^9;
deltaF=0.5*10^3;
[TgohneF,DgohneF,BgohneF,RgohneF]=FormGohneF(TD,DD,BD,RD,TaoT,TaoD,TaoB,TaoR,8);
N=length(BD);
disp('form Submat ohne Frequency');
loop=2000;
parfor n=1:1:loop;
F=Fmin+deltaF*n;
D=DgohneF/F.*exp(-j*2*pi.*TaoD*F);
T=TgohneF/sqrt(F).*exp(-j*2*pi.*TaoT*F);
B=BgohneF.*exp(-j*2*pi.*TaoB*F);
R=RgohneF/sqrt(F).*exp(-j*2*pi.*TaoR*F);
H(n)=D+R*inv(eye(N)-B)*T;
Q(n)=R*inv(eye(N)-B)*T;
end

Hex=[H,fliplr(H)];
Qex=[Q,fliplr(Q)];
Hex=Hex.*fftshift(hann(2*loop)');
Qex=Qex.*fftshift(hann(2*loop)');

subplot(211);
plot(log(abs(H)));
hold on
plot(log(abs(Q)));
h=ifft(Hex);
q=ifft(Qex);
h=h(1:length(h)/2);
q=q(1:length(q)/2);
subplot(212);
plot(log(abs(h)));
hold on;
plot(log(abs(q)));
toc;

