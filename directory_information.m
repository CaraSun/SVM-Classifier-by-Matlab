function [ file_names ] = directory_information(dir_name)
%���������ã���ȡ�ļ�Ŀ¼
directory_listings=dir(dir_name);%��ȡ��ǰ�ļ������������ļ��е������б�
total_listings_number=length(directory_listings);
total_listings_number=total_listings_number-2;
file_names=cell(total_listings_number,1);
%����һ�����飬���ڴ����ļ�Ŀ¼
    for i = 1 : total_listings_number
        %���б�����д������
        file_names{i}=directory_listings(i+2).name;
    end
end