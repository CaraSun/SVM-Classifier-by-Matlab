function [SVMStruct] = svm_classifier( image_set_directory,image_set_complement_directory )
%%�������ô���SVM������
svm_postive_parameters=get_svm_parameters( image_set_directory);
%��ȡ�������Ĳ�����Ϣ��������Ե��Ϣ������
svm_negative_parameters=get_svm_parameters( image_set_complement_directory );
%��ȡ�������Ĳ�����Ϣ
data=[svm_postive_parameters.set_data;svm_negative_parameters.set_data];
%��������:������������ͼ���Ե��Ϣ����data�У���Ϊfitcsvm�Ĳ���1
lables=[svm_postive_parameters.set_labels;svm_negative_parameters.set_labels];
%��ǩ���飺�����������ı�ǩ��Ϣ����lables�У���Ϊfitcsvm�Ĳ���2
SVMStruct = fitcsvm(data,lables);
%ѵ�����ݣ�����svm������
end
