function [svm_parameters] = get_svm_parameters( image_set_directory)
%���������ã���ȡ�ļ��и���ͼƬ����Ϣ
svm_parameters.set_data=category_data( image_set_directory);
%��ȡͼƬ�ķ�����Ϣ������Ե��RGBƽ��ֵ�ͱ�׼��Լ��Ҷ����ݣ�����ѵ�������
total_number_set_samples=length(svm_parameters.set_data);
%��ȡ�����ĳ���
svm_parameters.set_labels=category_labels(image_set_directory,total_number_set_samples);
%��ȡ�����ı�ǩ��Ϣ�����������ļ������
end