
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("animalworld") or
		dofile(path .. "intllib.lua")

mobs.intllib = S

-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")
if input then
	mobs.custom_spawn_animalworld = true
	input:close()
	input = nil
end


-- Animals
dofile(path .. "kangaroo.lua") -- 
-- TODO: kangaroo steak
--dofile(path .. "hunger.lua") --



-- Load custom spawning
if mobs.custom_spawn_animalworld then
	dofile(path .. "spawn.lua")
end




print (S("[MOD] Mobs Redo Animals loaded"))
