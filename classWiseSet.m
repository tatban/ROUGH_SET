function cls_ws_set = classWiseSet(Table)
%=============================================================================================================================
%    This function groups the objects or examples based on thier decision attribute values.
%    Input: 
%        A table, whose first column represents the row Id, Last column represent the decision attribute 
%        and rest of the columns represent the condition attribues and rows represents the objects or examples.
%        The condition attributes may be all the condition attributes in the actual information system or a subset of that attribute set 'A'        
%        This works with only single decision attribute.
%        Caution:                
%               i) Input should contain only integers in its entries. (No string or no complex number or decimal number)
%              ii) Ecah cell of the table should have a scalar value.
%    Output: 
%        An array of cells in which each cell contains different indecernable sets of examples.
%    Author: Tathagata Bandyopadhyay (tathagatabanerjee15@rocketmail.com)
%    Documentation: Tathagta
%    Last Modified: 07-04-2018(dd-mm-yyyy) by Tathagata
%=============================================================================================================================
[row,col]=size(Table);
cls_ws_set = accumarray(Table(:,col),Table(:,1),[],@(x){x},{});
end