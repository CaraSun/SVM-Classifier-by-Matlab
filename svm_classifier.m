function [SVMStruct] = svm_classifier( image_set_directory,image_set_complement_directory )
%%函数作用创建SVM分类器
svm_postive_parameters=get_svm_parameters( image_set_directory);
%获取正样本的参数信息，包括边缘信息和名称
svm_negative_parameters=get_svm_parameters( image_set_complement_directory );
%获取负样本的参数信息
data=[svm_postive_parameters.set_data;svm_negative_parameters.set_data];
%数据数组:将正负样本的图像边缘信息存在data中，作为fitcsvm的参数1
lables=[svm_postive_parameters.set_labels;svm_negative_parameters.set_labels];
%标签数组：将正负样本的标签信息存在lables中，作为fitcsvm的参数2
SVMStruct = fitcsvm(data,lables);
%训练数据，创建svm分类器
end
