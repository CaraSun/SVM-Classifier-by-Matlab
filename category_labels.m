function [ group_label ] = category_labels( image_set_directory,total_number_set_samples )
%���������ã���ȡ�ļ������ļ���������Ϣ
group_label=cell(total_number_set_samples,1);
%����cell�������������ļ���
for i = 1:total_number_set_samples
    group_label{i}=image_set_directory;
    %���ļ�����Ϣд�� group_label
end
end