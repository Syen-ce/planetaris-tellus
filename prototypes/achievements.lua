if not mods.pystellarexpedition then
    data:extend{
    {
        type = "research-with-science-pack-achievement",
        name = "research-with-bioengineering",
        order = "e[research]-a[research-with]-l[bioengineering]",
        science_pack = "planetaris-bioengineering-science-pack",
        icon = "__planetaris-tellus__/graphics/achievement/research-with-bioengineering.png",
        icon_size = 128
    },
    {
        type = "research-with-science-pack-achievement",
        name = "research-with-pathological",
        order = "e[research]-a[research-with]-m[pathological]",
        science_pack = "planetaris-pathological-science-pack",
        icon = "__planetaris-tellus__/graphics/achievement/research-with-pathologics.png",
        icon_size = 128
    }
}
end

data:extend{
    {
    type = "change-surface-achievement",
    name = "visit-tellus",
    order = "a[progress]-g[visit-planet]-j[tellus]",
    surface = "tellus",
    icon = "__planetaris-tellus__/graphics/achievement/visit-tellus.png",
    icon_size = 128,
    },
    {
    type = "build-entity-achievement",
    name = "is-it-alive",
    order = "a[progress]-e[energy-production]-e",
    to_build = "planetaris-incubator",
    icon = "__planetaris-tellus__/graphics/achievement/is-it-alive.png",
    icon_size = 128
   },
  {
    type = "group-attack-achievement",
    name = "buzz-buzz",
    order = "b[exploration]-i[it-stinks-and-they-do-like-it]-b[buzz-buzz]",
    amount = 1,
    entities =
    {
      "small-wasp",
      "medium-wasp",
      "big-wasp",
      "behemoth-wasp",
    },
    attack_type = "autonomous",
    allowed_without_fight = false,
    icon = "__planetaris-tellus__/graphics/achievement/buzz-buzz.png",
    icon_size = 128
  },
}