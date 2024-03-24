close all
clear all
clc

%dati
s=tf('s');
Gp=20/(2*s^3+200*s^2+5000*s);
Gd=1;
Gs=2;
Ga=-3;
Da0=222*10^(-2);
as=2*10^(-3);
ws=2000;

%traduzione delle specifiche
%1
Kd=1;
p=1;
Gf=1/(Kd*Gs);
%2
nu=0;
%3
Kp=20/5000;
nu=1;
%4
as=2*10^(-3);
MT_HF=1*10^(-5)*Gs/as;
MT_HF=20*log10(MT_HF);
wH=ws*10^(MT_HF/40);
wcmax=wH/2;
%7
val=10;
scap=val/100;
z=abs(log(scap))/sqrt(pi^2+log(scap)^2);
z=0.59;
Tp=1/(2*z*sqrt(1-z^2));
Sp=(2*z*sqrt(2+4*z^2+2*sqrt(1+8*z^2)))/(sqrt(1+8*z^2)+4*z^2-1);
Tp=1.05;
Sp=1.36;
%5
tr=0.1;
wcmin0=((1/sqrt(1-z^2)*(pi-acos(z))*sqrt(sqrt(1+4*z^4)-2*z^2)))/tr;
%6
val=5;
alfa=val/100;
tsalfa=1;
wcmin1=(-log(alfa)/z)*sqrt(sqrt(1+4*z^4)-2*z^2)/tsalfa;

%risultati ottenuti
nu=1;
p=1;
wcmin=19.7;
wcmax=100;
Tp=1.05;
Sp=1.36;
MT_HF=-40;
ws=2000;

%primo plot
Kc=-11000;
Gc=Kc/s^nu;
Lin=Gp*Ga*Gf*Gs*Gc;
figure(1)
myngridst(Tp, Sp)
nichols(Lin)
%figure(2)
[nLin, dLin]=tfdata(Lin, 'v');
%nyquist1(nLin, dLin)

wcdes=30;
%rete zero
wnorm=6;
z=wcdes/wnorm;
Rz=1+s/z;
L0=Lin*Rz;
hold on
nichols(L0)

%rete lead
wnorm=1.2;
m=14;
zd=wcdes/wnorm;
Rd=(1+s/zd)/(1+s/(m*zd));
L=L0*Rd;
hold on
nichols(L)
%nichols((9.24e5*(s+5)*(s+25))/(s^2*(s+50)^2*(s+350)))
%Gc=(-3.85e06*s^2-1.155e08*s-4.812e08)/(125*s^2+43750*s)

%verifica specifiche
T=minreal(zpk(L/(1+L)));
figure(2)
step(T/(Gf*Gs))
figure(3)
bodemag(T)

r_yds=abs(as/Gs*bode(T,ws)) ;

