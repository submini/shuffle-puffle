SMODS.Seal {
    key = 'chartreuseseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            chips = 10,
            x_chips = 1.08,
            mult = 4,
            x_mult = 1.1,
            dollars = 1
        }
    },
    badge_colour = HEX('7FFF00'),
   loc_txt = {
        name = 'Chartreuse Seal',
        label = 'Chartreuse Seal',
        text = {
        [1] = 'Gives {C:blue}+10{} extra chips, {X:blue,C:white}X1.08{}',
        [2] = 'Chips, {C:red}+4{} Mult, {X:red,C:white}X1.1{} Mult, and',
        [3] = '{C:money}+$1{} when triggered'
    }
    },
    atlas = 'chartreuseseal',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { chips = card.ability.seal.extra.chips, x_chips = card.ability.seal.extra.x_chips, mult = card.ability.seal.extra.mult, x_mult = card.ability.seal.extra.x_mult, dollars = lenient_bignum(card.ability.seal.extra.dollars) }
        end
    end
}

SMODS.Seal {
    key = 'catseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 7
        }
    },
    badge_colour = HEX('E8A6BD'),
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
            HEX('fecb00'),
     }
        }
    }
    end,
    loc_txt = {
        name = 'Cat Seal',
        label = 'Cat Seal',
        text = {
        [1] = 'Creates a {V:1}Catarot{} card when',
        [2] = '{C:blue}played{} or {C:red}discarded{}, {C:green}1 in 7{}',
        [3] = 'chance for it to be a',
        [4] = '{V:2}Spectaclaw{} card instead',
        [5] = '{C:inactive}(Must have room){}'
    }
    },
    atlas = 'catseal',
    unlocked = true,
    discovered = true,
    no_collection = false,
    
    calculate = function(self, card, context)
        -- trigger on play or discard
        if (context.main_scoring and context.cardarea == G.play) or (context.discard and context.other_card == card) then
            -- only continue if there’s room
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        -- roll once: 1 in odds chance for Spectaclaw
                        local useSpectaclaw = SMODS.pseudorandom_probability(
                            card,
                            'catseal_odds',
                            1,
                            card.ability.seal.extra.odds,
                            'm_sp_catseal'
                        )

                        -- spawn either Catarot (default) or Spectaclaw (rare)
                        if useSpectaclaw then
                            SMODS.add_card{set = 'Spectaclaw', key_append = 'enhanced_card_spectaclaw'}
                        else
                            SMODS.add_card{set = 'Catarot', key_append = 'enhanced_card_catarot'}
                        end

                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Seal {
    key = 'navyseal',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('0A53A8'), -- navy-ish blue, tweak if you want
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
    loc_txt = {
        name = 'Navy Seal',
        label = 'Navy Seal',
        text = {
        [1] = 'Creates an {V:1}Exoplanet{} card when',
        [2] = '{C:blue}played{} or {C:red}discarded{},',
        [3] = '{C:inactive}(Must have room){}'
    }
    },
    atlas = 'navyseal',
    unlocked = true,
    discovered = true,
    no_collection = false,

    calculate = function(self, card, context)
        -- trigger on play or discard
        if (context.main_scoring and context.cardarea == G.play) or (context.discard and context.other_card == card) then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        -- always add Exoplanet
                        SMODS.add_card{set = 'Exoplanet', key_append = 'enhanced_card_exoplanet'}
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Seal {
    key = 'fazbearseal',
    pos = { x = 0, y = 0 },
    atlas = 'fazbearseal',
    config = {
        extra = {
            mult = 19,
            chips = 87
        }
    },
    badge_colour = HEX('d7925b'),
   loc_txt = {
        name = 'Fazbear Seal',
        label = 'Fazbear Seal',
        text = {
        [1] = '{C:red}+19{} Mult,',
        [2] = '{C:blue}+87{} extra chips'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { mult = card.ability.seal.extra.mult, chips = card.ability.seal.extra.chips }
        end
    end
}

SMODS.Seal {
    key = 'treeseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            chips = 15,
            mult = 5,
            dollars = 1
        }
    },
    badge_colour = HEX('54994f'),
   loc_txt = {
        name = 'Tree Seal',
        label = 'Tree Seal',
        text = {
        [1] = '{C:blue}+15{} extra chips,',
        [2] = '{C:red}+5{} Mult, {C:money}+$1{}'
    }
    },
    atlas = 'treeseal',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { chips = card.ability.seal.extra.chips, mult = card.ability.seal.extra.mult, dollars = lenient_bignum(card.ability.seal.extra.dollars) }
        end
    end
}