SMODS.Rarity {
    key = "unfair",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.05,
    badge_colour = HEX('ffbf00'),
    text_colour = HEX('000000'),
    loc_txt = {
        name = "Unfair"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "h",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.25,
    badge_colour = HEX('bc002d'),
    text_colour = HEX('ffffff'),
    loc_txt = {
        name = "H"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}
