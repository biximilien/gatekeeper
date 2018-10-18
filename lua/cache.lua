local _M = {}

local lrucache = require "resty.lrucache"

local c, err = lrucache.new(200)
if not c then
    return error("failed to create the cache: " .. (err or "unknow"))
end

function _M.put()
    if ngx.req.get_method() == "POST" then
        c:set("content", ngx.req.get_body_data())
        ngx.say("POST")
        return
    end
    ngx.say("PUT")
end

function _M.get()
    ngx.say("Content: ", c:get("content"))
end

return _M
