function [ file_names ] = directory_information(dir_name)
%本函数作用：获取文件目录
directory_listings=dir(dir_name);%获取当前文件夹下所有子文件夹的名字列表
total_listings_number=length(directory_listings);
total_listings_number=total_listings_number-2;
file_names=cell(total_listings_number,1);
%创建一个数组，用于储存文件目录
    for i = 1 : total_listings_number
        %将列表名称写入数组
        file_names{i}=directory_listings(i+2).name;
    end
end