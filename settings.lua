data.extend({
	{
		type = "bool-setting",
		name = "tellus-easy-not-damage-while-stop",
		setting_type = "startup",
		default_value = false,
		order = "a-b-a",
	},
	{
		type = "bool-setting",
		name = "tellus-easy-longer-spoiling",
		setting_type = "startup",
		default_value = false,
		order = "a-b-b",
	},
	{
		type = "bool-setting",
		name = "tellus-easy-spoiling-enemies",
		setting_type = "startup",
		default_value = false,
		order = "a-b-c",
	},
	{
		type = "bool-setting",
		name = "tellus-hard-disable-refresh",
		setting_type = "startup",
		default_value = false,
		order = "a-c-a",
	},
    {
		type = "bool-setting",
		name = "tellus-packs-for-aquilo",
		setting_type = "startup",
		default_value = true,
		order = "b-b-a",
	},
	{
		type = "bool-setting",
		name = "tellus-packs-for-promethium",
		setting_type = "startup",
		default_value = true,
		order = "b-b-a",
	},
	{
		type = "bool-setting",
		name = "tellus-no-enemies",
		setting_type = "startup",
		default_value = false,
		order = "b-b-b",
	},
	{
		type = "bool-setting",
		name = "hide-preserved-items",
		setting_type = "startup",
		default_value = false,
		order = "c-a",
	},
	{
		type = "bool-setting",
		name = "hide-preserved-recipes",
		setting_type = "startup",
		default_value = false,
		order = "c-a",
	}
})

if mods["celestial-weather"] then
	data.extend({
		{
		type = "bool-setting",
		name = "enable-tellus-weather",
		setting_type = "startup",
		default_value = true,
		order = "c-a-a",
		},
		{
		type = "double-setting",
		name = "tellus-dust-particle-speed",
		setting_type = "startup",
		default_value = 0.3,
		order = "c-b",
		},
		{
		type = "double-setting",
		name = "tellus-bugs-particle-amount",
		setting_type = "startup",
		default_value = 20,
		order = "c-c-a",
		},
		{
		type = "double-setting",
		name = "tellus-bugs-particle-speed",
		setting_type = "startup",
		default_value = 0.3,
		order = "c-c-b",
		},
	})
end

if mods["maraxsis"] then
	data.extend({
		{
		type = "bool-setting",
		name = "adjust-maraxsis",
		setting_type = "startup",
		default_value = true,
		order = "d-a",
		},
	})
end
