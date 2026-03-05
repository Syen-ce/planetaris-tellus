planetaris_root_cover_pictures = function()
  local layers =
  {
    north =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-cover-up.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        },
      }
    },
    east =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-cover-right.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        },
      }
    },
    south =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-cover-down.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        },
      }
    },
    west =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-cover-left.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        },
      }
    }
  }
  return layers
end

planetaris_pump_root_cover_pictures = function()
  local pump_layers =
  {
    north =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-cover-up.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(0, 4)
        },
      }
    },
    east =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-pump-cover-right.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(-11, 0)
        },
      }
    },
    south =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-ending-down.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(0, -5)
        },
      }
    },
    west =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-pump-cover-left.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(10, 0)
        },
      }
    }
  }
  return pump_layers
end

planetaris_underground_root_cover_pictures = function()
  local underground_root_layers =
  {
    north =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-cover-up.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(0, 11)
        },
      }
    },
    east =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-pump-cover-right.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(-11, 0)
        },
      }
    },
    south =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-ending-down.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(0, -5)
        },
      }
    },
    west =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/root/root-pump-cover-left.png",
        priority = "extra-high",
        width = 64,
        height = 64,
        scale = 0.5,
        shift = util.by_pixel(11, 0)
        },
      }
    }
  }
  return underground_root_layers 
end

planetaris_purifier_cover_pictures = function()
  local layers =
  {
    north =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/air-purifier/purifier-pipes-north-2.png",
        priority = "extra-high",
        width = 54,
        height = 36,
        scale = 0.45,
        shift = util.by_pixel(0, 13)
        },
      }
    },
    east =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/air-purifier/purifier-pipes-east-1.png",
        priority = "extra-high",
        width = 54,
        height = 72,
        scale = 0.45,
        shift = util.by_pixel(-25, 0)
        },
      }
    },
    south =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/air-purifier/purifier-pipes-south-1.png",
        priority = "extra-high",
        width = 56,
        height = 64,
        scale = 0.45,
        shift = util.by_pixel(0, -20)
        },
      }
    },
    west =
    {
      layers =
      {
        {
        filename = "__planetaris-tellus__/graphics/entity/air-purifier/purifier-pipes-west-1.png",
        priority = "extra-high",
        width = 44,
        height = 78,
        scale = 0.45,
        shift = util.by_pixel(25, 0)
        },
      }
    }
  }
  return layers
end