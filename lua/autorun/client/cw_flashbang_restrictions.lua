local PLAYER = FindMetaTable( "Player" )

local function wrapCwFlashbang()
    local flash = PLAYER.cwFlashbang
    PLAYER.cwFlashbang = function( self, intensity, duration )
        if not ply:isInPvp() then return end

        return flash( self, intensity, duration )
    end
end

local function waitingFor()
    return PLAYER.cwFlashbang ~= nil
end

local function onTimout()
    print( "flashbang wrapper timed out" )
end


if Waiter then
    Waiter.waitFor( waitingFor, wrapCwFlashbang, onTimout )
else
    WaiterQueue = WaiterQueue or {}

    local struct = {}
    struct["waitingFor"] = waitingFor
    struct["onSuccess"] =  wrapCwFlashbang
    struct["onTimeout"] = onTimout

    table.insert( WaiterQueue, struct )
end
