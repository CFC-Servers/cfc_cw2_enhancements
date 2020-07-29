local blacklistedAmmo = {
    ["Smoke Grenades"] = true,
    ["Flash Grenades"] = true,
    ["Frag Grenades"] = true,
    ["40MM"] = true
    -- we don't actually have to add RPG ammo here
}

function givePlayerCWAmmo(Ply)
    for ammoName, bulletInfo in pairs( CustomizableWeaponry.ammoTypes ) do
        if not blacklistedAmmo[ammoName] then
            Ply:SetAmmo( 1000, ammoName )
        end
    end
end

hook.Add( "PlayerSpawn", "CFC_CWEnhancements_GiveCW2Ammo", givePlayerCWAmmo )
