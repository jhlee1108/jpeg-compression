function out = myhuffmandeco(input, table)
    deco = '';
    index = 1;
    l = length(table);
    root = dlnode(-1,-1);
    
    for i=1 : l
        if ~isempty(table{i})
             root = makehuffmantree(root, i-1, table{i});
        end
    end
    
    r = root;
    while length(input) > 2
        if isempty(deco)
            deco = strcat(deco,dec2bin(input(1),8));
            input(1)=[];
        end
        
        if deco(1) == '0'
            r = r.Left;
        elseif deco(1) == '1'
            r = r.Right;
        end
        deco(1) = [];
        
        if isLeafNode(r)
            out(index) = uint8(r.Data);
            index = index + 1;
            r = root;
        end
    end
    
    if ~isempty(input)
        deco = strcat(deco,dec2bin(input(1),input(2)));
    end
    
    while ~isempty(deco)
        if isempty(deco)
            deco = strcat(deco,dec2bin(input(1),8));
            input(1)=[];
        end
        
        if deco(1) == '0'
            r = r.Left;
        elseif deco(1) == '1'
            r = r.Right;
        end
        deco(1) = [];
        
        if isLeafNode(r)
            out(index) = uint8(r.Data);
            index = index + 1;
            r = root;
        end
    end
end

function out = makehuffmantree(root, data, code)
    if isempty(code)
        root.Data = data;
    
    else
        if code(1) == '0'
            if isempty(root.Left)
                insertLeft(dlnode(-1,-1), root);
            end
            makehuffmantree(root.Left, data, code(2:length(code)));
            
        elseif code(1) == '1'
            if isempty(root.Right)
                insertRight(dlnode(-1,-1), root);
            end
            makehuffmantree(root.Right, data, code(2:length(code)));
        end
    end
    
    out = root;
end

function out = isLeafNode(node)
    out = isempty(node.Left) & isempty(node.Right);
end