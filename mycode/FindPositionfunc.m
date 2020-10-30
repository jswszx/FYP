function [gim2,mi1,mi2] = FindPositionfunc(Pic_obtain)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sor=50
per=0.16

gim1=mean(Pic_obtain,3);

%   %  imagesc(gim1,[0,1]),colormap gray 
    gim2=gim1;
     [Y,X]=size(gim1);  %Y=482,X=644

a_num=round(Y*per,0); %to nearest integer
a_num = max(2,a_num);
df = fspecial('disk',round(a_num/2));
df=df./(a_num^2);
 gim1 = [flipud(gim1);gim1;flipud(gim1)];
 gim1 = [fliplr(gim1),gim1,fliplr(gim1)];
z = conv2(gim1,df,'same');
z=z(483:964,645:1288);
[mi1,mi2] = find(z==min(z(:)));
end

