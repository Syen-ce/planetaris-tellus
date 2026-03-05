data.extend({
    {
		type = "bool-setting",
		name = "tellus-packs-for-aquilo",
		setting_type = "startup",
		default_value = true,
		order = "a-b-a",
	},
	{
		type = "bool-setting",
		name = "tellus-packs-for-promethium",
		setting_type = "startup",
		default_value = true,
		order = "a-b-a",
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

