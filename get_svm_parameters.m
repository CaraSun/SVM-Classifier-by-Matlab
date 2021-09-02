function [svm_parameters] = get_svm_parameters( image_set_directory)
%本函数作用：获取文件中各个图片的信息
svm_parameters.set_data=category_data( image_set_directory);
%获取图片的分类信息，即边缘的RGB平均值和标准差，以及灰度数据，用于训练或分类
total_number_set_samples=length(svm_parameters.set_data);
%获取样本的长度
svm_parameters.set_labels=category_labels(image_set_directory,total_number_set_samples);
%获取样本的标签信息，即所属的文件夹类别
end