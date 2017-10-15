local util = {}

function util.read_file(path)
    local file = io.open(path, "r") -- r read mode and b binary mode
    if not file then 
        hs.alert.show("File " .. path .. " not found")
        return nil
    end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

return util
