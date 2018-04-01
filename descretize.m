function DiscreteT = descretize(Table)
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