function out = myhuffmanenco(input, table)

    [h w] = size(input);
    enco = '';
    index = 1;
    
    for i=1 : h
        for j=1 : w
            if input(i,j) == 255
                enco = strcat(enco,char(table(256)));
            else
                enco = strcat(enco,char(table(input(i,j)+1)));
            end
            
            while length(enco) > 8
                out(index) = uint8(bin2dec(enco(1:8)));
                enco(1:8) = [];
                index = index + 1;
            end
        end
    end
    
    if ~isempty(enco)
        out(index) = uint8(bin2dec(enco(1:length(enco))));
        out(index+1) = uint8(length(enco));
    end
    
end
