BlacklistedAmmo = { 
    ["Smoke Grenades"] = true,
    ["Flash Grenades"] = true,
    ["Frag Grenades"] = true,
    ["40MM"] = true
    -- we don't actually have to add RPG ammo here
}

function givePlayerCWAmmo(Ply)
    for AmmoName, bulletInfo in pairs(CustomizableWeaponry.ammoTypes) do
        if not BlacklistedAmmo[AmmoName] then
            Ply:SetAmmo(1000,AmmoName)
        end
    end
end

hook.Add("PlayerSpawn", "CFC-Give-CW2-Ammo", givePlayerCWAmmo)
