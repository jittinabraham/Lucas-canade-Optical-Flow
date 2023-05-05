function [uv vv]=my_flow( I1, I2, sigma );  
gradient_x_kernal=[-1 0 1; -2 0 2 ;-1 0 1];
    gradient_y_kernal=gradient_x_kernal';


    I1_x=imfilter(I1,gradient_x_kernal,"conv");
    I1_y=imfilter(I1,gradient_y_kernal,"conv");

     %%%%%%%%%%%TIME%%%%%%%%%%%%%%%%%%%%%%%%%%%
    It=I2-I1;
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    

    G=fspecial("gaussian",3*sigma,sigma);
    %gradient squares
    I1x2=I1_x.^2;
    I1y2=I1_y.^2;
    I1xy=I1_x.*I1_y;
    %Gaussian 
    I1x2=imfilter(I1x2,G,"conv");
    I1y2=imfilter(I1y2,G,"conv");
    I1xy=imfilter(I1xy,G,"conv");
    Ixt = imfilter(I1_x.*It, G, 'conv');
    Iyt = imfilter(I1_y.*It, G, 'conv');
   

   
    [h, w] = size(I1);
    M1 = [I1y2(:), -I1xy(:)]   ;
    M2=[-I1xy(:), I1x2(:)];
    D=(M1(:,1).*M2(:,2)-(M1(:,2).*M2(:,1)));
    b = [Ixt(:), Iyt(:)];
    %b=b'
    uu=M1.*b;
    vv=M2.*b;
    uu=uu(:,1)+uu(:,2);
    vv=vv(:,1)+vv(:,2);
    uu = reshape(uu, h, w);
    vv = reshape(vv, h, w);
    D=reshape(D, h, w);
    uv=uu./D;
    vv=vv./D;
end
