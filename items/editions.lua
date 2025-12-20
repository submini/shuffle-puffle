SMODS.Edition {
    key = 'phosphorescent',
    shader = 'sp_phosphorescent',
    config = {
        extra = {
            mult0 = 10,
            xchips0 = 3
        }
    },
    in_shop = true,
    weight = 0.3,
    extra_cost = 4,
    apply_to_float = true,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Phosphorescent',
    },
    pools = {
        ["Joker"] = true,
    },
    sound = { sound = "sp_e_phosphorescent", per = 1, vol = 0.4 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                mult = 10, colour = G.C.DARK_EDITION,
                extra = {
                    x_chips = 3,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}

SMODS.Edition {
    key = 'aetherescent',
    shader = 'sp_aetherescent',
    config = {
        extra = {
            chips0 = 20,
            mult0 = 10,
            xmult0 = 1.1
        }
    },
    in_shop = true,
    pools = {
        ["Joker"] = true,
    },
    weight = 0.7,
    extra_cost = 7,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Aetherescent',
    },
    sound = { sound = "sp_e_aetherescent", per = 1, vol = 0.3 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = 20, colour = G.C.DARK_EDITION,
                extra = {
                    mult = 10, colour = G.C.DARK_EDITION,
                    extra = {
                        Xmult = 1.1, colour = G.C.DARK_EDITION,
                    }
                }
            }
        end
    end
}

SMODS.Edition {
    key = 'iridescent',
    shader = 'sp_iridescent',
    config = {
    },
    in_shop = false,
    weight = 0.1,
    extra_cost = 10,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Iridescent',
    },
    pools = {
        ["Joker"] = true,
    },
    sound = { sound = "sp_e_iridescent", per = 1, vol = 0.4 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local coin_flip = pseudorandom('iridescent_flip') > 0.5
            
            if coin_flip then
                return {
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Added Tarot!", colour = G.C.PURPLE})
                        return true
                    end
                }
            else
                return {
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Catarot', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Added Catarot!", colour = G.C.SP_CATAROTPINK})
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Edition {
    key = 'prismatic',
    shader = 'sp_prismatic',
    config = {
        extra = {
            chips0 = 42,
            mult0 = 9,
            xmult0 = 1.2
        }
    },
    in_shop = true,
    weight = 0.89,
    extra_cost = 10,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Prismatic',
    },
    pools = {
        ["Joker"] = true,
    },
    sound = { sound = "sp_e_prismatic", per = 1, vol = 0.4 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = 42, colour = G.C.DARK_EDITION,
                extra = {
                    mult = 9, colour = G.C.DARK_EDITION,
                    extra = {
                        Xmult = 1.2,
                        colour = G.C.DARK_EDITION,
                    }
                }
            }
        end
    end
}

SMODS.Edition {
    key = 'wooden',
    shader = 'sp_wooden',
    config = { card_limit = 2 },
    in_shop = true,
    weight = 0.5,
    extra_cost = 9,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Wooden',
    },
    pools = {
        ["Joker"] = true,
        ["Consumable"] = true,
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.card_limit } }
    end,
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
}

SMODS.Edition {
    key = 'grainy',
    shader = 'sp_grainy',
    config = {},
    in_shop = true,
    weight = 0.4,
    extra_cost = 7,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Grainy',
    },
    pools = {
        ["Joker"] = true,
    },
    sound = { sound = "sp_e_grainy", per = 1, vol = 1 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                Xmult = pseudorandom('RANGE:1|3', 1, 3), colour = G.C.DARK_EDITION,
                extra = {
                    x_chips = pseudorandom('RANGE:1|15', 1, 15),
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end
}

SMODS.Edition {
    key = 'deepfried',
    shader = 'sp_deepfried',
    config = {},
    in_shop = true,
    weight = 0.2,
    extra_cost = 11,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        label = 'Deep Fried',
    },
    pools = {
        ["Joker"] = true,
    },
    sound = { sound = "sp_e_deepfried", per = 1, vol = 1 },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                e_mult = 1.5
            }
        end
    end
}