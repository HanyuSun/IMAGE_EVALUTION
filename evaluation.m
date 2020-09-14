% clear all; close all; clc;
% %cycleGAN
% imgPath_P = 'D:/TEST/evaluation/cycleGAN/POOR/'; % 图像库(GENERATED)路径
% imgDir_P  = dir([imgPath_P '*.png']); % 遍历所有png格式文件
% 
% imgPath_G = 'D:/TEST/evaluation/cycleGAN/GEN/'; % 图像库(GENERATED)路径
% imgDir_G  = dir([imgPath_G '*.png']); % 遍历所有png格式文件
% 
% imgPath_R = 'D:/TEST/evaluation/cycleGAN/REAL/'; % 图像库(real)路径
% imgDir_R  = dir([imgPath_R '*.png']); % 遍历所有png格式文件
function [P_AB,ME_AB,NM_AB,NCC_AB,JH] = evaluation(imgPath_A,imgDir_A,imgPath_B,imgDir_B)
    for n = 1:length(imgDir_A)          % 遍历结构体就可以一一处理图片了
        imgA = imread([imgPath_A imgDir_A(n).name]); %读取每张图片
        imgA = double(rgb2gray(imgA));   %转换为灰度图像
        imgB = imread([imgPath_B imgDir_B(n).name]); %读取每张图片
        imgB = double(rgb2gray(imgB));   %转换为灰度图像

        [row,col]=size(imgA);
        grayscale=256;
        jointHistogram=zeros(grayscale,grayscale);
        for i=1:row
            for j=1:col
            jointHistogram(imgA(i,j)+1,imgB(i,j)+1)=jointHistogram(imgA(i,j)+1,imgB(i,j)+1)+1;
            end
        end
        JH(n,:,:) = jointHistogram;


        [P_AB(1,n), ] = psnr(imgA,imgB);
        ME_AB(1,n) = me(imgA,imgB);
        NM_AB(1,n) = nmse(imgA,imgB);
        NCC_AB(1,n) = ncc(imgA,imgB);
    end
end

% A = JH(:,256,256)
% %JH = squeeze(sum(JH,1)/50);
% JH = squeeze(JH(21,:,:))
% 
% imagesc(JH,[0,2]);
% colorbar

