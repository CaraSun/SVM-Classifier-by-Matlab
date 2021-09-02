image_set_directory='C:\Classification\Plants\Daffodil';
image_set_complement_directory='C:\Classification\Plants\Windflowers';
image_test_directory='C:\Classification\test1';

%%构建分类器
SVMStruct=svm_classifier(image_set_directory,image_set_complement_directory);

%获取测试集图片特征数据
svm_test_parameters=get_svm_parameters( image_test_directory);

test_feature=[svm_test_parameters.set_data];
test_label=[svm_test_parameters.set_labels];

[predictIndex,score] = predict(SVMStruct,test_feature);
%返回两个元素。1.所属分类 2.预测得分
%%
%测试集图片的显示程序
test_listings=dir(image_test_directory);% 用于得出所有子文件夹的信息
test_listings_number=length(test_listings)-2;
image_test_file_names=directory_information(image_test_directory);


for i = 1:test_listings_number
    test_file_name=image_test_file_names{i};
    testimage = imread(test_file_name);
    figure;imshow(testimage);  %创建显示窗口
    title(['预测结果: ', predictIndex{i,1}]);%在图片上添加分类信息(所属文件夹)
end

%[predict_label,accuracy]=svmpredict(test_label,test_feature,SVMStruct);

%numTest = length(image_test_file.Files);  
%for i = 1:numTest  
%    test_file_name=image_set_file_names{i};    
%     testImage = readimage(image_test_file,i);  
%     featureTest=get_svm_parameters( image_set_directory);
%    %    featureTest = HOG(scaleTestImage_rgb);
%     %提取HOG特征值，作为下一步进行预测的参数
%     [predictIndex,score] = predict(classifer,featureTest); 
%     %读取测试集的图片
%end
