
function giveCW2AmmoOnSpawn( player )
	timer.Simple(0, function()
		local cw2Weapons = {}
		for _, weapon in pairs(player:GetWeapons()) do
			local isCW2Weapon = string.sub(weapon:GetClass(), 1, 2) == "cw"
			if ( isCW2Weapon ) then
				table.insert( cw2Weapons, weapon)
			end
		end

		for _, cw2Weapon in pairs(cw2Weapons) do
			local ammoType = cw2Weapon:GetPrimaryAmmoType()
			local currentAmmo = player:GetAmmoCount( ammoType )
			if ( currentAmmo == 0) then
				player:GiveAmmo("90", ammoType, false)
			end
		end
	end)
end

hook.Remove("PlayerSpawn", "CFC-Give-CW2-Ammo")
hook.Add("PlayerSpawn", "CFC-Give-CW2-Ammo", giveCW2AmmoOnSpawn)
