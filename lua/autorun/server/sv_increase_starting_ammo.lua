
local function givePlayerAmmoForWeapon( player, weapon )
    local ammoType = weapon:GetPrimaryAmmoType()
    local currentAmmo = player:GetAmmoCount( ammoType )
    if ( currentAmmo == 0 ) then
        player:GiveAmmo("90", ammoType, false)
    end
end

local function giveCW2AmmoOnSpawn( player )
    timer.Simple(0, function()
        for _, weapon in pairs(player:GetWeapons()) do
            local isCW2Weapon = string.sub(weapon:GetClass(), 1, 2) == "cw"
            if ( isCW2Weapon ) then
                givePlayerAmmoForWeapon( player, weapon )
            end
        end
    end)
end

hook.Remove("PlayerSpawn", "CFC-Give-CW2-Ammo")
hook.Add("PlayerSpawn", "CFC-Give-CW2-Ammo", giveCW2AmmoOnSpawn)
