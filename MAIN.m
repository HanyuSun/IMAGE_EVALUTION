clear all; close all; clc;

%1-cycleGAN------------------------------------------------------
imgPath_P = 'D:/TEST/evaluation/cycleGAN/POOR/'; % 图像库(GENERATED)路径
imgDir_P  = dir([imgPath_P '*.png']); % 遍历所有png格式文件

imgPath_G = 'D:/TEST/evaluation/cycleGAN/GEN/'; % 图像库(GENERATED)路径
imgDir_G  = dir([imgPath_G '*.png']); % 遍历所有png格式文件

imgPath_R = 'D:/TEST/evaluation/cycleGAN/REAL/'; % 图像库(real)路径
imgDir_R  = dir([imgPath_R '*.png']); % 遍历所有png格式文件

%POOR和REAL

%cycleGAN和REAL
[P_AB1,ME_AB1,NM_AB1,NCC_AB1,JH1] = evaluation(imgPath_G,imgDir_G,imgPath_R,imgDir_R);

%2-pix2pix---------------------------------------------------------
imgPath_P = 'D:/TEST/evaluation/PIX2PIX/POOR/'; % 图像库(GENERATED)路径
imgDir_P  = dir([imgPath_P '*.png']); % 遍历所有png格式文件

imgPath_G = 'D:/TEST/evaluation/PIX2PIX/GEN/'; % 图像库(GENERATED)路径
imgDir_G  = dir([imgPath_G '*.png']); % 遍历所有png格式文件

imgPath_R = 'D:/TEST/evaluation/PIX2PIX/REAL/'; % 图像库(real)路径
imgDir_R  = dir([imgPath_R '*.png']); % 遍历所有png格式文件


[P_AB2,ME_AB2,NM_AB2,NCC_AB2,JH2] = evaluation(imgPath_G,imgDir_G,imgPath_R,imgDir_R);

%3-pix2pixHD---------------------------------------------------------
imgPath_P = 'D:/TEST/evaluation/PIX2PIXHD/POOR/'; % 图像库(GENERATED)路径
imgDir_P  = dir([imgPath_P '*.jpg']); % 遍历所有png格式文件

imgPath_G = 'D:/TEST/evaluation/PIX2PIXHD/GEN/'; % 图像库(GENERATED)路径
imgDir_G  = dir([imgPath_G '*.jpg']); % 遍历所有png格式文件

imgPath_R = 'D:/TEST/evaluation/PIX2PIXHD/REAL/'; % 图像库(real)路径
imgDir_R  = dir([imgPath_R '*.bmp']); % 遍历所有png格式文件

[P_AB0,ME_AB0,NM_AB0,NCC_AB0,JH0] = evaluation(imgPath_P,imgDir_P,imgPath_R,imgDir_R);
[P_AB3,ME_AB3,NM_AB3,NCC_AB3,JH3] = evaluation(imgPath_G,imgDir_G,imgPath_R,imgDir_R);

%start statistical evaluation-----------------------------------------
%poor image
M_P_AB0 = mean(P_AB0);
S_P_AB0 = std(P_AB0);

M_ME_AB0 = mean(ME_AB0);
S_ME_AB0 = std(ME_AB0);

M_NM_AB0 = mean(NM_AB0);
S_NM_AB0 = std(NM_AB0);

M_NCC_AB0 = mean(NCC_AB0);
S_NCC_AB0 = std(NCC_AB0);
%cyclegan
M_P_AB1 = mean(P_AB1);
S_P_AB1 = std(P_AB1);

M_ME_AB1 = mean(ME_AB1);
S_ME_AB1 = std(ME_AB1);

M_NM_AB1 = mean(NM_AB1);
S_NM_AB1 = std(NM_AB1);

M_NCC_AB1 = mean(NCC_AB1);
S_NCC_AB1 = std(NCC_AB1);
%pix2pix
M_P_AB2 = mean(P_AB2);
S_P_AB2 = std(P_AB2);

M_ME_AB2 = mean(ME_AB2);
S_ME_AB2 = std(ME_AB2);

M_NM_AB2 = mean(NM_AB2);
S_NM_AB2 = std(NM_AB2);

