SMODS.Rarity {
    key = "unfair",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.02,
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
    key = "h_common",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.70,
    badge_colour = HEX('009efe'),
    text_colour = HEX('ffffff'),
    loc_txt = {
        name = "H"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "h_uncommon",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.25,
    badge_colour = HEX('5eb892'),
    text_colour = HEX('ffffff'),
    loc_txt = {
        name = "H"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "h_rare",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.05,
    badge_colour = HEX('fd5f56'),
    text_colour = HEX('ffffff'),
    loc_txt = {
        name = "H"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "h_legendary",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.00,
    badge_colour = HEX('945add'),
    text_colour = HEX('ffffff'),
    loc_txt = {
        name = "H"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}