dofile("data/scripts/lib/utilities.lua")

table.insert( perk_list,
{
	id = "NO_WANDS",
	ui_name = "The Vow",
	ui_description = "You are forbidden by the gods from using wands.",
	ui_icon = "mods/bigdumb/files/thevow.png",
	perk_icon = "mods/bigdumb/files/vowig.png",
	--not_in_default_perk_pool = cfg_disable_wandbuff,
	func = function( entity_perk_item, entity_who_picked, item_name )
		EntityAddComponent( entity_who_picked, "ShotEffectComponent", 
		{ 
			extra_modifier = "instant_suffocation",
		} )
			
	end,
		
})