M_NCC_AB2 = mean(NCC_AB2);
S_NCC_AB2 = std(NCC_AB2);
%pix2pixhd
M_P_AB3 = mean(P_AB3);
S_P_AB3 = std(P_AB3);

M_ME_AB3 = mean(ME_AB3);
S_ME_AB3 = std(ME_AB3);

M_NM_AB3 = mean(NM_AB3);
S_NM_AB3 = std(NM_AB3);

M_NCC_AB3 = mean(NCC_AB3);
S_NCC_AB3 = std(NCC_AB3);

figure
subplot(1,4,1)
a = [M_P_AB0;M_P_AB1;M_P_AB2;M_P_AB3];
bar(a, 'grouped')
set(gca,'YLim', [15,35], 'XTickLabel',{'6.25%', 'cycleGAN','pix2pix','pix2pixHD'}, 'FontSize', 12);
ylabel('PSNR(dB)');
set(gca, 'Ytick', [15:5:35], 'ygrid','on','GridLineStyle','-');

e = [S_P_AB0;S_P_AB1;S_P_AB2;S_P_AB3];
hold on
numgroups = size(a, 1); 
numbars = size(a, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Aligning error bar with individual bar
      errorbar(x, a(:,i), e(:,i), 'k', 'linestyle', 'none', 'lineWidth', 1);
end

subplot(1,4,2)
a = [M_ME_AB0;M_ME_AB1;M_ME_AB2;M_ME_AB3];
bar(a, 'grouped')
set(gca,'YLim', [-0.02,0.02], 'XTickLabel',{'6.25%', 'cycleGAN','pix2pix','pix2pixHD'}, 'FontSize', 12);
ylabel('ME');
set(gca, 'Ytick', [-0.02:0.01:0.02], 'ygrid','on','GridLineStyle','-');

e = [S_ME_AB0;S_ME_AB1;S_ME_AB2;S_ME_AB3];
hold on
numgroups = size(a, 1); 
numbars = size(a, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Aligning error bar with individual bar
      errorbar(x, a(:,i), e(:,i), 'k', 'linestyle', 'none', 'lineWidth', 1);
end

subplot(1,4,3)
a = [M_NM_AB0;M_NM_AB1;M_NM_AB2;M_NM_AB3];
bar(a, 'grouped')
set(gca,'YLim', [0,0.01], 'XTickLabel',{'6.25%', 'cycleGAN','pix2pix','pix2pixHD'}, 'FontSize', 12);
ylabel('NMSE');
set(gca, 'Ytick', [0:0.002:0.01], 'ygrid','on','GridLineStyle','-');

e = [S_NM_AB0;S_NM_AB1;S_NM_AB2;S_NM_AB3];
hold on
numgroups = size(a, 1); 
numbars = size(a, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Aligning error bar with individual bar
      errorbar(x, a(:,i), e(:,i), 'k', 'linestyle', 'none', 'lineWidth', 1);
end

subplot(1,4,4)
a = [M_NCC_AB0;M_NCC_AB1;M_NCC_AB2;M_NCC_AB3];
bar(a, 'grouped')
set(gca,'YLim', [0.4,1], 'XTickLabel',{'6.25%', 'cycleGAN','pix2pix','pix2pixHD'}, 'FontSize', 12);
ylabel('NCC');
set(gca, 'Ytick', [0.4:0.1:1], 'ygrid','on','GridLineStyle','-');

e = [S_NCC_AB0;S_NCC_AB1;S_NCC_AB2;S_NCC_AB3];
hold on
numgroups = size(a, 1); 
numbars = size(a, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Aligning error bar with individual bar
      errorbar(x, a(:,i), e(:,i), 'k', 'linestyle', 'none', 'lineWidth', 1);
end

figure(2)
subplot(1,4,1)
JH0 = squeeze(JH0(1,:,:))
imagesc(JH0,[0,5]);
subplot(1,4,2)
JH1 = squeeze(JH1(1,:,:))
imagesc(JH1,[0,5]);
subplot(1,4,3)
JH2 = squeeze(JH2(1,:,:))
imagesc(JH2,[0,5]);
subplot(1,4,4)
JH3 = squeeze(JH3(1,:,:))
imagesc(JH3,[0,5]);