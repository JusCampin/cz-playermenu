-- cz-playermenu server
-- lightweight logger that prefers CZLog when available
local CoreAPI = CZCore
local Log = {
    info = function(msg) if CoreAPI and CoreAPI.Log and CoreAPI.Log.info then CoreAPI.Log.info(msg) else print(tostring(msg)) end end,
    warn = function(msg) if CoreAPI and CoreAPI.Log and CoreAPI.Log.warn then CoreAPI.Log.warn(msg) else print(tostring(msg)) end end,
    error = function(msg) if CoreAPI and CoreAPI.Log and CoreAPI.Log.error then CoreAPI.Log.error(msg) else print(tostring(msg)) end end,
}

local function start_version_check(core)
    if not core or type(core) ~= 'table' or not core.Versioner or not core.Versioner.checkFile then
        return
    end
    core.Versioner.checkFile(GetCurrentResourceName(), 'https://github.com/JusCampin/cz-playermenu')
end

-- prefer the global `CZCore` if available for immediate access
if type(CZCore) == 'table' then
    CoreAPI = CZCore
    Log.info('Using CZCore global for startup')
    start_version_check(CoreAPI)
else
    AddEventHandler('cz-core:ready', function(core)
        if type(core) == 'table' then
            CoreAPI = core
            start_version_check(core)
        end
    end)
    -- ensure we request the API in case the ready event was missed
    TriggerEvent('cz-core:request_api')
end
