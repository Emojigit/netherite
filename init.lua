local nb = "netherite:netherite_block"
local ni = "netherite:netherite_ingot"
minetest.register_node("netherite:netherite_block", {
	description = "Netherite Block",
	tiles = {"netherite.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("netherite:netherite_ingot", {
	description = "Netherite Ingot",
	inventory_image = "netherite_ingot.png"
})

minetest.register_craftitem("netherite:netherite_scrap", {
	description = "Netherite Scrap",
	inventory_image = "netherite_scrap.png"
})

minetest.register_tool("netherite:pick_netherite", {
	description = "Netherite Pickaxe",
	inventory_image = "netherite_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.0, [2]=0.5, [3]=0.25}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})

minetest.register_tool("netherite:shovel_netherite", {
	description = "Netherite Shovel",
	inventory_image = "netherite_shovel.png",
	wield_image = "netherite_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.55, [2]=0.25, [3]=0.15}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("netherite:axe_netherite", {
	description = "Netherite Axe",
	inventory_image = "netherite_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.05, [2]=0.45, [3]=0.25}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("netherite:sword_netherite", {
	description = "Netherite Sword",
	inventory_image = "netherite_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.95, [2]=0.45, [3]=0.15}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_node("netherite:stone_with_netherite", {
	description = "Netherite Ore",
	tiles = {"default_stone.png^netherite_mineral.png"},
	groups = {cracky = 1},
	drop = "netherite:netherite_scrap",
	sounds = default.node_sound_stone_defaults(),
})

local _cs = {}
-- Tools Craft
_cs["netherite:pick_netherite"] = {
	{ni,ni,ni},
	{"", "group:stick", ""},
	{"", "group:stick", ""},
}
_cs["netherite:shovel_netherite"] = {
	{"",ni,""},
	{"", "group:stick", ""},
	{"", "group:stick", ""},
}
_cs["netherite:axe_netherite"] = {
	{ni,ni,""},
	{ni, "group:stick", ""},
	{"", "group:stick", ""},
}
_cs["netherite:sword_netherite"] = {
	{"",ni,""},
	{"", ni, ""},
	{"", "group:stick", ""},
}

-- Block Craft
_cs[nb] = {
	{ni, ni, ni},
	{ni, ni, ni},
	{ni, ni, ni},
}

minetest.register_craft(
  {
    type = "shapeless",
    output = ni .. " 9",
    recipe = {
      nb
    },
  }
)

-- Other
minetest.register_craft(
  {
    type = "shapeless",
    output = ni,
    recipe = {
      "netherite:netherite_scrap",
			"default:gold_ingot"
    },
  }
)

for k,v in pairs(_cs) do
	minetest.register_craft(
	  {
	    output = k,
	    recipe = v,
	  }
	)
end

-- ores
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "netherite:stone_with_netherite",
	wherein        = "default:stone",
	clust_scarcity = 15 * 15 * 15,
	clust_num_ores = 4,
	clust_size     = 3,
	y_max          = -10000,
	y_min          = -31000,
})
