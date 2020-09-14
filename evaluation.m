% clear all; close all; clc;
% %cycleGAN
% imgPath_P = 'D:/TEST/evaluation/cycleGAN/POOR/'; % ͼ���(GENERATED)·��
% imgDir_P  = dir([imgPath_P '*.png']); % ��������png��ʽ�ļ�
% 
% imgPath_G = 'D:/TEST/evaluation/cycleGAN/GEN/'; % ͼ���(GENERATED)·��
% imgDir_G  = dir([imgPath_G '*.png']); % ��������png��ʽ�ļ�
% 
% imgPath_R = 'D:/TEST/evaluation/cycleGAN/REAL/'; % ͼ���(real)·��
% imgDir_R  = dir([imgPath_R '*.png']); % ��������png��ʽ�ļ�
function [P_AB,ME_AB,NM_AB,NCC_AB,JH] = evaluation(imgPath_A,imgDir_A,imgPath_B,imgDir_B)
    for n = 1:length(imgDir_A)          % �����ṹ��Ϳ���һһ����ͼƬ��
        imgA = imread([imgPath_A imgDir_A(n).name]); %��ȡÿ��ͼƬ
        imgA = double(rgb2gray(imgA));   %ת��Ϊ�Ҷ�ͼ��
        imgB = imread([imgPath_B imgDir_B(n).name]); %��ȡÿ��ͼƬ
        imgB = double(rgb2gray(imgB));   %ת��Ϊ�Ҷ�ͼ��

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

