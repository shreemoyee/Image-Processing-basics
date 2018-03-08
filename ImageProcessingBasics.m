%Image Negative%
moli=imread('/home/shreemoyee/Downloads/Molibdinum.tif')
moli_neg=255-moli;
imshow(moli_neg)
imwrite(moli_neg,'/home/shreemoyee/Downloads/Molibdinum_neg.jpg')


%Power Law Transformation%
spectrum=imread('/home/shreemoyee/Downloads/Spectrum.tif')
spec_log=log(1+abs(spectrum));
imshow(spec_log)
imwrite(spec_log,'/home/shreemoyee/Downloads/Spectrum_log.jpg')

%Gamma correction%
%Aerial Image%
aerial=imread('/home/shreemoyee/Downloads/Aerial.jpg');
aerial_norm=double(aerial)/255; %normalizing the image
imshow(aerial);
aerial1=aerial_norm.^3.0; %gamma = 3.0
imshow(aerial1);
imwrite(aerial1,'/home/shreemoyee/Downloads/Aerial_corr3.jpg');
aerial2=aerial_norm.^4.0; %gamma= 4.0
imshow(aerial2);
imwrite(aerial2,'/home/shreemoyee/Downloads/Aerial_corr4.jpg');
aerial3=aerial_norm.^5.0; %gamma=5.0
imshow(aerial3);
imwrite(aerial3,'/home/shreemoyee/Downloads/Aerial_corr5.jpg');

%spine image%
spine=imread('/home/shreemoyee/Downloads/Spine.jpg')
spine_norm=double(spine)/255;
imshow(spine_norm);
spine1=spine_norm.^0.3;
imshow(spine1);
imwrite(spine1,'/home/shreemoyee/Downloads/Spine_corr0.3.jpg');
spine2=spine_norm.^0.4
imwrite(spine2,'/home/shreemoyee/Downloads/Spine_corr0.4.jpg');
imshow(spine2);
spine3=spine_norm.^0.6;
imwrite(spine3,'/home/shreemoyee/Downloads/Spine_corr0.6.jpg');


%Contrast Stretching%
pollen=imread('/home/shreemoyee/Downloads/pollen.jpg')
pollen_norm=double(pollen)/255;
mini=min((min(pollen_norm))); %finding the maximum of all matrix entries
maxi=max((max(pollen_norm))); %finding the minimum of all matrix entries
m=1/(maxi-mini);              %calculating slope
c=1-maxi*m;                   %calculating intercept
i_new=m*pollen_norm+c;        %use for the new image
imshow(i_new);
imwrite(i_new,'/home/shreemoyee/Downloads/pollen_contrast.jpg');
hist(pollen);
hist(i_new);


%Gray Level Slicing%
j=double(aerial);
[row col]=size(j);
T1=50;               %set the thresholds, could be changed for any values
T2=200;
for x=1:1:row
     for y=1:1:col
         if((j(x,y)>T1) && (j(x,y)<T2))
                j(x,y)=255;
         else
                j(x,y)=i(x,y);
         end
     end
end
imshow(uint8(j));
imwrite(uint8(j),'/home/shreemoyee/Downloads/sliced.jpg');
