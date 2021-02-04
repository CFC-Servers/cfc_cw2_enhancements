local PLAYER = FindMetaTable( "Player" )

local function wrapCwFlashbang()
    local flash = PLAYER.cwFlashbang

    PLAYER.cwFlashbang = function( ... )
        local shouldFlash = hook.Run( "CFC_CW2Enhancements_ShouldFlashbang", ... )
        if shouldFlash == false then return end

        return flash( ... )
    end
end

hook.Add( "InitPostEntity", "CFC_CW2Enhancements_WrapFlashbang", wrapCwFlashbang )
