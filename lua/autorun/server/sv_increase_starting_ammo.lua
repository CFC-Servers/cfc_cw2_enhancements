local blacklistedAmmo = {
    ["Smoke Grenades"] = true,
    ["Flash Grenades"] = true,
    ["Frag Grenades"] = true,
    ["40MM"] = true
    -- we don't actually have to add RPG ammo here
}

local cwAmmo = {}

function givePlayerCWAmmo( ply )
    for ammoName in pairs( cwAmmo ) do
        ply:SetAmmo( 1000, ammoName )
    end
end

hook.Add( "PlayerSpawn", "CFC_CWEnhancements_GiveCW2Ammo", givePlayerCWAmmo )
hook.Add( "Initialize", "CFC_CW2_GetAmmoTypes", function()
    for ammoName in pairs( CustomizableWeaponry.ammoTypes ) do
        cwAmmo[ammoName] = blacklistedAmmo[ammoName] == nil
    end
end )
