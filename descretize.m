function DiscreteT = descretize(Table)
%=============================================================================================================================
%    This function is used only when the attributes are not discrete but- 
%    any real numbers to make the entries as integers as traditional Rough Set delas with discrete values only.
%    Input: 
%        A table, whose columns represents the condition attribues and rows represents the objects or examples
%        Caution: 
%            i) Input table should not contain the Decision attribute in any of its column
%           ii) Input should contain only real numbers in its entries. (No string or no complex number)
%          iii) Ecah cell of the table should have a scalar value.
%    Functionality:
%        This function calculates column wise means and standard deviations(std) and discretizes each column with the following logic: 
%        Do for all the columns: 
%            upper thershold = mean of the column + std of the column/2
%            Lower thershold = mean of the column - std of the column/2
%            if actual entry > upper threshold make it 3
%            if actual entry >= Lower thershold and actual entry <= upper thershold make it 2
%            if actual entry < Lower threshold make it 1
%    Output: 
%        A table with same dimension as of the Input table. 
%        Output Table has all the entries as 1, 2 or 3
%    Author: Tathagata Bandyopadhyay (tathagatabanerjee15@rocketmail.com)
%    Documentation: Tathagta
%    Last Modified: 07-04-2018(dd-mm-yyyy) by Tathagata
%=============================================================================================================================    
[row, col]=size(Table);
   DiscreteT=zeros(row,col);
    mu=mean(Table);
    sigma=std(Table);
    upper_threshold=mu+(sigma/2);
    lower_threshold=mu-(sigma/2);
    for r=1:row
        for c=1:col
           if Table(r,c)<lower_threshold(c)
               DiscreteT(r,c)=1;
           elseif (Table(r,c)>=lower_threshold(c))&&(Table(r,c)<=upper_threshold(c))
               DiscreteT(r,c)=2;
           else 
               DiscreteT(r,c)=3;
           end
        end
    end
end