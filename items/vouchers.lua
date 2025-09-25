SMODS.Voucher {
    key = "expansionpermit",
    loc_txt = {
        name = "Expansion Permit",
        text = {
            "{C:attention}+1{} booster slot",
            "available in shop"
        }
    },
    atlas = "expansionpermit", -- or your custom atlas
    pos = { x = 0, y = 0 }, -- position in atlas
    cost = 10,
    config = { extra = 1 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card and card.ability.extra or self.config.extra } }
    end,

    redeem = function(self, card)
        SMODS.change_booster_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-(card.ability.extra or self.config.extra))
    end,
}

SMODS.Voucher {
    key = "prestigepermit",
    loc_txt = {
        name = "Prestige Permit",
        text = {
            "{C:attention}+1{} booster slot",
            "available in shop"
        }
    },
    atlas = "expansionpermit", -- or your custom atlas
    pos = { x = 0, y = 0 }, -- position in atlas
    cost = 10,
    config = { extra = 1 },
    requires = "v_sp_expansionpermit",

    loc_vars = function(self, info_queue, card)
        return { vars = { card and card.ability.extra or self.config.extra } }
    end,

    redeem = function(self, card)
        SMODS.change_booster_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_booster_limit(-(card.ability.extra or self.config.extra))
    end,
}
