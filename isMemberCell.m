function boolVal=isMemberCell(A,B)
    [r,c]=size(B);
    %[r1,c1]=size(A);
    boolVal=0;
    for i=1:r
        for j=1:c
            if isSubset(cell2mat(A),B{i,j}) && isSubset(B{i,j},cell2mat(A))%checking whether the cell A and the cell B(i,j) are equivalent by the property if X is Subset of Y and Y is subset of X then X and Y are equivalent 
                boolVal=1;
                break;
            end
        end
        if boolVal==1
            break;
        end
    end
end