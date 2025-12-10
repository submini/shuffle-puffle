SMODS.Voucher {
    key = "expansionpermit",
    atlas = "expansionpermit",
    pos = { x = 0, y = 0 }, 
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
    atlas = "prestigepermit", 
    pos = { x = 0, y = 0 },
    cost = 10,
    config = { extra = 1 },
    requires = {"v_sp_expansionpermit"},

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
    key = 'polydactyly',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 1,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'polydactyly',
    redeem = function(self, card)
        SMODS.change_play_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
       SMODS.change_play_limit(-(card.ability.extra or self.config.extra))
    end,
}

SMODS.Voucher {
    key = 'hyperdactyly',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 1,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    requires = {"v_sp_polydactyly"},
    --atlas = 'hyperdactyly',
    redeem = function(self, card)
        SMODS.change_play_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
       SMODS.change_play_limit(-(card.ability.extra or self.config.extra))
    end,
}

SMODS.Voucher {
    key = 'fractalfingers',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 2,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    requires = {"v_sp_polydactyly", "v_sp_hyperdactyly"},
    --atlas = 'hyperdactyly',
    redeem = function(self, card)
        SMODS.change_play_limit(card.ability.extra or self.config.extra)
    end,

    remove_from_deck = function(self, card, from_debuff)
       SMODS.change_play_limit(-(card.ability.extra or self.config.extra))
    end,
}

SMODS.Voucher {
    key = 'money_forest',
    --atlas = 'moneyforest',
    pos = { x = 0, y = 0 },
    config = { extra = { cap = 500 } },
    unlocked = true,
    discovered = false,
    cost = 20,
    no_collection = false,
    can_repeat_soul = false,
    requires = { 'v_seed_money', 'v_money_tree' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cap } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.interest_cap = card.ability.extra.cap
                return true
            end
        }))
    end,
}

SMODS.Voucher {
    key = 'felinemerchant',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 2.4,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'felinemerchant',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.catarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.catarot_rate = G.GAME.catarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'felinetycoon',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 8,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'felinetycoon',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
    requires = {'v_sp_felinemerchant'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.catarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.catarot_rate = G.GAME.catarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'cat_astrophe',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 14,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'cat_astrophe',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
    requires = {'v_sp_felinemerchant', 'v_sp_felinetycoon'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.catarot_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.catarot_rate = G.GAME.catarot_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'parallaxpass',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 2.4,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'parallaxpass',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.exoplanet_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.exoplanet_rate = G.GAME.exoplanet_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'orbitalsyndicate',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 8,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'orbitalsyndicate',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
    requires = {'v_sp_parallaxpass'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.exoplanet_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.exoplanet_rate = G.GAME.exoplanet_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'galacticmonopoly',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 14,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'galacticmonopoly',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
    requires = {'v_sp_parallaxpass', 'v_sp_orbitalsyndicate'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.exoplanet_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.exoplanet_rate = G.GAME.exoplanet_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'fortuneswhisper',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 2.4,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'fortuneswhisper',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.lenormand_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.lenormand_rate = G.GAME.lenormand_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'riddlecascade',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 8,
    },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'riddlecascade',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
    requires = {'v_sp_fortuneswhisper'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.lenormand_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.lenormand_rate = G.GAME.lenormand_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'oracleoverload',
    pos = { x = 0, y = 0 },
    config = { 
        extra = 14,
    },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'oracleoverload',
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
    requires = {'v_sp_fortuneswhisper', 'v_sp_riddlecascade'},
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.lenormand_rate = 4 * (card.ability.extra or self.config.extra)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
         G.E_MANAGER:add_event(Event({
                func = function()
                 G.GAME.lenormand_rate = G.GAME.lenormand_rate / (card.ability.extra or self.config.extra)
                 return true
                end
          }))
    end,
}

SMODS.Voucher {
    key = 'expiredvoucher',
    pos = { x = 0, y = 0 },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'expiredvoucher',
    redeem = function(self, card)
        -- Does nothing hahhahahahahahahahahaa :P
    end,
}

SMODS.Voucher {
    key = 'doubledowner',
    pos = { x = 0, y = 0 },
    cost = 10,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'doubledowner',
    requires = {'v_sp_expiredvoucher'},
    redeem = function(self, card)
        SMODS.change_voucher_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
    end,
}

SMODS.Voucher {
    key = 'tripletroper',
    pos = { x = 0, y = 0 },
    cost = 20,
    unlocked = true,
    discovered = false,
    no_collection = false,
    can_repeat_soul = false,
    --atlas = 'tripletroper',
    requires = {'v_sp_expiredvoucher', 'v_sp_doubledowner'},
    redeem = function(self, card)
        SMODS.change_voucher_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
    end,
}