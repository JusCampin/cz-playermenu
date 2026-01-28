
if not CZCore then
    AddEventHandler('cz-core:ready', function(core)
        if type(core) == 'table' then
            CZCore = core
        end
    end)
    TriggerEvent('cz-core:request_api')
end

-- lightweight logger that prefers CZLog when available
local Log = {}
function Log.info(msg) if CZLog and CZLog.info then CZLog.info(msg) else print(tostring(msg)) end end
function Log.warn(msg) if CZLog and CZLog.warn then CZLog.warn(msg) else print(tostring(msg)) end end
function Log.error(msg) if CZLog and CZLog.error then CZLog.error(msg) else print(tostring(msg)) end end

local CoreAPI = CZCore

AddEventHandler('cz-core:ready', function(core)
    if type(core) == 'table' then
        CoreAPI = core
        Log.info('cz-playermenu received core API')
    end
end)

-- ensure we request the API in case the ready event was missed
TriggerEvent('cz-core:request_api')
local CoreAPI = CZCore
