clear all
close all
flo_Im_1=imread('flow1.jpg');
flo_Im_2=imread('flow2.jpg');
sigma=25;
I1=im2double(flo_Im_1);
I2=im2double(flo_Im_2);
[uu,vv]=my_flow( I1, I2, sigma );
deci=10;
plotFlow(uu, vv, I1, deci)