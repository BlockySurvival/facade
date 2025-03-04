facade  = {}

-- Define the shapes and registration functions
dofile (minetest.get_modpath("facade") .. "/shapes.lua")

local function table_clone(org)
	return {unpack(org)}
end

local function register_node(modname, subname, variant, def)
	local node_name
	local old_name
	if minetest.get_current_modname() == "facade" then
		node_name = ("facade:%s_%s_%s"):format(modname, subname, variant)
		old_name =("facade:%s_%s"):format(subname, variant)
	else
		node_name = (":facade:%s_%s_%s"):format(modname, subname, variant)
		old_name = (":facade:%s_%s"):format(subname, variant)
	end

	local existing_def	= minetest.registered_nodes[("%s:%s"):format(modname, subname)] or {}

	def.drawtype		  = "nodebox"
	def.paramtype		  = "light"
	def.paramtype2		  = "facedir"
	def.is_ground_content = false
	def.light_source	  = existing_def.light_source
	def.sounds			  = existing_def.sounds or default.node_sound_stone_defaults()
	def.groups			  = table_clone(existing_def.groups or {})
	if #def.groups == 0 then
		def.groups = { cracky = 3, oddly_breakable_by_hand = 2, stone = 1 }
	end
	if not in_creative then
		def.groups.not_in_creative_inventory = 1
	end

	minetest.register_node(node_name, def)
	minetest.register_alias_force(old_name, node_name)
end

--------------
--Bannerstones
--------------

--Node will be called facade:<subname>_bannerstone
function facade.register_bannerstone(modname, subname, recipeitem, desc)
	register_node(modname, subname, "bannerstone", {
		description   = desc .. " Bannerstone",
		tiles		 = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_bannerstone.png"
		},
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5, 0.25, -0.5625, 0.5, 0.375, -0.5 },
				{ -0.5, -0.375, -0.5625, 0.5, -0.25, -0.5 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			}
		},
	})
end

--Node will be called facade:<subname>_bannerstone_corner
function facade.register_bannerstone_corner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "bannerstone_corner", {
		description   = desc .. " Bannerstone Corner",
		tiles		 = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_bannerstone.png",
			"" .. modname .. "_" .. subname .. ".png^facade_bannerstone.png",
			"" .. modname .. "_" .. subname .. ".png^facade_bannerstone.png",
			"" .. modname .. "_" .. subname .. ".png^facade_bannerstone.png"
		},
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5625, 0.25, -0.5625, 0.5625, 0.375, 0.5625 },
				{ -0.5625, -0.375, -0.5625, 0.5625, -0.25, 0.5625 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			}
		},
	})
end

--------------
--Centerstones
--------------

--Node will be called facade:<subname>_centerstone
function facade.register_centerstone(modname, subname, recipeitem, desc)
	register_node(modname, subname, "centerstone", {
		description   = desc .. " Centerstone",
		tiles		 = { "" .. modname .. "_" .. subname .. ".png^facade_centerstone.png" },
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375 },
				{ -0.5, -0.25, 0.0625, 0.5, 0.25, 0.25 },
				{ -0.5, -0.25, -0.25, 0.5, 0.25, -0.0625 },
				{ -0.25, -0.25, -0.5, -0.0625, 0.25, 0.5 },
				{ 0.0625, -0.25, -0.5, 0.25, 0.25, 0.5 },
				{ -0.5, 0.0625, -0.25, 0.5, 0.25, 0.25 },
				{ -0.5, -0.25, -0.25, 0.5, -0.0625, 0.25 },
				{ -0.25, -0.25, -0.5, 0.25, -0.0625, 0.5 },
				{ -0.25, 0.0625, -0.5, 0.25, 0.25, 0.5 },
				{ -0.25, -0.5, -0.25, 0.25, 0.5, -0.0625 },
				{ -0.25, -0.5, 0.0625, 0.25, 0.5, 0.25 },
				{ 0.0625, -0.5, -0.1875, 0.25, 0.5, 0.1875 },
				{ -0.25, -0.5, -0.1875, -0.0625, 0.5, 0.1875 },
				{ -0.5, 0.3125, 0.3125, 0.5, 0.5, 0.5 },
				{ -0.5, 0.3125, -0.5, 0.5, 0.5, -0.3125 },
				{ 0.3125, 0.3125, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5, 0.3125, -0.5, -0.3125, 0.5, 0.5 },
				{ -0.5, -0.5, -0.5, -0.3125, -0.3125, 0.5 },
				{ 0.3125, -0.5, -0.5, 0.5, -0.3125, 0.5 },
				{ -0.5, -0.5, -0.5, 0.5, -0.3125, -0.3125 },
				{ -0.5, -0.5, 0.3125, 0.5, -0.3125, 0.5 },
				{ 0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125 },
				{ 0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5 },
				{ -0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5 },
				{ -0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			}
		},
	})
