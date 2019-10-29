dofile( "data/scripts/perks/perk.lua" )
dofile( "mods/bigdumb/files/no_wand_pickups.lua" )

function OnPlayerSpawned( player_entity ) -- this runs when player entity has been created

	local inventory = nil
	local x,y = EntityGetTransform( player_entity )

	-- find the quick inventory
	local player_child_entities = EntityGetAllChildren( player_entity )
	if ( player_child_entities ~= nil ) then
		for i,child_entity in ipairs( player_child_entities ) do
			local child_entity_name = EntityGetName( child_entity )
			
			if ( child_entity_name == "inventory_quick" ) then
				inventory = child_entity
			end
		end
	end

	-- set inventory contents
	if ( inventory ~= nil ) then
		local inventory_items = EntityGetAllChildren( inventory )
		
		-- remove default items
		if inventory_items ~= nil then
			for i,item_entity in ipairs( inventory_items ) do
				GameKillInventoryItem( player_entity, item_entity )
			end
		end
		-- add taaaablets
		for i,item_entity in ipairs( {"data/entities/items/books/throwtablet1.xml", "data/entities/items/books/throwtablet2.xml", "data/entities/items/books/throwtablet3.xml", "data/entities/items/books/throwtablet4.xml"} ) do
			local item_entity = EntityLoad( item_entity )
			EntityAddChild( inventory, item_entity )
		end
	end

	--now the last thing, giving a perk.
	local perk_entity = perk_spawn( x, y, "NO_WANDS" )
	if ( perk_entity ~= nil ) then
		perk_pickup( perk_entity, player_entity, EntityGetName( perk_entity ), false, false )
	end
end