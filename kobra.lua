mobs:register_mob("animalworld:kobra", {
stepheight = 2,
	type = "monster",
	passive = false,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 12, -- shoot for 10 seconds
	dogshoot_count2_max = 3, -- dogfight for 3 seconds
	reach = 3,
	shoot_interval = 2.2,
	arrow = "animalworld:snakepoison",
	shoot_offset = 1,
	attack_animals = true,
	reach = 2,
        damage = 8,
	hp_min = 20,
	hp_max = 60,
	armor = 100,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Kobra.b3d",
	visual_size = {x = 0.3, y = 0.3},
	textures = {
		{"texturekobra.png"},
	},
	sounds = {
		random = "animalworld_kobra",
		attack = "animalworld_kobra",
	},
	makes_footstep_sound = false,
	view_range = 6,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = false,
	jump = false,
        jump_height = 0,
	stepheight = 2,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 60,
		stand_start = 0,
		stand_end = 100,
		walk_start = 250,
		walk_end = 350,
		punch_start = 150,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},

	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing"},
	floats = 0,
})


if not mobs.custom_spawn_monster then
mobs:spawn({
	name = "animalworld:kobra",
	nodes = {"default:desert_sandstone", "default:desert_stone", "default:sandstone", "default:dirt_with_rainforest_litter"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = -30,
	max_height = 10,
})
end


mobs:register_egg("animalworld:kobra", ("Cobra"), "akobra.png")


mobs:alias_mob("animalworld:kobra", "animalworld:kobra") -- compatiblity

-- mese arrow (weapon)
mobs:register_arrow("animalworld:snakepoison", {
	visual = "sprite",
--	visual = "wielditem",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"animalworld_snakepoison.png"},
	--textures = {""animalworld_snakepoison.png""},
	velocity = 6,
--	rotate = 180,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})

