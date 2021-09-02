function [svm_parameters] = Generate_SVM_Parameters( image_set_directory)
svm_parameters.set_data=category_data( image_set_directory);
total_number_set_samples=length(svm_parameters.set_data);
svm_parameters.set_labels=category_Labels(image_set_directory,total_number_set_samples);
end