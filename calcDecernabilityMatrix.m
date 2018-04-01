function DCrnTable=calcDecernabilityMatrix(table)
    DCrnTable={};
    [row, col]=size(table);
    for i=1:row%for creating the row of the dcrn matrix
        for j=1:row %for creating the columns of the dcrn matrix
            temp_set=[];
            if table(i,col)~=table(j,col)
                l=1;
                for k=2:col-1%for comparing all the condition attributes of the table. this excludes col 1 and last col as they are row id and decision attribute respectively
                    if table(i,k)~=table(j,k)%checking whether ith and jth row has different value for kth attribute
                        temp_set(l)=k;
                        l=l+1;
                    end
                end
            end
            DCrnTable(i,j)={temp_set};
        end
    end
end