end

---------
--Columns
---------

--Node will be called facade:<subname>_column
function facade.register_column(modname, subname, recipeitem, desc)
	register_node(modname, subname, "column", {
		description   = desc .. " Column",
		tiles		 = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_column.png",
			"" .. modname .. "_" .. subname .. ".png^facade_column.png"
		},
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.4375, 0.5, 0.5, 0.4375 },
				{ -0.5, -0.5, -0.5, -0.3125, 0.5, 0.5 },
				{ 0.3125, -0.5, -0.5, 0.5, 0.5, 0.5 },
				{ 0.0625, -0.5, -0.5, 0.1875, 0.5, 0.5 },
				{ -0.1875, -0.5, -0.5, -0.0625, 0.5, 0.5 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			}
		},
	})

end


--Node will be called facade:<subname>_column_corner
function facade.register_column_corner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "column_corner", {
		description   = desc .. " Column Corner",
		tiles		 = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_column.png",
			"" .. modname .. "_" .. subname .. ".png^facade_column.png",
			"" .. modname .. "_" .. subname .. ".png^facade_column.png",
			"" .. modname .. "_" .. subname .. ".png^facade_column.png"
		},
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375 },
				{ -0.5, -0.5, 0.3125, -0.3125, 0.5, 0.5 },
				{ 0.3125, -0.5, -0.5, 0.5, 0.5, -0.3125 },
				{ 0.0625, -0.5, -0.5, 0.1875, 0.5, 0.5 },
				{ -0.1875, -0.5, -0.5, -0.0625, 0.5, 0.5 },
				{ 0.3125, -0.5, 0.3125, 0.5, 0.5, 0.5 },
				{ -0.5, -0.5, -0.5, -0.3125, 0.5, -0.3125 },
				{ -0.5, -0.5, 0.0625, 0.5, 0.5, 0.1875 },
				{ -0.5, -0.5, -0.1875, 0.5, 0.5, -0.0625 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			}
		},
	})
end

---------
--Corbels
---------

--Node will be called facade:<subname>_corbel
function facade.register_corbel(modname, subname, recipeitem, desc)
	register_node(modname, subname, "corbel", {
		description = desc .. " Corbel",
		tiles	   = { "" .. modname .. "_" .. subname .. ".png" },
		node_box	= {
			type  = "fixed",
			fixed = {
				{ -0.5, 0, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5, -0.5, 0, 0.5, 0.5, 0.5 },
				{ -0.1875, -0.3125, -0.3125, 0.1875, 0.5, 0 },
			},
		},
	})
end

--Node will be called facade:<subname>_corbel_corner
function facade.register_corbel_corner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "corbel_corner", {
		description = desc .. " Corbel Corner",
		tiles	   = { "" .. modname .. "_" .. subname .. ".png" },
		node_box	= {
			type  = "fixed",
			fixed = {
				{ -0.5, 0, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5, -0.5, 0, 0, 0.5, 0.5 },
				{ 0, -0.3125, -0.3125, 0.3125, 0.5, 0 },
			},
		},
	})
end

--Node will be called facade:<subname>_corbel_corner_inner
function facade.register_corbel_corner_inner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "corbel_corner_inner", {
		description = desc .. " Corbel Inner Corner",
		tiles	   = { "" .. modname .. "_" .. subname .. ".png" },
		node_box	= {
			type  = "fixed",
			fixed = {
				{ -0.5, 0, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5, -0.5, 0, 0.5, 0.5, 0.5 },
				{ 0, -0.3125, -0.3125, 0.3125, 0.5, 0 },
				{ -0.5, -0.5, -0.5, 0, 0.5, 0.5 },
			},
		},
	})
end


--------------------------
--- Carved Stones
--------------------------

