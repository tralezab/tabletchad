dofile( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local inventory = nil

-- find the quick inventory
local player_child_entities = EntityGetAllChildren( player_entity )
if ( player_child_entities ~= nil ) then
	for i,child_entity in ipairs( player_child_entities ) do
		local child_entity_name = EntityGetName( child_entity )
		
		if ( child_entity_name == "inventory_quick" ) then
			inventory = child_entity
		end
	end

-- find wands and kill the player if they have one
if ( inventory ~= nil ) then
	local inventory_items = EntityGetAllChildren( inventory )
	
	-- remove default items
	if inventory_items ~= nil then
		for i,item_entity in ipairs( inventory_items ) do
			if(item_entity.name = default)
				GamePrintImportant( "You have angered the Gods", "" )
			end
		end
	end
end

