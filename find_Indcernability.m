function ind_set=find_Indcernability(table)
%=============================================================================================================================
%    This function calculates the sets of 'B' indecernable example(or objects) where 'B' is a subset of Total attribute set 'A' 
%    (creates the partition on indecernability equivalence relation)
%    check details theory at: http://zsi.tech.us.edu.pl/~nowak/bien/w2.pdf
%    Input: 
%        A table, whose first column represents the row Id and rest of the columns represent the condition attribues and rows represents the objects or examples
%        The condition attributes may be all the condition attributes in the actual information system or a subset of that attribute set 'A'        
%        Caution: 
%                i) Input table should not contain the Decision attribute in any of its column
%               ii) Input should contain only integers in its entries. (No string or no complex number or decimal number)
%              iii) Ecah cell of the table should have a scalar value.
%    Output: 
%        An array of cells in which each cell contains different indecernable sets of examples.
%    Author: Tathagata Bandyopadhyay (tathagatabanerjee15@rocketmail.com)
%    Documentation: Tathagta
%    Last Modified: 07-04-2018(dd-mm-yyyy) by Tathagata
%=============================================================================================================================  
[row, col]=size(table);
temp_table=table;
ind_set={};
j=1;
while ~isempty(temp_table)
    tmp_tr = temp_table(1,2:col);%as we are deleting the processed rows after each iteration, the next iteration always starts from the first row of the remaining table
    tmp_arry=[];
    k=1;
    for i=1:row
        if(temp_table(i,2:col) == tmp_tr)%first  column (containing tr_id or row Id) excluded
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