--Node will be called facade:<subname>_carved_stone_a
function facade.register_carved_stone_a(modname, subname, recipeitem, desc)
	register_node(modname, subname, "carved_stone_a", {
		description   = desc .. " Carved Stone A",
		tiles		 = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_carved_stone_a.png"
		},
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.4375, 0.5, 0.5, 0.5 },
				{ -0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375 },
				{ -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
				{ -0.4375, -0.375, -0.5, -0.3125, 0.375, -0.4375 },
				{ -0.5, -0.375, -0.5, -0.3125, -0.25, 0.5 },
				{ -0.4375, 0.25, -0.5, 0.4375, 0.375, 0.5 },
				{ 0.3125, -0.125, -0.5, 0.4375, 0.25, 0.5 },
				{ -0.1875, -0.375, -0.5, 0.5, -0.25, 0.5 },
				{ -0.1875, -0.25, -0.5, -0.0625, 0.125, 0.5 },
				{ 0.0625, -0.125, -0.5, 0.3125, 0, 0.5 },
				{ -0.0625, 0, -0.5, 0.1875, 0.125, 0.5 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			},
		},
	})
end

--Node will be called facade:<subname>_carved_stone_a_corner
function facade.register_carved_stone_a_corner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "carved_stone_a_corner", {
		description   = desc .. " Carved Stone A Corner",
		tiles		 = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_carved_stone_a.png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_carved_stone_a.png"
		},
		node_box	  = {
			type  = "fixed",
			fixed = {
				{ -0.4375, -0.5, -0.4375, 0.5, 0.5, 0.5 },
				{ -0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375 },
				{ -0.5, -0.5, -0.5, 0.5, -0.4375, 0.5 },
				{ -0.4375, -0.375, -0.5, -0.3125, 0.375, -0.4375 },
				{ -0.5, -0.375, -0.5, -0.3125, -0.25, 0.1875 },
				{ -0.4375, 0.25, -0.5, 0.4375, 0.375, 0.5 },
				{ 0.3125, -0.125, -0.5, 0.4375, 0.25, 0.5 },
				{ -0.1875, -0.375, -0.5, 0.5, -0.25, 0.5 },
				{ -0.1875, -0.25, -0.5, -0.0625, 0.125, 0.5 },
				{ 0.0625, -0.125, -0.5, 0.3125, 0, 0.5 },
				{ -0.0625, 0, -0.5, 0.1875, 0.125, 0.5 },
				{ -0.5, 0.4375, -0.5, 0.5, 0.5, 0.5 },
				{ -0.5, -0.125, -0.4375, 0.5, 0.375, -0.3125 },
				{ -0.5, 0.25, -0.3125, 0.5, 0.375, 0.4375 },
				{ -0.5, -0.375, 0.3125, 0.4375, 0.375, 0.4375 },
				{ -0.5, -0.375, 0.3125, 0.4375, -0.25, 0.5 },
				{ -0.5, -0.125, -0.3125, 0.4375, 0, -0.0625 },
				{ -0.5, 0, -0.1875, 0.4375, 0.125, 0.1875 },
				{ -0.5, -0.25, 0.0625, 0.4375, 0.125, 0.1875 },
			},
		},
		selection_box = {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 },
			},
		},
	})
end


--------------------------
--- RGSpro Facia
--------------------------

--Node will be called facade:<subname>_rgspro
function facade.register_rgspro(modname, subname, recipeitem, desc)
	register_node(modname, subname, "rgspro", {
		description = desc .. " RGSpro",
		tiles	   = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png"
		},
		node_box	= {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 },
				{ -0.5, -0.3125, 0.25, 0.5, 0.5, 0.5 },
				{ -0.5, -0.125, 0.125, 0.5, 0.5, 0.5 },
			},
		},
	})
end

--Node will be called facade:<subname>_rgspro_inner_corner
function facade.register_rgspro_inner_corner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "rgspro_inner_corner", {
		description = desc .. " RGSpro Inner Corner",
		tiles	   = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png"
		},
		node_box	= {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 },
				{ -0.5, -0.3125, 0.25, 0.5, 0.5, 0.5 },
				{ -0.5, -0.125, 0.125, 0.5, 0.5, 0.5 },
				{ 0.375, -0.5, -0.5, 0.5, 0.5, 0.375 },
				{ 0.25, -0.3125, -0.5, 0.5, 0.5, 0.25 },
				{ 0.125, -0.125, -0.5, 0.5, 0.5, 0.125 },
			},
		},
	})
end


