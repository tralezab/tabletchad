dofile("data/scripts/lib/utilities.lua")

extra_modifiers = 
{
	critical_hit_boost = function()
		c.damage_critical_chance = c.damage_critical_chance + 5
	end,

	damage_projectile_boost = function()
		c.damage_projectile_mul = c.damage_projectile_mul + 0.5
	end,

	game_effect_freeze = function()
		c.game_effect_entities = c.game_effect_entities .. "data/entities/misc/effect_frozen.xml,"
	end,
	
	extra_knockback = function()
		c.knockback_force = c.knockback_force + 6
	end,
	
	lower_spread = function()
		c.spread_degrees = c.spread_degrees - 15
		c.speed_multiplier = c.speed_multiplier * 1.2
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 25.0
	end,
	
	bounce = function()
		c.bounces = c.bounces + 3
	end,
	
	projectile_homing_shooter = function()
		c.extra_entities = c.extra_entities .. "data/entities/misc/perks/projectile_homing_shooter.xml"
	end,
	
	projectile_alcohol_trail = function()
		c.trail_material = c.trail_material .. "alcohol,"
		c.trail_material_amount = c.trail_material_amount + 5
	end,

	instant_suffocation = function()
		GameScreenshake( 1000 )
		GamePrintImportant( "You have angered the Gods", "" )
		local yall = get_players()
		local you = yall[1]
		local damagemodels = EntityGetComponent( you, "DamageModelComponent" )
		if( damagemodels ~= nil ) then --suffocate them
			for i,damagemodel in ipairs(damagemodels) do
				ComponentSetValue( damagemodel, "air_lack_of_damage", 100000 ) --that'll do
				ComponentSetValue( damagemodel, "air_in_lungs", 0 )
			end
		end
	end,

}
