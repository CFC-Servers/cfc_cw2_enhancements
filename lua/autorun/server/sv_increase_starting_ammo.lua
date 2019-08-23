
local blacklistedWeapons = {
    ["cw_extrema_ratio_official"] = true,
    ["cw_flash_grenade"] = true,
    ["cw_frag_grenade"] = true,
    ["cw_m79"] = true,
    ["ins2_atow_rpg7"] = true,
    ["cw_smoke_grenade"] = true,
    ["cw_ws_pamachete"] = true,
    ["cw_tr09_aresshrike"] = true,
    ["cw_g36c"] = true,
    ["cw_tr09_tar21"] = true,
    ["cw_tr09_qbz97"] = true,
    ["cw_tr09_auga3"] = true,
    ["cw_g4p_g2contender"] = true
}

local function isCW2Weapon( wep )
    local wepClass = wep:GetClass()
    return string.sub( weapon:GetClass(), 1, 3 ) == "cw_"
end

local function givePlayerAmmoForWeapon( ply, wep )
    local ammoType = wep:GetPrimaryAmmoType()
    local currentAmmo = ply:GetAmmoCount( ammoType )

    if currentAmmo <= wep:Clip1() then
        ply:GiveAmmo( 256, ammoType, false )
    end
end

local function giveCW2AmmoOnSpawn( ply )
    timer.Simple( 0, function()
        for _, wep in pairs( ply:GetWeapons() ) do
            local isCW2Weapon = isCW2Weapon( wep )

            if isCW2Weapon then
                givePlayerAmmoForWeapon( ply, wep )
            end
        end
    end )
end

local function onEquipCW2Wep( wep, ply )
    local wepClass = wep:GetClass()
    if blacklistedWeapons[wepClass] then return end
    
    if isCW2Weapon( wep ) then
        givePlayerAmmoForWeapon( ply, wep )
    end
end

hook.Remove("PlayerSpawn", "CFC_Give_CW2_Ammo")
hook.Add("PlayerSpawn", "CFC_Give_CW2_Ammo", giveCW2AmmoOnSpawn)

hook.Remove( "WeaponEquip", "CFC_Equip_CW2_Wep" )
hook.Add( "WeaponEquip", "CFC_Equip_CW2_Wep", onEquipCW2Wep )