%plot lamina propria contour and surface
imagefiles = dir('*.tif');      
nfiles = length(imagefiles);    % Number of files found
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   images{i} = currentimage;
   rpg = images{i};
   threshold = 0.03;
   BW{i} = im2bw(rpg,threshold);
%    binImage = BW{i};
%    binImage = ~binImage;
%    binImage = 1-binImage;
%    binImage = (binImage == 0);
%    BW{i} = binImage;
end

BWNew=[];
BWNew=BW{1};



for i=2:nfiles
    
    BWNew = BWNew+BW{i};
end
mesh(BWNew)
hold on
imagesc(BWNew)
%%%%%%%%

val = std2(BWNew)