function log=cleanup(log)
p = properties(log);
for i=1:length(p)
    inner=log.(p{i});
    if isa(inner,'LogMsgGroup')
        if isprop(inner,"TimeS")
            if (isempty(inner.TimeS))
                log.(p{i})=-1;
            end
        else
            fprintf("Err");
        end
    end
end