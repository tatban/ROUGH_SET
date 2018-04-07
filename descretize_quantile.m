function DiscreteT = descretize_quantile(Table)
%=============================================================================================================================
%    This function is advanced version of 'descritize' and it uses
%    percentile deviation instead of mean and standard deviation.
%    This function incurs less information loss while descretizing as compared to descretize function. 
%    This function is used only when the attributes are not discrete but- 
%    any real numbers to make the entries as integers as traditional Rough Set delas with discrete values only.
%    Use either this function or 'descretize' function to descretize the data
%    Input: 
%        A table, whose columns represents the condition attribues and rows represents the objects or examples
%        Caution: 
%            i) Input table should not contain the Decision attribute in any of its column
%           ii) Input should contain only real numbers in its entries. (No string or no complex number)
%          iii) Ecah cell of the table should have a scalar value.
%    Functionality:
%        For each column, each values are represented by their 5th percentile range denoting it by integers from 1 to 22
%    Output: 
%        A table with same dimension as of the Input table. 
%        Output Table has all the entries from the set of integers from 1 to 22
%    Author: Tathagata Bandyopadhyay (tathagatabanerjee15@rocketmail.com)
%    Documentation: Tathagta
%    Last Modified: 07-04-2018(dd-mm-yyyy) by Tathagata
%=============================================================================================================================    

[row, col]=size(Table);
DiscreteT=zeros(row,col);
P0=prctile(Table,0,1);
P5=prctile(Table,5,1);
P10=prctile(Table,10,1);
P15=prctile(Table,15,1);
P20=prctile(Table,20,1);
P25=prctile(Table,25,1);
P30=prctile(Table,30,1);
P35=prctile(Table,35,1);
P40=prctile(Table,40,1);
P45=prctile(Table,45,1);
P50=prctile(Table,50,1);
P55=prctile(Table,55,1);
P60=prctile(Table,60,1);
P65=prctile(Table,65,1);
P70=prctile(Table,70,1);
P75=prctile(Table,75,1);
P80=prctile(Table,80,1);
P85=prctile(Table,85,1);
P90=prctile(Table,90,1);
P95=prctile(Table,95,1);
P100=prctile(Table,100,1);
for r=1:row
    for c=1:col
        if Table(r,c)<P0(c)
            DiscreteT(r,c)=1;
        elseif (Table(r,c)>=P0(c))&&(Table(r,c)<P5(c))
            DiscreteT(r,c)=2;
        elseif (Table(r,c)>=P5(c))&&(Table(r,c)<P10(c))
            DiscreteT(r,c)=3;
        elseif (Table(r,c)>=P10(c))&&(Table(r,c)<P15(c))
            DiscreteT(r,c)=4;
        elseif (Table(r,c)>=P15(c))&&(Table(r,c)<P20(c))
            DiscreteT(r,c)=5;
        elseif (Table(r,c)>=P20(c))&&(Table(r,c)<P25(c))
            DiscreteT(r,c)=6;
        elseif (Table(r,c)>=P25(c))&&(Table(r,c)<P30(c))
            DiscreteT(r,c)=7;
        elseif (Table(r,c)>=P30(c))&&(Table(r,c)<P35(c))
            DiscreteT(r,c)=8;
        elseif (Table(r,c)>=P35(c))&&(Table(r,c)<P40(c))
            DiscreteT(r,c)=9;
        elseif (Table(r,c)>=P40(c))&&(Table(r,c)<P45(c))
            DiscreteT(r,c)=10;
        elseif (Table(r,c)>=P45(c))&&(Table(r,c)<P50(c))
            DiscreteT(r,c)=11;
        elseif (Table(r,c)>=P50(c))&&(Table(r,c)<P55(c))
            DiscreteT(r,c)=12;
        elseif (Table(r,c)>=P55(c))&&(Table(r,c)<P60(c))
            DiscreteT(r,c)=13;
        elseif (Table(r,c)>=P60(c))&&(Table(r,c)<P65(c))
            DiscreteT(r,c)=14;
        elseif (Table(r,c)>=P65(c))&&(Table(r,c)<P70(c))
            DiscreteT(r,c)=15;
        elseif (Table(r,c)>=P70(c))&&(Table(r,c)<P75(c))
            DiscreteT(r,c)=16;
        elseif (Table(r,c)>=P75(c))&&(Table(r,c)<P80(c))
            DiscreteT(r,c)=17;
        elseif (Table(r,c)>=P80(c))&&(Table(r,c)<P85(c))
            DiscreteT(r,c)=18;
        elseif (Table(r,c)>=P85(c))&&(Table(r,c)<P90(c))
            DiscreteT(r,c)=19;
        elseif (Table(r,c)>=P90(c))&&(Table(r,c)<P95(c))
            DiscreteT(r,c)=20;
        elseif (Table(r,c)>=P95(c))&&(Table(r,c)<P100(c))
            DiscreteT(r,c)=21;            
        else
            DiscreteT(r,c)=22;
        end
    end
end
end