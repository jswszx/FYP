per=0.081
for num=1:20
   
  im = double(imread(['../camera/pic_',int2str(num),'.png']))/255; 
% im = double(imread(['../analyze part_code/face/im',int2str(num),'_re.png']))/255; 
%     
%     im_an = double(imread(['../analyze part_code/face/im',int2str(num),'_re_an.png']))/255;

    I{num}=im; 
%   J{num}=im_an;
    
    figure(num)
    gim1 = mean(I{num},3);   
    gim2=gim1;
    imagesc(gim1,[0,1]),colormap gray 
      [A{num},B{num}]=size(gim1);  

a_num=round(A{num}*per,0); %to nearest integer
a_num = max(2,a_num);
df = fspecial('disk',round(a_num/2));
df=df./(a_num^2);
 gim1 = [flipud(gim1);gim1;flipud(gim1)];
 gim1 = [fliplr(gim1),gim1,fliplr(gim1)];
z = conv2(gim1,df,'same');
z=z(A{num}+1:2*A{num},B{num}+1:2*B{num});
[mi1,mi2] = find(z==min(z(:)));
imshow(gim2);
    hold on
  plot(mi2,mi1,'gx');
    hold off
 
%  
%  
%      figure(num)
%     subplot(2,1,1);imshow(im),title('grey original picture');
%     hold on
%     plot(mi2,mi1,'rx');
%     rectangle('Position',[mi2,mi1,16,16],'FaceColor',[1 0 0],'EdgeColor','R',...
%     'LineWidth',3);  
%     hold off
%     subplot(2,1,2);imshow(J{num}),title('RGB picture with annotation'); 
%     hold on
%     plot(mi2,mi1,'gx');
%     hold off
end
