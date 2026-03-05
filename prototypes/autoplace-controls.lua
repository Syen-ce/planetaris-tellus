data:extend(
{
  {
    type = "autoplace-control",
    name = "tellus_stone",
    localised_name = {"", "[entity=stone] ", {"entity-name.stone"}},
    richness = true,
    order = "c-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "tellus_cliff",
    order = "c-z-b",
    category = "cliff"
  },
  {
    type = "autoplace-control",
    name = "tellus_water",
    order = "c-z-b",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "tellus_plants",
    order = "c-z-c",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "tellus_enemy_base",
    richness = false,
    order = "z",
    category = "enemy",
    can_be_disabled = false,
    related_to_fight_achievements = true
  }
}
)