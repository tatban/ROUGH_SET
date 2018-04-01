function upper_bound=upper_approximation(Ind_Set,Table)
    upper_bound={};
    [row, col]=size(Ind_Set);
    classSet=classWiseSet(Table);
    [row1,col1]=size(classSet);%getting the size of class group
    for i=1:row1
        temp_x=cell2mat(classSet(i,1));
        temp_x=temp_x';
        temp_ub={};
        k=1;
        for j=1:col
            temp_ar=cell2mat(Ind_Set(1,j));
            if ~isempty(intersect(temp_ar,temp_x))
                temp_ub(1,k)={temp_ar};%need to be corrected another cell may be introdeced
                %[r,c]=size(temp_lb);%need to be corrected
                k=k+1;%need to be corrected
            end
        end
        upper_bound(1,i)={cell2mat(temp_ub)};
    end
end
