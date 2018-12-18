clear all;
clc;

for i=1:5
i = num2str(i);
a = imread(strcat('00',i,'.bmp'));

[cb fvector] = KPE(a);
temp = {cb,fvector};
save(strcat('img_kpe',i),'temp');

[cb fvector] = LBG(a);
temp = {cb,fvector};
save(strcat('img_lbg',i),'temp');

[cb fvector] = KFCG(a);
temp = {cb,fvector};
save(strcat('img_kfcg',i),'temp');

[cb fvector] = KMCG(a);
temp = {cb,fvector};
save(strcat('img_kmcg',i),'temp');

end
