function ind_set=find_Indcernability(table)
    [row, col]=size(table);
    temp_table=table;
    ind_set={};
    %class_set={};
    j=1;
    while ~isempty(temp_table)
        tmp_tr=temp_table(1,2:col-1);
        %temp_val=temp_table(1,col);
        tmp_arry=[];
        %tmp_class=[];
        k=1;
        %l=1;
        for i=1:row
            if(temp_table(i,2:col-1)==tmp_tr)%first  column (containing tr_id) excluded
               tmp_arry(k)=temp_table(i,1);
               k=k+1;
               temp_table(i,:)=0; 
            end
        end
       temp_table( ~any(temp_table,2), : ) = [];%deleteing the processed rows 
       [row, col]=size(temp_table);
       ind_set(1,j)={tmp_arry};
       j=j+1;
    end
end