--Node will be called facade:<subname>_rgspro_outer_corner
function facade.register_rgspro_outer_corner(modname, subname, recipeitem, desc)
	register_node(modname, subname, "rgspro_outer_corner", {
		description = desc .. " RGSpro Outer Corner",
		tiles	   = {
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png",
			"" .. modname .. "_" .. subname .. ".png^facade_rgspro.png"
		},
		node_box	= {
			type  = "fixed",
			fixed = {
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 },
				{ -0.5, -0.3125, 0.25, 0.5, 0.5, 0.5 },
				{ -0.5, -0.125, 0.125, 0.5, 0.5, 0.5 },
				{ -0.625, -0.5, 0.375, -0.5, 0.5, 1.5 },
				{ -0.75, -0.3125, 0.25, -0.5, 0.5, 1.5 },
				{ -0.875, -0.125, 0.125, -0.5, 0.5, 1.5 },
			},
		},
	})
end


--------------------------
--- Corner Bricks
--------------------------

--Node will be called facade:<subname>_corner_bricks
function facade.register_corner_bricks(modname, subname, recipeitem, desc)
	local brick_exists = (
			minetest.registered_nodes[("%s:%s_brick"):format(modname, subname)] or
			minetest.registered_nodes[("%s:%sbrick"):format(modname, subname)]
	)

	if brick_exists then
		register_node(modname, subname, "corner_bricks", {
			description = desc .. " Corner Bricks",
			tiles	   = { "" .. modname .. "_" .. subname .. "_brick.png" },
			node_box	= {
				type  = "fixed",
				fixed = {
					{ -0.5625, -0.5, 0.4375, -0.5, 0, 1 },
					{ -0.5, -0.5, 0.4375, 0, 0, 0.5 },
					{ -0.5625, 0, 0.5, -0.5, 0.5, 1.5 },
					{ -0.5625, 0, 0.4375, 0.5, 0.5, 0.5 },
				},
			},
		})
	end
end


--------------------------
--Register Nodes/Materials
--------------------------
function facade.register_facade_nodes(modname, subname, recipeitem, desc)
	facade.register_bannerstone(modname, subname, recipeitem, desc)
	facade.register_bannerstone_corner(modname, subname, recipeitem, desc)
	facade.register_centerstone(modname, subname, recipeitem, desc)
	facade.register_column(modname, subname, recipeitem, desc)
	facade.register_column_corner(modname, subname, recipeitem, desc)
	facade.register_corbel(modname, subname, recipeitem, desc)
	facade.register_corbel_corner(modname, subname, recipeitem, desc)
	facade.register_corbel_corner_inner(modname, subname, recipeitem, desc)
	facade.register_carved_stone_a(modname, subname, recipeitem, desc)
	facade.register_carved_stone_a_corner(modname, subname, recipeitem, desc)
	facade.register_rgspro(modname, subname, recipeitem, desc)
	facade.register_rgspro_inner_corner(modname, subname, recipeitem, desc)
	facade.register_rgspro_outer_corner(modname, subname, recipeitem, desc)
	facade.register_corner_bricks(modname, subname, recipeitem, desc)

	if wehavechisels then
		-- register all nodes with mychisel mod to use them without creative priv
		chisel.register_node("facade", subname, recipeitem, "bannerstone")
		chisel.register_node("facade", subname, recipeitem, "bannerstone_corner")
		chisel.register_node("facade", subname, recipeitem, "centerstone")
		chisel.register_node("facade", subname, recipeitem, "column")
		chisel.register_node("facade", subname, recipeitem, "column_corner")
		chisel.register_node("facade", subname, recipeitem, "corbel")
		chisel.register_node("facade", subname, recipeitem, "corbel_corner")
		chisel.register_node("facade", subname, recipeitem, "corbel_corner_inner")
		chisel.register_node("facade", subname, recipeitem, "carved_stone_a")
		chisel.register_node("facade", subname, recipeitem, "carved_stone_a_corner")
		chisel.register_node("facade", subname, recipeitem, "rgspro")
		chisel.register_node("facade", subname, recipeitem, "rgspro_inner_corner")
		chisel.register_node("facade", subname, recipeitem, "rgspro_outer_corner")
		chisel.register_node("facade", subname, recipeitem, "corner_bricks")
	end
end

if wehavechisels then chisel.add_mod("facade", 14) end								-- register the total number of different designs in this mod with mychisel

-- Register the nodes made from compatible materials
dofile(minetest.get_modpath("facade") .. "/materials.lua")

-- Add a dedicated machine to produce the facade shapes
dofile(minetest.get_modpath("facade") .. "/shaper.lua")
