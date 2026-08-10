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
        mods = {"planetaris_tellus"},
        mute_wind_sounds = true,
        hide_health_bars = false,
        init =
        [[
        game.simulation.camera_position = {0, 1.5}
        game.simulation.camera_alt_info = true
        game.forces.player.technologies["planetaris-chloroplast"].researched = true
        game.forces.player.technologies["planetaris-bioassembler"].researched = true


        game.surfaces[1].create_entities_from_blueprint_string
        {
        string = "0eNq9mmtv4joQhv+LP5tV4ksulfaXVBUKYKilkOTYzp7lVPz3Y8MWupDQmVHVfmpuz7x+nYkzQ97Yqh3N4GwX2NMbs+u+8+zp+Y15u+uaNu3rmr1hT2zb+LAIrun80LuwWJk2sCNnttuY3+wpP75wZrpggzVnwGnjsOzG/cq4eAJ/B9lua7t4aLF+NT4wzobex8v6LgWLqOqH5uzAnhZ5+UPHCP+MTRtPj1e2Zme6TeMOjF8oS29CsN3Op6ud2fe/zHKMx9pgnNksbTD7eGjbtN5wdt591vdHzdA2nQmNsz7qaXvXxx1xoFs32qRt3Y/JGZ1xtu836YImLFrTnIRfx3488rsRC8KI1TeMuBuDs1Grvw4vzwjjk5fxmd+DM94v2r7ZxCN348uzvyZ0Y51Znw8rzsJhSIx+DMOY7qi7OAofR1Hi6EscP658aE5X3sfIzzGKmXmaABf8UQ5NRLhJgI/jmMCXZLyC4CskXuDU12Q8SH26JVB8iZOf52Q+TL9A8hVSvyTzYfoVkq+R+jWZD9OPTd4Cqb8k82H6selbIvXXZD5Iv8Dmb4XTL3IyH6Yfm781Ur8k82H6kfkrMqR+TebD9CPzVyAXX1GS+TD9yPwVyOVX1GQ+SL+8yV/beePC1MubeLDy5mIKjUxdgVx6JTJ1BXJplPK+QBhsfEm9J18WLYkuEGbLnNdD26ZQxq2jsGZnTjVaLB7iniaMzpxfnm6rgslK4PqQ+BDH9X2so2zbTs72dUgSZJaeC/GQHe/WScEFiZbP0EoSLZuhVRSaqGdoNYlWTdNURqKVM7ScRCtmaIJE0zM0SaKpGZoi0eQMjZQLYiYXFCkXxEwuKFIuiJlcUKRcyGdyQU3mwsr2jfdmv/rkOTXZvIj/2+FBG2lw/dp4Hx/G7P3k5fXh3fVu37STvQj4snkVqG8FVn/3f97bOXyqE3SnKjWH9kMT14I+CmI/Werwjd4sL8jgRjOlHbsuI0syjV2XkSWTlmDvr8VMdf/K8on5M3eMN2bztdOhCMMpvmo4+8a/wobDL9Dr/MZptW16NflSQ7AlB7Jk1QWokZje7M+vdPBOosZWG9X8DTopvSLzCxC/JvNB1hfIboGocf4UOZkP8qcQZD7Mnw89+zae6Ox6YTrjdof4WIhJs23WE+WHzD65UzlbjdutcUtv/zuVDZe/KQ3IjoLMkHOkyXzYHBVkPmyOStDjQxJ+h0Bmt8yRztdkPsj5MiPzQc6XyOyWAudPKch8mD+SzIf5o0hPD/n4RkU9PEpsckvkFBVkPmyKSjIfNkXYFFdIf2oyH+RPlZH5sB8zsSmucf5UgsyH+SPJfJg/2MW5QPqjyXyYPwWZD/MHm78l0p+KzIf5U5P5IH9qbP4iC5Q6J/NB/tSCzIf5g81fZIFSKzIf5o8m82H+FOCPfVQ+a8zlYx/bzXzrU5f4OAUlToWPoyhxavDHZur2rfUrvjY7tVomP7/JKMKKbxCWU4SpbxAmQPVf6jJh20d5JlHs2dryhbN/4/2ZWoHPmmsea1b9wp/jdZqnAaSNtI+niGnjtPPPVrw4eRCJ109POftlnD8p0IWotRKqllmR5/J4/B/kYgME",
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
        mods = {"planetaris_tellus"},
        mute_wind_sounds = true,
        init =
        [[
        game.simulation.camera_position = {0, 1.5}

        for x = -12, -10, 1 do
        for y = -10, 10 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "water"}}
        end
        end

        game.surfaces[1].create_entities_from_blueprint_string
        {
        string = "0eNqtmW2TmyoUgP8Ln7WjIAL7V3Z2MibBxKlRC9jb3J3894umm+R2OUs4036ySh5eHziHfSfbftaT6QZHXt5JtxsHS15e34ntDkPTL++G5qTJC2kb63JnmsFOo3H5VveOXDLSDXv9i7yUlyzwm6lvBu0a09ncjONjeXp5y4geXOc6fa1w/c95M8ynrTYemH1Axra1x9HofJpPE8nINFr/q3FY6vEkUX7jGTn7B/mN+wr2ndG76/eSLq36A0xv4KmbdIBHH3kBAMuA7uVt1/e+xGckiyArCBlgVREWT2DxCKu+sbTOu6HtBv813x21/Yqm6DoRH+U3VjvXDQe7lDP6NP7Um9l/6502er/pnD75T87MOiPXt9cF8bkXp9kedd/nVuu9r383zsuqLYuMnMb9UrZxea+btXG3dfkW6pgA59CN+cF48D7QwTptpcn76P2ajLY278dmH1wg4nHgHrh+YbjztFowu2leDPpUjUqaJPm7D3WJmKS26a0OjecyB4/7BNjRW/XscutaNwA9K8vsq93nC3oVXs8lxQI5AGRYYA0AKyxQAECOBQJ7QlljgQoACiRQFABQYoElAFRYIA0DaYEFMgCINUUAplCsKQIwhWJNEYApFGuKAEyhWFOg05NiTRGAKRRrigRMoVhTJGAKxZoiAVMY1hQJmMKwpkjAFIY1RQKmMKwpEjCFYU2RgCkMa4qEQmqsKRIwhWFNUYApDGuKAkxhWFMUYEpVPB1uygIIN5f4KBpvViUmeF62ICB4rkKV3K2y89a6Zi36mVr+DmY98cfc9B7hf9Hrgx72jTkHm8+eT5BkGTkzqgoDg7JAnhLJ33CodGuN5GP51u7Yj2b0L/z6PDX2+JhzIZKuqgYXjnWjaQ46d83wPdBV+hhcxNeOSJiUWLZfPWRxva/VdLtcD9oczn6G/Ni1zS5wiSDZfV0+tFaGV2lGtnPbarOx3b96HdyPf6EG3TeO2xIJ32RIdku21mF7UhBeJF9w3GuqnpkgXiZMEIukYJxiYMBRyRkGBmwOvMLAoGsdjoEBxyOvETAo3eLwZUr4xu5OpEGexDQOCPe4Sm1clXBK1cVzp9THRv28hHWKItFrvBRF6hiMoTZEcR+Cv7wh1imaiVjvUjSLJYB1imYqBks41VQRgyU4pmJxS60SYLHzVhQJsNi9ukiwSMUu1kWCRSqmpEg4aFRMSVEln9hKgOG4DNXAnw06lPw/+Mn9TtRP7aRloZIDfiGS0FJB6LeM/OOHaYmWX31+wjPfaP6WvfpTwD+L9Xl5dX32pZdY2yPuf2HLyE8fba918poqXtFKsaIuS3a5/AcKDhAy",
        position = {10, 2}
        }

        ]]
        }
    },
})