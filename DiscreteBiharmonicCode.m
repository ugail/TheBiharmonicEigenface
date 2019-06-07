
% NB: Any work arising from the use of this code must provide % due credit and cite the following work of the authors. 
% A. Elmahmudi and H. Ugail, The Biharmonic Eigenface, Signal, % Image and Video Processing, (2019).   
% https://doi.org/10.1007/s11760-019-01514-4



function ImOut=Biharmonic(ImIn)

[r,c]=size(ImIn);
% Create a new image with padding
ImOut=zeros(r,c);
ne=padarray(ImIn,[2 2]);

ne(3:size(ImIn,1)+2,1)=ImIn(:,1);
ne(3:size(ImIn,1)+2,2)=ImIn(:,2);

ne(3:size(ImIn,1)+2,end-1)=ImIn(:,end-1);
ne(3:size(ImIn,1)+2,end)=ImIn(:,end);

ne(1,3:size(ImIn,2)+2)=ImIn(1,:);
ne(2,3:size(ImIn,2)+2)=ImIn(2,:);

ne(end-1,3:size(ImIn,2)+2)=ImIn(end-1,:);
ne(end,3:size(ImIn,2)+2)=ImIn(end,:);

ne(end-1,end-1)=ImIn(end,end);
ne(end-1,2)=ImIn(end,1);

ne(2,2)=ImIn(1,1);
ne(2,end-1)=ImIn(1,end);
x=0;
% Apply the discree Biharmonic operator and save the resulting % image as ImOut
for i=3:r+2
    y=0;
    x=x+1;
    for j=3:c+2
        y=y+1;
        dd=(20*ne(i,j)-8*(ne(i+1,j)+ne(i-1,j)+ne(i,j+1)+ne(i,j-1))+2*(ne(i+1,j+1)+ne(i-1,j+1)+ne(i-1,j-1)+ne(i+1,j-1))+ne(i+2,j)+ne(i-2,j)+ne(i,j+2)+ne(i,j-2));
        ImOut(x,y)=abs(dd);
    end
end
end