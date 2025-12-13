SMODS.Edition {
    key = 'gilded',
    shader = 'sp_gilded',
    config = {
        extra = {
            dollars0 = 2
        }
    },
    in_shop = false,
    weight = 0.1,
    extra_cost = 3,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Gilded',
        label = 'Gilded',
        text = {
            [1] = '{C:money}+$2{} when triggered'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        -- Playing cards: trigger when card scores
        if card.playing_card and (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) then
            return {
                func = function()
                    ease_dollars(2)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$2", colour = G.C.MONEY})
                    return true
                end
            }
        end
        
        -- Jokers: trigger during joker scoring
        if card.ability and card.ability.set == 'Joker' and context.cardarea == G.jokers and context.main_scoring then
            return {
                func = function()
                    ease_dollars(2)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$2", colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}

SMODS.Edition {
    key = 'phosphorescent',
    shader = 'sp_phosphorescent',
    config = {
    },
    in_shop = false,
    weight = 0.1,
    extra_cost = 6,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Phosphorescent',
        label = 'Phosphorescent',
        text = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
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
    weight = 0.7,
    extra_cost = 7,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Aetherescent',
        label = 'Aetherescent',
        text = {
            [1] = '{C:blue}+20{} Chips, {C:red}+10{} Mult',
            [2] = 'and {X:red,C:white}X1.1{} Mult'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = 20,
                extra = {
                    mult = 10,
                    extra = {
                        Xmult = 1.1
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
    in_shop = true,
    weight = 0.4,
    extra_cost = 10,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Iridescent',
        label = 'Iridescent',
        text = {
            [1] = '50% chance to create',
            [2] = '{C:attention}2{} random {C:dark_edition}Negative{} {C:tarot}Tarot{}',
            [3] = 'or {C:attention}1{} random {C:dark_edition}Negative{}',
            [4] = '{C:spectral}Spectral{} card'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            local coin_flip = pseudorandom('iridescent_flip') > 0.5
            
            if coin_flip then
                -- Create 2 negative tarots
                return {
                    func = function()
                        for i = 1, math.min(2, G.consumeables.config.card_limit - #G.consumeables.cards) do
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
                        
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        return true
                    end
                }
            else
                -- Create 1 negative spectral
                return {
                    func = function()
                        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.0,
                                func = function()
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
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
        name = 'Prismatic',
        label = 'Prismatic',
        text = {
            [1] = '{C:blue}+42{} Chips, {C:red}+9{} Mult,',
            [2] = '{X:red,C:white}X1.2{} Mult'
        }
    },
    unlocked = true,
    discovered = false,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = 42,
                extra = {
                    mult = 9,
                    extra = {
                        Xmult = 1.2
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
    weight = 0.2,
    extra_cost = 9,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Wooden',
        label = 'Wooden',
        text = {
            [1] = ''
        }
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