function [set_data] = category_data( image_set_directory)
image_analysis_functions={
    'AVERAGE_RED_CORNER_POINTS'
    'AVERAGE_GREEN_CORNER_POINTS'
    'AVERAGE_BLUE_CORNER_POINTS'
    'AVERAGE_GRAY_CORNER_POINTS'
    'AVERAGE_ENTIRE_COLOR_IMAGE'
    'STDV_RED_CORNER_POINTS'
    'STDV_GREEN_CORNER_POINTS'
    'STDV_BLUE_CORNER_POINTS'
    'STDV_GRAY_CORNER_POINTS'
    'STDV_ENTIRE_COLOR_IMAGE'
    };%十个字符串，用于图像边缘信息处理。分别代表RGB和灰度平均值和标准差
total_number_features_vector=length(image_analysis_functions);%计算特征向量的数目
image_set_file_names=directory_information(image_set_directory);%获取样本文件的名称
total_set_file_number=length(image_set_file_names);%获取样本文件的数目
set_data=zeros(total_set_file_number,total_number_features_vector);
for i = 1:total_set_file_number
    file_name=image_set_file_names{i};
    chip_imdata_color = imread(file_name); %获取样本中每一个图片对应的特征值
    set_data(i,:)=generate_data(chip_imdata_color,image_analysis_functions);   
end
