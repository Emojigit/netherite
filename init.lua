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

minetest.register_craft(
  {
    output = nb,
    recipe = {
      {ni, ni, ni},
      {ni, ni, ni},
      {ni, ni, ni},
    },
  }
)

minetest.register_craft(
  {
    type = "shapeless",
    output = ni .. " 9",
    recipe = {
      nb
    },
  }
)
