function [mse_lbg psnr_lbg mse_kpe psnr_kpe mse_kfcg psnr_kfcg mse_kmcg psnr_kmcg]=main(image1)


% image1 = imread('001.bmp');

[mse_lbg psnr_lbg]=MSE_LBG(image1);
[mse_kpe psnr_kpe]=MSE_KPE(image1);
[mse_kfcg psnr_kfcg]=MSE_KFCG(image1);
[mse_kmcg psnr_kmcg]=MSE_KMCG(image1);

disp('LBG');
disp(mse_lbg);
disp(psnr_lbg);

disp('KPE');
disp(mse_kpe);
disp(psnr_kpe);

disp('KFCG');
disp(mse_kfcg);
disp(psnr_kfcg);

disp('KMCG');
disp(mse_kmcg);
disp(psnr_kmcg);

end

