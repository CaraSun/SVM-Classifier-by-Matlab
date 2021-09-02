image_set_directory='C:\Classification\Plants\Daffodil';
image_set_complement_directory='C:\Classification\Plants\Windflowers';
image_test_directory='C:\Classification\test1';

%%����������
SVMStruct=svm_classifier(image_set_directory,image_set_complement_directory);

%��ȡ���Լ�ͼƬ��������
svm_test_parameters=get_svm_parameters( image_test_directory);

test_feature=[svm_test_parameters.set_data];
test_label=[svm_test_parameters.set_labels];

[predictIndex,score] = predict(SVMStruct,test_feature);
%��������Ԫ�ء�1.�������� 2.Ԥ��÷�
%%
%���Լ�ͼƬ����ʾ����
test_listings=dir(image_test_directory);% ���ڵó��������ļ��е���Ϣ
test_listings_number=length(test_listings)-2;
image_test_file_names=directory_information(image_test_directory);


for i = 1:test_listings_number
    test_file_name=image_test_file_names{i};
    testimage = imread(test_file_name);
    figure;imshow(testimage);  %������ʾ����
    title(['Ԥ����: ', predictIndex{i,1}]);%��ͼƬ����ӷ�����Ϣ(�����ļ���)
end

%[predict_label,accuracy]=svmpredict(test_label,test_feature,SVMStruct);

%numTest = length(image_test_file.Files);  
%for i = 1:numTest  
%    test_file_name=image_set_file_names{i};    
%     testImage = readimage(image_test_file,i);  
%     featureTest=get_svm_parameters( image_set_directory);
%    %    featureTest = HOG(scaleTestImage_rgb);
%     %��ȡHOG����ֵ����Ϊ��һ������Ԥ��Ĳ���
%     [predictIndex,score] = predict(classifer,featureTest); 
%     %��ȡ���Լ���ͼƬ
%end
