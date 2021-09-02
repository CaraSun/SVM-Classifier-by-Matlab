function [ data]= generate_data(chip_imdata_color ,image_analysis_functions)
%%
%本函数用于计算所有边角点的RGB以及灰度值的平均值和标准差
%chip_imdata_color是正样本文件夹中的一个图像，image
total_features=length(image_analysis_functions);
%所有特征长度
chip_imdata_gray=rgb2gray(chip_imdata_color);
%将RGB图像或彩色图转换为灰度图像
chip_corner_points=corner(chip_imdata_gray);
%找出边角点red_data=zeros(length(chip_corner_points),1)，并以矩阵 C 形式返回其坐标。
%在图像 I 中检测到的边角点的 x 和 y 坐标，以 p×2 矩阵形式返回。
red_data=zeros(length(chip_corner_points),1);%R数据
green_data=zeros(length(chip_corner_points),1);%G数据
blue_data=zeros(length(chip_corner_points),1);%B数据
gray_data=zeros(length(chip_corner_points),1);%灰度数据
for i = 1:length(chip_corner_points)
    y=chip_corner_points(i,1);
    x=chip_corner_points(i,2);
    %边角点的X，坐标
    red_data(i,1)=chip_imdata_color(x,y,1);
    %边角点对应的R值
    green_data(i,1)=chip_imdata_color(x,y,2);
    %边角点对应的G值
    blue_data(i,1)=chip_imdata_color(x,y,3);
    %边角点对应的B值
    gray_data(i,1)=chip_imdata_gray(x,y);
    %边角点的灰度数值
end
%%
%计算找出的边角点的RGB和灰度值平均值和标准差
data=zeros(1,total_features);
value=0;

for i=1:total_features 
    feature= image_analysis_functions{i};
    switch feature
        case 'AVERAGE_RED_CORNER_POINTS'%
            value=mean(red_data);            %R值求平均值并赋值给value 代表所有边角点的R值的平均值
        case  'AVERAGE_GREEN_CORNER_POINTS'
            value=mean(green_data);
        case 'AVERAGE_BLUE_CORNER_POINTS'
            value=mean(blue_data);
        case  'AVERAGE_GRAY_CORNER_POINTS'
            value=mean(gray_data);
        case  'AVERAGE_ENTIRE_COLOR_IMAGE'
            value=mean2(chip_imdata_color);      %对矩阵chip_imdata_color求平均值并赋值给value
        case  'STDV_RED_CORNER_POINTS'
            value=std(double(red_data));
        case  'STDV_GREEN_CORNER_POINTS'
            value=std(double(green_data));
        case  'STDV_BLUE_CORNER_POINTS'
            value=std(double(blue_data));
        case  'STDV_GRAY_CORNER_POINTS'
           value=std(double(gray_data));
        case 'STDV_ENTIRE_COLOR_IMAGE'
            value=std2(chip_imdata_color);      
    end
            data(1,i)=value;
            %所有边角点对应的RGB，灰度值的平均值和标准差
end
end
