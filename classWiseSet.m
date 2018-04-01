function cls_ws_set=classWiseSet(Table)
    [row,col]=size(Table);
    cls_ws_set = accumarray(Table(:,col),Table(:,1),[],@(x){x},{});
end

