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
    };%ʮ���ַ���������ͼ���Ե��Ϣ�����ֱ����RGB�ͻҶ�ƽ��ֵ�ͱ�׼��
total_number_features_vector=length(image_analysis_functions);%����������������Ŀ
image_set_file_names=directory_information(image_set_directory);%��ȡ�����ļ�������
total_set_file_number=length(image_set_file_names);%��ȡ�����ļ�����Ŀ
set_data=zeros(total_set_file_number,total_number_features_vector);
for i = 1:total_set_file_number
    file_name=image_set_file_names{i};
    chip_imdata_color = imread(file_name); %��ȡ������ÿһ��ͼƬ��Ӧ������ֵ
    set_data(i,:)=generate_data(chip_imdata_color,image_analysis_functions);   
end
