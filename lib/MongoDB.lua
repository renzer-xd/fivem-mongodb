--[[ 
    Thank you mysql-async for lib https://github.com/brouznouf/fivem-mysql-async
    modifier: RenZer Developer Shop
]]
MongoDB = {
    Async = {},
    Sync = {}
}
-- Sync Function
MongoDB.Sync.insert = function(params)
    local status,data,Query = 0,{},false
    exports.mongodb:insert(params, function (success, result, insertedIds)
        if success then
            status = result;data = insertedIds
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return status, data
end

MongoDB.Sync.insertOne = function(params)
    local status,data,Query = 0,{},false
    exports.mongodb:insertOne(params, function (success, result, insertedIds)
        if success then
            status = result;data = insertedIds
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return status, data
end
MongoDB.Sync.find = function(params)
    local data,Query = 0,false
    exports.mongodb:find(params, function(success, result)
        if success then
            data = result
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return data
end
MongoDB.Sync.findOne = function(params)
    local data,Query = 0,false
    exports.mongodb:findOne(params, function(success, result)
        if success then
            data = result
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return data
end

-- Async Function
MongoDB.Async.insert = function(params,cb)
    exports.mongodb:insert(params, cb)
end

MongoDB.Async.insertOne = function(params,cb)
    exports.mongodb:insertOne(params, cb)
end

MongoDB.Async.find = function(params,cb)
    exports.mongodb:find(params, cb)
end

MongoDB.Async.findOne = function(params,cb)
    exports.mongodb:findOne(params, cb)
end

-- MongoDB.ready
MongoDB.ready = function(cb)
    CreateThread(function()
        while GetResourceState('mongodb') ~= 'started' do
            Wait(0)
        end
        repeat
            Wait(0)
        until exports['mongodb']:is_ready()
        cb()
    end)
end