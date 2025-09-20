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
