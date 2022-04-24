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

MongoDB.Sync.update = function(params)
    local data,Query = 0,false
    exports.mongodb:update(params, function(success, updatedCount)
        if success then
            data = updatedCount
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return data
end

MongoDB.Sync.updateOne = function(params)
    local data,Query = 0,false
    exports.mongodb:updateOne(params, function(success, updatedCount)
        if success then
            data = updatedCount
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return data
end

MongoDB.Sync.count = function(params)
    local data,Query = 0,false
    exports.mongodb:count(params, function(success, count)
        if success then
            data = count
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return data
end

MongoDB.Sync.delete = function(params)
    local data,Query = 0,false
    exports.mongodb:delete(params, function(success, deletedCount)
        if success then
            data = deletedCount
        end
        Query = true
    end)
    repeat 
        Wait(0) 
    until Query
    return data
end

MongoDB.Sync.deleteOne = function(params)
    local data,Query = 0,false
    exports.mongodb:deleteOne(params, function(success, deletedCount)
        if success then
            data = deletedCount
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

MongoDB.Async.update = function(params,cb)
    exports.mongodb:update(params, cb)
end

MongoDB.Async.updateOne = function(params,cb)
    exports.mongodb:updateOne(params, cb)
end

MongoDB.Async.count = function(params,cb)
    exports.mongodb:count(params, cb)
end

MongoDB.Async.delete = function(params,cb)
    exports.mongodb:delete(params, cb)
end

MongoDB.Async.deleteOne = function(params,cb)
    exports.mongodb:deleteOne(params, cb)
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