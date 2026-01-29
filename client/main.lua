
if not CZCore then
    AddEventHandler('cz-core:ready', function(core)
        if type(core) == 'table' then
            CZCore = core
        end
    end)
    TriggerEvent('cz-core:request_api')
end

-- lightweight logger that prefers CZLog when available
local CoreAPI = CZCore
local Log = {
    info = function(msg) if CoreAPI and CoreAPI.Log and CoreAPI.Log.info then CoreAPI.Log.info(msg) else print(tostring(msg)) end end,
    warn = function(msg) if CoreAPI and CoreAPI.Log and CoreAPI.Log.warn then CoreAPI.Log.warn(msg) else print(tostring(msg)) end end,
    error = function(msg) if CoreAPI and CoreAPI.Log and CoreAPI.Log.error then CoreAPI.Log.error(msg) else print(tostring(msg)) end end,
}

AddEventHandler('cz-core:ready', function(core)
    if type(core) == 'table' then
        CoreAPI = core
        Log.info('cz-playermenu received core API')
    end
end)

-- ensure we request the API in case the ready event was missed
TriggerEvent('cz-core:request_api')
