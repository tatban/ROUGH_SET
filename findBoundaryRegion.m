function bndry=findBoundaryRegion(lowerBound,upperBound)
    bndry={};
    [row,col]=size(upperBound);
    for i=1:col
        temp_upper=cell2mat(upperBound(1,i));
        temp_lower=cell2mat(lowerBound(1,i));
        temp_bndry=setdiff(temp_upper,temp_lower);
        bndry(1,i)={temp_bndry};
    end
end