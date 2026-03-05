data:extend ({
    {
    type = "tips-and-tricks-item",
    name = "tellus-briefing",
    category = "space-age",
    tag = "[planet=tellus]",
    indent = 0,
    order = "p-tellus-a",
    trigger = {
        type = "research",
        technology = "planet-discovery-tellus"
    },
    skip_trigger = {
        type = "or",
        triggers = {
            {
                type = "change-surface",
                surface = "tellus"
            },
        }
    },
    simulation = {
        init_update_count = 200,
        planet = "tellus",
        mute_wind_sounds = false,
        init =
        [[
            game.simulation.camera_position = {0, 1.5}
            require("__core__/lualib/story")

            for x = -11, 10, 1 do
            for y = -4, 6 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "wetland-cyan-slime"}}
            end
            end
            
            for k, position in pairs ({
                {-1, 7},{-1, 8},
                {0, 5},{0, 6},{0, 7},{0, 8},
                {1, 3},{1, 4},{1, 5},{1, 6},{1, 7},
                {1, -3},{1, -4},{1, -5},{1, -6},
                {0, -4},{0, -5},{0, -6}}) do
            game.surfaces[1].set_tiles{{position = position, name = "lowland-cyan-blubber"}}
            end
            

            for x = 2, 10, 1 do
            for y = -10, 10 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "lowland-cyan-blubber"}}
            end
            end

            for x = 7, 10, 1 do
            for y = -10, 10 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "midland-purple-bark"}}
            end
            end

            for k, position in pairs ({
                {6, 0},{6, -1},{6, -2},{6, -3}
                }) do
            game.surfaces[1].set_tiles{{position = position, name = "midland-purple-bark"}}
            end

             for k, position in pairs ({
                {-8, 0},{-9, 0},{-10, 0},{-11, 0},
                {-7, 1},{-8, 1},{-9, 1},{-10, 1},{-11, 1},
                {-7, 2},{-8, 2},{-9, 2},{-10, 2},{-10, 2},
                {-6, 3},{-7, 3},{-8, 3},{-9, 3},{-10, 3},{-11, 3},
                {-5, 4},{-6, 4},{-7, 4},{-8, 4},{-9, 4},{-10, 4},{-11, 4},
                {-5, 5},{-6, 5},{-7, 5},{-8, 5},{-9, 5},{-10, 5},{-11, 5},
                {-4, 6},{-5, 6},{-6, 6},{-7, 6},{-8, 6},{-9, 6},{-10, 6},{-11, 6}
                }) do
            game.surfaces[1].set_tiles{{position = position, name = "wetland-tellus-brown-slime"}}
            end

            for k, position in pairs ({
                {-12, -5},{-11, -5},{-10, -5},{-9, -5},{-9, -5},{-8, -5},
                {-12, -4},{-11, -4},{-10, -4},{-9, -4},{-9, -4},{-8, -4},
                {-12, -3},{-11, -3},{-10, -3},{-9, -3},{-9, -3},
                {-12, -2},{-11, -2},{-10, -2},{-9, -2},{-9, -2}}) do
            game.surfaces[1].set_tiles{{position = position, name = "wetland-tellus-dead-skin"}}
            end

            local create_list = {}
                for k, position in pairs ({{-3, 2}}) do
                table.insert(create_list, { name = "green-lettuce-lichen-water-6x6", position = position, amount = 1})
                end
                for k, position in pairs ({{-8, 3},{-10, 5},{-10, 4},{-7, 6},{-8, 4}}) do
                table.insert(create_list, { name = "green-lettuce-lichen-water-1x1", position = position, amount = 1})
                end
                for k, position in pairs ({{-4, -1},{-9, -2},{-6, -2},{-6, -3},{-9, -1},{-10, -4},{-9, -3},{-7, -2},{-6, -4}}) do
                table.insert(create_list, { name = "green-bush-mini", position = position, amount = 1})
                end
                for k, position in pairs ({{-3, -1},{-5, 1}}) do
                table.insert(create_list, { name = "cyan-lettuce-lichen-cups-3x3", position = position, amount = 1})
                end
                for k, position in pairs ({{-7, 5}}) do
                table.insert(create_list, { name = "tellus-spawner-slime", position = position, amount = 1})
                end
                for k, position in pairs ({{3, 0},{2, -1},{2, -2}}) do
                table.insert(create_list, { name = "blue-cup", position = position, amount = 1})
                end
                for k, position in pairs ({{3, -3},{4, -1},{5, 2},{8, 5}}) do
                table.insert(create_list, { name = "knobbly-roots", position = position, amount = 1})
                end
                for k, position in pairs ({{6, 2},{5, 1},{5, 1},{3, 5},{2, 4},{3, 7},{7, 5},{8, 4},{9, 6}}) do
                table.insert(create_list, { name = "brown-cup", position = position, amount = 1})
                end
                for k, position in pairs ({{3, 5}}) do
                table.insert(create_list, { name = "grey-cracked-mud-decal", position = position, amount = 1})
                end
            game.surfaces[1].create_decoratives{decoratives = create_list}

            game.surfaces[1].create_entity{name = "tellus-spawner", position = {-7, 5}}
            game.surfaces[1].create_entity{name = "tellus-water-cane", position = {-5, -2}}
            game.surfaces[1].create_entity{name = "tellus-water-cane", position = {-7, -3}}
            game.surfaces[1].create_entity{name = "tellus-water-cane", position = {-10, -1}}
            game.surfaces[1].create_entity{name = "tellus-water-cane", position = {-10, -4}}
            game.surfaces[1].create_entity{name = "planetaris-magnesium-stromatolite", position = {-1, -1}}
            game.surfaces[1].create_entity{name = "planetaris-magnesium-stromatolite", position = {-2, 0}}
            game.surfaces[1].create_entity{name = "mushell", position = {8, -1}, tick_grown = 1}
            game.surfaces[1].create_entity{name = "medium-wasp", position = {-5, 5}, direction = southeast}

            local story_table =
            {
            {
                {
                name = "start",
                action = function() game.speed = 1 end
                },
                {
                condition = story_elapsed_check(17),
                action = function() game.speed = 10 end
                },
                {
                condition = story_elapsed_check(290),
                action = function() game.speed = 1 end
                },
                {
                name = "continue",
                action = function() game.speed = 1 end
                },
                {
                action = function() story_jump_to(storage.story, "continue") end
                }
            }
            }
            tip_story_init(story_table)
        ]]
        }
    },
    {
    type = "tips-and-tricks-item",
    name = "tellus-bioassembler",
    category = "space-age",
    tag = "[entity=planetaris-bioassembler]",
    indent = 1,
    order = "p-tellus-c",
    trigger = {
        type = "research",
        technology = "planetaris-bioassembler"
    },
    simulation = {
        init_update_count = 200,
        planet = "tellus",
        mute_wind_sounds = true,
        hide_health_bars = false,
        init =
        [[
        game.simulation.camera_position = {0, 1.5}
        game.simulation.camera_alt_info = true
        game.forces.player.recipes["planetaris-chloroplast-processing"].enabled = true

        game.surfaces[1].create_entities_from_blueprint_string
        {
        string = "0eNq9mttyozgQQP9Fz3gKXYFU7ZdMTbmwLSeqwsBKYna8Kf/7CjKxcxFJd1dm8xJsw9GN7taxeWS7brKjd31kd4/M7Yc+sLvvjyy4+77t5vf69mTZHTu2IW6ib/swDj5udraL7FIw1x/sL3bHLz8KZvvoorNPgOXFedtPp5316YTiGeT6o+vTR5vRjZYVbBxCumro57YSSZpvumBndrepym86tfD31Hbp9HRlZ+9tf2j9mRVXyjbYGF1/H150deza3sbWu7DZP3SDH8aHc9fNTVm/T/1q7+3SoWhP6Z02Tn5+XRbsNBzm69u46WwaLrtcincDEUWmGT8M8aOhmDoNJQOTa7DN0XVdOuMjZrNMz8F5u386QWVaUNcWwrQLsV3OfE9tnqd8ZcIzZH0l2y71wLv9xvbW35836Way/tjuM6ur+CcNFWw3HY/Wb4P7d1mV61+mCwY0OFPhB1eRVtnkV7kmwao8rCHBVB423/QEml6hcRJNrNBokSZXaJJEK1doikTjKzRNoemVnMINidas0EiRoFcigZNCQa+EAifFgl65e8UtFnK1LpMzr0QFycSCv+a7Plgfszm+XifPUZFqQ7ruqcw+199ivfh1c2vB2gN7mf76wZ/auSjuh9PYpio4pD6yv9hcyKdgt9dGop9sbjgCN12KI6dLIvklkq+QfInkayRfIPkGyddIfoXkKyS/RvIrJL9B8g2OL5HpQiHTheRIfo3kI+NXI+NL3uLX/hq9DWHTDe0hl++0WAWnTfp5fLKGcYq5nZpU781i/2BDbghvQxihFt6ehp92O/VPedEeti7pw3N6zPVLg/vFb7eG/LJ+Hdsu2Ne14uMKcfSTi0s9mGYZ1Bkfeql72TEb8JoL/mrE2TUfpri26MjkJOSbGf7s5kUmJyGQfGRyEhrHV8jkJBSSj0xOokLykclJGCQfubkQDZKP3FyIGslHbi4kR/KRmwtZIvnI+JXI+FXI+JXI+FUNeC//QWRxkftaJavkOze0IdjT7pMvhbLpNB278YPMP/phn3J1Kins+eTtO1HIdZWTjUlAZlkLgjGJrzKmUxseYMZUXKG3Dqd5cN38ReNXOpeWZOeCTbgiOxeMr8nOBeMbsnPB+BXZuWD8muxcMH5Ddi4Q35Rk54LxOdm5YHxBdi4YX5KdC8ZXeOcSBOcymuJc4o87lzEU5yr/B+fqp+hd6m24CRYvCYZlKrxhlRTDMjXZsErQrdqQDQvEr0qyYcH4nGxYML4gGxaML8mGBeMrsmHB+JpsWDC+IRsWjF+RDQvGr8mGBeM3ZMMC8WvsrzHI+K2x7oKM3xoZvxIZvzUyfiUyfmsFdq8bmb8l15+o18uy+HWaVGuyl8LmBpsbkLmnrsiaB+PXZM2D8Ruy5oH4TUnWPBifkzUPxhdkzYPxJVnzYHxF1jwYX5M1D8Y3ZM2D8Suy5sH4NV7zSoLmNQ1F88o/rnmLOQEe/BK/B68E/MEvXnLUE3M4tkA9sLbOToXwn7SUc1X9rgpdmEL/KJajuf/zsVmOxXI8z9ftk+X/788SZ57rBL89Blqwn6m4Lr3RRjSqaXQtSq0Uv1z+A+BC2+s=",
        position = {6, -1}
        }
        ]]
        }
    },
    {
    type = "tips-and-tricks-item",
    name = "tellus-roots",
    category = "space-age",
    tag = "[item=planetaris-root]",
    indent = 1,
    order = "p-tellus-b",
    trigger = {
        type = "research",
        technology = "planetaris-roots"
    },
    simulation = {
        init_update_count = 200,
        planet = "tellus",
        mute_wind_sounds = true,
        init =
        [[
        require("__core__/lualib/story")
        game.simulation.camera_position = {0, 1.5}

        for x = -12, -10, 1 do
        for y = -10, 10 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "water"}}
        end
        end

        game.surfaces[1].create_entities_from_blueprint_string
        {
        string = "0eNq1meFy4jgMgN/Fv51OnNiOw6t0GCaAgcyGhLOdve12ePdzaEs5sHCs2e2PlpLkk2RLsqS8k3U36pNpe0cW76TdDL0li9d3Ytt933TTd31z1GRBdo11mTNNb0+Dcdlad46cKWn7rf5FFuxMA8+cuqbXrjGtzcww3N5fnJeU6N61rtUfAi//vK368bjWxgPpF8SOa+sa1w49oeQ02Pby0QvxmDqn5I0sMlZ59D9j03mEf6TTe91vG/NGJrXuyMWVrDu9cabdZLrXZv+W+UXQZtdsdEBQcSNo2xr/4OWiCoulZD3udtqsbPvbS2L59SegUDnLVMZUuq38il6P3Q9voNXG2/hIV9WL+MTzFzHLxoA48b202gvbtb2/mm0O2rqnIsVF5NcDK6uda/u9nW40+jj81KvRX+u85nq7ap0++kvOjPoc0EFedbgqcGpPwS29M3mmkVWSkeIqpPyDRqrZ+yrv5N/sK59tck2fZYFnOzsJDQBZjiYWAJElbUv9V7aFFbP3RcH7MlFmbgz7zh13uTbzOnchyTdu/+gRIREcEvGUDW2TQG88A4gSTcwBYoWyGNJPoWiQbuhQrMPAAh2JCgAyjL2QdgUGBmlWYk2tACDHAiUAFBhzIe3QgSEAYIUFcgAIhkZ2Go+nZzbLIK/GLB+gXIkODODMKxkWCOTSEgyOzLrBNHuduab/EbCd3ZKjJ0CJjhsgJZbouAGyYpkSN3kM9h034cJRfS0fBPiOk2G3s4fBaMCfVX5DuqsBQuCEo0SVESXr5MpBFc+RPAeRbsj2Zhj77ZMKed4a8ITjRfGIwgXSDyEeNlCAOOEctaA1tKCh4OYpoRNxfC4RYQixqtSzoUwwOqUmExFFUw6diEOKPIEVcUaRUofJCCulDKsjrDKBpSKshN6E5RHvFSIFFnFfIVNgkVwtqhRYJEsLlQKLOL+oU2AR75f53NENy6v/5biZ3bJkyWceyyWUTVVIAvZEAUo8iT1RgBpUYisvoEiW2HYeaDEktmcBGiqJbVmAnkoqJA9oSSW2nQf65QrbtEDzhgrbtEDjkKpImnYzljCYRZdfQPRV2GiBxp6VQM2OP+fT6TNKSj6+/XjD8pj6jqM96K7LrNZTIbnxBaX7GM4eh+10b+OyTjcX5a4vepZBy2TyRPrxRUPC4LPCBjYDMlmlkke3jwbMn6hXNWpcjfKEXdPZqCtsDt1gBv+FX8xjYw+37oDwB5XPe3/HP82ConxJyb9+fSetXxkVtKRiSV/9b+oTyfRx+kO9NLH0t04GTxt4faVJyU9v8kWekEXN61qoIhecs/P5P8K/jeY=",
        position = {10, 2}
        }

        local story_table =
        {
        {
            {
            name = "start",
            action = function() game.speed = 1 end
            },
            {
            condition = story_elapsed_check(17),
            action = function() game.speed = 10 end
            },
            {
            condition = story_elapsed_check(290),
            action = function() game.speed = 1 end
            },
            {
            name = "continue",
            action = function() game.speed = 1 end
            },
            {
            action = function() story_jump_to(storage.story, "continue") end
            }
        }
        }
        tip_story_init(story_table)
        ]]
        }
    },
})