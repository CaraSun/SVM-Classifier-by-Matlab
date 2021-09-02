function [ data]= generate_data(chip_imdata_color ,image_analysis_functions)
%%
%���������ڼ������б߽ǵ��RGB�Լ��Ҷ�ֵ��ƽ��ֵ�ͱ�׼��
%chip_imdata_color���������ļ����е�һ��ͼ��image
total_features=length(image_analysis_functions);
%������������
chip_imdata_gray=rgb2gray(chip_imdata_color);
%��RGBͼ����ɫͼת��Ϊ�Ҷ�ͼ��
chip_corner_points=corner(chip_imdata_gray);
%�ҳ��߽ǵ�red_data=zeros(length(chip_corner_points),1)�����Ծ��� C ��ʽ���������ꡣ
%��ͼ�� I �м�⵽�ı߽ǵ�� x �� y ���꣬�� p��2 ������ʽ���ء�
red_data=zeros(length(chip_corner_points),1);%R����
green_data=zeros(length(chip_corner_points),1);%G����
blue_data=zeros(length(chip_corner_points),1);%B����
gray_data=zeros(length(chip_corner_points),1);%�Ҷ�����
for i = 1:length(chip_corner_points)
    y=chip_corner_points(i,1);
    x=chip_corner_points(i,2);
    %�߽ǵ��X������
    red_data(i,1)=chip_imdata_color(x,y,1);
    %�߽ǵ��Ӧ��Rֵ
    green_data(i,1)=chip_imdata_color(x,y,2);
    %�߽ǵ��Ӧ��Gֵ
    blue_data(i,1)=chip_imdata_color(x,y,3);
    %�߽ǵ��Ӧ��Bֵ
    gray_data(i,1)=chip_imdata_gray(x,y);
    %�߽ǵ�ĻҶ���ֵ
end
%%
%�����ҳ��ı߽ǵ��RGB�ͻҶ�ֵƽ��ֵ�ͱ�׼��
data=zeros(1,total_features);
value=0;

for i=1:total_features 
    feature= image_analysis_functions{i};
    switch feature
        case 'AVERAGE_RED_CORNER_POINTS'%
            value=mean(red_data);            %Rֵ��ƽ��ֵ����ֵ��value �������б߽ǵ��Rֵ��ƽ��ֵ
        case  'AVERAGE_GREEN_CORNER_POINTS'
            value=mean(green_data);
        case 'AVERAGE_BLUE_CORNER_POINTS'
            value=mean(blue_data);
        case  'AVERAGE_GRAY_CORNER_POINTS'
            value=mean(gray_data);
        case  'AVERAGE_ENTIRE_COLOR_IMAGE'
            value=mean2(chip_imdata_color);      %�Ծ���chip_imdata_color��ƽ��ֵ����ֵ��value
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
            %���б߽ǵ��Ӧ��RGB���Ҷ�ֵ��ƽ��ֵ�ͱ�׼��
end
end
