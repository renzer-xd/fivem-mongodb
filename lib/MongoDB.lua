--[[ 
    Thank you mysql-async for lib https://github.com/brouznouf/fivem-mysql-async
    modifier: RenZer Developer Shop
]]
MongoDB = {
    Async = {},
    Sync = {}
}
-- MongoDB.ready
function MongoDB.ready(callback)
    CreateThread(function()
        while GetResourceState('mongodb') ~= 'started' do
            Wait(0)
        end
        while not exports['mongodb']:is_ready() do
            Wait(0)
        end
        callback()
    end)
end