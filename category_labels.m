function [ group_label ] = category_labels( image_set_directory,total_number_set_samples )
%本函数作用：获取文件夹中文件的名称信息
group_label=cell(total_number_set_samples,1);
%创建cell数组用来储存文件名
for i = 1:total_number_set_samples
    group_label{i}=image_set_directory;
    %将文件名信息写入 group_label
end
end