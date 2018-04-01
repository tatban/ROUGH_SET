function redc_table=calculateReduct(DCrn_matrix)
    [row,col]=size(DCrn_matrix);
    core=[];
    k=1;
    for i=1:row
        for j=1:col
            if i>j
                %DCrn_matrix(i,j)={[]};
                [~,c1]=size(DCrn_matrix{i,j});
                if c1==1%if there is a single entry ... 
                    if ~ismember(DCrn_matrix{i,j},core)%if there is a single entry and that is not already taken in the set then it will be added to the core
                        core(k)=DCrn_matrix{i,j};
                        DCrn_matrix(i,j)={[]};%deleting the processed values(cores)
                        k=k+1;
                    else
                        DCrn_matrix(i,j)={[]};%deleting the processed values(cores)
                    end
                end
            end
        end
    end
    %display(core);
%<-----------Core calculation done here.Reduct calculation starts---------->
    setOfReducts={};
    k=1;
    for i=1:row
        for j=1:col
            if i>j
                if isSubset(core,cell2mat(DCrn_matrix(i,j))) && ~isMemberCell(DCrn_matrix(i,j),setOfReducts)%finds the entries in the decern matrix for which cor is a subset and stores those in a set
                    setOfReducts(k)=DCrn_matrix(i,j);
                    %DCrn_matrix(i,j)={[]};%deleting the processed values(cores)
                    %display(setOfReducts);
                    k=k+1;
                end
            end
        end
    end
    if isempty(setOfReducts)
        redc_table=core;%if the core is not the subset of any of the entries of the decern matrix then the core itself is the reduct 
    else
        %if core is a subset of multiple entries of the decern matrix then we need to choose a minimal subset among those, as reduct
        size_array=cellfun('length',setOfReducts);%this calculates the length of each cell in the cell array and stores it in a vector
        %display(size_array);
        %[~,indx_minLength]=min(size_array);%returns the index of the min length cell
        size_array=(size_array(:)==min(size_array))';
        indx=find(size_array);%indx is the vector containing the indices of the minimum values for length 
        for i=1:length(indx)
            redc_table(i)=setOfReducts(indx(i));%assigns the minimal subset containing core as reduct. Note: If we get such multiple minimal subsets(containing the core) then our system only takes the first one and assigns it to reduct 
        end
    end
end

%points to be addressed: 1)What if there is at all no core(single entry), 2)If same reduct occurs multiple times then system should display it once but here multiple redundant copies are produced consider lems table and check. 