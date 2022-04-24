# FiveM MongoDB wrapper
## Description
* Author: [alcoholiclobster](https://github.com/alcoholiclobster/fivem-mongodb)

* Modifier: [RenZer](https://github.com/renzer-xd/fivem-mongodb)

* This resource is a simple MongoDB wrapper for [FiveM](https://fivem.net/). It's running on top of [MongoDB Node Driver](https://mongodb.github.io/node-mongodb-native/).
# Discord [Here](https://discord.gg/CgzETuC44J)

## Installation

1. Clone this repository to `resources/mongodb` folder.
2. Copy `mongodb/database.cfg` to your server root directory.
3. Add the following lines to your server config:
```
exec "database.cfg"
start mongodb
```
4. Change `mongodb_url` and `mongodb_database` in `database.cfg`.
5. Run `npm install` in `resources/mongodb` directory.

# Usage Exports

Every callback accepts `success<boolean>` as its first argument. If `success` is `false`, second argument contains error message.

Example (Lua):
```lua
exports.mongodb:findOne({ collection = "users", query = { _id = id } }, function (success, result)
    if not success then
        print("Error message: "..tostring(result))
        return
    end

    print("User name is "..tostring(result[1].name))
end)
```
# Usage Library
> Add Library for fivem (Lua): fxmanifest.lua
```lua
server_scripts {
    '@mongodb/mongo.lua',
    ...
}
```
> Library Ready
```lua
MongoDB.ready(function() 
    print('Connect DB')
end)
```
> ## Library insert/insertOne

Sync
```lua
-- insert
local insertUsers = {}
for i = 1, 10 do
    table.insert(insertUsers, { username = "User"..i, password = "123456" })
end
local result =  MongoDB.Sync.insert({collection = 'users',documents = insertUsers})

-- insertOne
local result =  MongoDB.Sync.insertOne({collection = 'users',document = {username = 'steam:xxxxxxxxxxxxxx'}})

-- find
local result =  MongoDB.Sync.find({collection = 'users',query = {}})

-- findOne
local result =  MongoDB.Sync.findOne({collection = 'users',query = {_id = '6264f3cb87acf94a8c1cfdc4'}})
```

Async
```lua
-- insert
local insertUsers = {}
for i = 1, 10 do
    table.insert(insertUsers, { username = "User"..i, password = "123456" })
end
MongoDB.Async.insert({collection = 'users',documents = insertUsers},function(success,result) 
    --    code
end)

-- insertOne
MongoDB.Async.insertOne({collection = 'users',document = {username = 'steam:xxxxxxxxxxxxxx'}},function(success,result) 
    --    code
end)

-- find
MongoDB.Async.find({collection = 'users',query = {}},function(success,result) 
    --    code
end)

-- findOne
MongoDB.Async.findOne({collection = 'users',query = {_id = '6264f3cb87acf94a8c1cfdc4'}},function(success,result) 
    --    code
end)
```

> ## Library find/findOne

Sync
```lua
-- find
local result =  MongoDB.Sync.find({collection = 'users',query = {}})

-- findOne
local result =  MongoDB.Sync.findOne({collection = 'users',query = {_id = '6264f3cb87acf94a8c1cfdc4'}})
```

Async
```lua
-- find
MongoDB.Async.find({collection = 'users',query = {}},function(success,result) 
    --    code
end)

-- findOne
MongoDB.Async.findOne({collection = 'users',query = {_id = '6264f3cb87acf94a8c1cfdc4'}},function(success,result) 
    --    code
end)
```
> ## Library update/updateOne

Sync
```lua
-- update
local result =  MongoDB.Sync.update({collection = 'users',query = {},update = { ["$set"] = { password = "1234567890" } }})

-- updateOne
ocal result =  MongoDB.Sync.updateOne({collection = 'users2',query = {_id = '6264f3cb87acf94a8c1cfdc4'},update = { ["$set"] = { username = "steam:xxxxxxxxxxxxxx2" } }})
```

Async
```lua
-- find
MongoDB.Async.update({collection = 'users',query = {},update = { ["$set"] = { password = "123" } }},function(success) 
    --    code
end)

-- updateOne
MongoDB.Async.updateOne({collection = 'users',query = {_id = '6264f3cb87acf94a8c1cfdc4'},update = { ["$set"] = { username = "steam:xxxxxxxxxxxxxx1" } }},function(success) 
    --    code
end)
```

## exports.mongodb.isConnected
* Returns boolean

Returns true if database connection is established.

## exports.mongodb.insert(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.documents<Object>` - an array of documents to insert
* `params.options<Object>` - optional settings object. See [collection.insertMany in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#insertMany)
* `callback(success<boolean>, insertedCount<number>, insertedIds<Array>)` - callback (optional)
Inserts an array of documents into MongoDB.

## exports.mongodb.insertOne(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.document<Object>` - document object
* `params.options<Object>` - optional settings object. See [collection.insertMany in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#insertMany)
* `callback(success<boolean>, insertedCount<number>, insertedIds<Array>)` - callback (optional)

Inserts a single document into MongoDB.

## exports.mongodb.find(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.options<Object>` - optional settings object. See [collection.find in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#find)
* `params.limit<number>` - limit documents count
* `callback(success<boolean>, documents<Array>)` - callback (optional)

Performs a find query.

## exports.mongodb.findOne(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.options<Object>` - optional settings object. See [collection.find in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#find)
* `callback(success<boolean>, documents<Array>)` - callback (optional)

Performns a find query with `limit = 1`.

## exports.mongodb.update(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.update<Object>` - update query object
* `params.options<Object>` - optional settings object. See [collection.updateMany in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#updateMany)
* `callback(success<boolean>, updatedCount<number>)` - callback (optional)

Update multiple documents on MongoDB.

## exports.mongodb.updateOne(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.update<Object>` - update query object
* `params.options<Object>` - optional settings object. See [collection.updateMany in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#updateMany)
* `callback(success<boolean>, updatedCount<number>)` - callback (optional)

Update a single document on MongoDB.

## exports.mongodb.count(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.options<Object>` - optional settings object. See [collection.countDocuments in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#countDocuments)
* `callback(success<boolean>, count<number>)` - callback (optional)

Gets the number of documents matching the filter.

## exports.mongodb.delete(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.options<Object>` - optional settings object. See [collection.deleteMany in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#deleteMany)
* `callback(success<boolean>, deletedCount<number>)` - callback (optional)

Delete multiple documents on MongoDB.

## exports.mongodb.deleteOne(params, callback);
* `params<Object>` - params object
* `params.collection<string>` - collection name
* `params.query<Object>` - filter query object
* `params.options<Object>` - optional settings object. See [collection.deleteMany in docs](http://mongodb.github.io/node-mongodb-native/3.1/api/Collection.html#deleteOne)
* `callback(success<boolean>, deletedCount<number>)` - callback (optional)

Delete a document on MongoDB.
