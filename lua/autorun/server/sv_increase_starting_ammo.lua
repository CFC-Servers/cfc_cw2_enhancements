
function giveCW2AmmoOnSpawn( player )
    local cw2Weapons = {}
    for _, weapon in pairs(player:GetWeapons()) do
        local isCW2Weapon = string.sub(weapon:GetClass(), 1, 2) == "cw"
        if ( isCW2Weapon ) then
            table.insert( cw2Weapons, weapon)
        end
    end

    for _, cw2Weapon in pairs(cw2Weapons) do
        local ammoType = cw2Weapon:GetPrimaryAmmoType()
        player:GiveAmmo("90", ammoType, false)
        cw2Weapon:SetClip1(31)
    end
end

hook.Remove("PlayerSpawn", "CFC-Give-CW2-Ammo")
hook.Add("PlayerSpawn", "CFC-Give-CW2-Ammo", giveCW2AmmoOnSpawn)
