-- cz-playermenu server
-- lightweight logger that prefers CZLog when available
local Log = {}
function Log.info(msg) if CZLog and CZLog.info then CZLog.info(msg) else print(tostring(msg)) end end
function Log.warn(msg) if CZLog and CZLog.warn then CZLog.warn(msg) else print(tostring(msg)) end end
function Log.error(msg) if CZLog and CZLog.error then CZLog.error(msg) else print(tostring(msg)) end end

local function start_version_check(core)
    if not core or type(core) ~= 'table' or not core.Versioner or not core.Versioner.checkFile then
        return
    end
    core.Versioner.checkFile(GetCurrentResourceName(), 'https://github.com/JusCampin/cz-playermenu')
end

-- prefer the global `CZCore` if available for immediate access
if type(CZCore) == 'table' then
    Log.info('Using CZCore global for startup')
    start_version_check(CZCore)
else
    AddEventHandler('cz-core:ready', function(core)
        if type(core) == 'table' then
            start_version_check(core)
        end
    end)
    -- ensure we request the API in case the ready event was missed
    TriggerEvent('cz-core:request_api')
end
