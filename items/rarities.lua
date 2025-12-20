SMODS.Rarity {
    key = "unfair",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.0005,
    badge_colour = HEX('ffbf00'),
    loc_txt = {
        name = "Unfair"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "exquisite",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ed7014'),
    loc_txt = {
        name = "Exquisite"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "epic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.03,
    badge_colour = HEX('ffaadf'),
    loc_txt = {
        name = "Epic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}