SMODS.Joker{ --H
    key = "bigh",
    config = {
        extra = {
            Xmult = 12
        }
    },
    loc_txt = {
        ['name'] = 'H',
        ['text'] = {
            [1] = '{X:red,C:white}X12{} Mult if played hand',
            [2] = 'contains a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 18,
    rarity = "sp_h_rare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'bigh',
    pools = { ["H"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Joker{ --h
    key = "smallh",
    config = {
        extra = {
            xchips = 4.5
        }
    },
    loc_txt = {
        ['name'] = 'h',
        ['text'] = {
            [1] = '{X:blue,C:white}X4.5{} Chips if played hand',
            [2] = 'contains a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "sp_h_uncommon",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'smallh',
    pools = { ["H"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}

SMODS.Joker{ --H Building
    key = "hbuilding",
    config = {
        extra = {
            gainvalue = 7,
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'H Building',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+#1#{} Chips',
            [2] = 'if played hand contains a',
            [3] = '{C:attention}Straight{}, Chip gain increases',
            [4] = 'by {C:blue}+35{} Chips every time the',
            [5] = '{C:attention}Saturn{} {C:planet}planet card{} is used',
            [6] = '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "sp_h_common",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hbuilding',
    pools = { ["H"] = true },


    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_saturn
        return {vars = {card.ability.extra.gainvalue, card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                card.ability.extra.chips = (card.ability.extra.chips) + card.ability.extra.gainvalue
                return {
                    message = "Upgrade!",
                    extra = {
                        chips = card.ability.extra.chips,
                        colour = G.C.CHIPS
                        }
                }
            else
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_saturn' then
                return {
                    func = function()
                    card.ability.extra.gainvalue = (card.ability.extra.gainvalue) + 35
                    return true
                end,
                    message = "Upgrade!"
                }
            end
        end
    end
}

SMODS.Joker {
    key = "dancingh",
    config = {
        extra = {
            chance = 2,      -- base numerator
            odds = 13,       -- denominator
            levels = 1       -- how many levels to add
        }
    },
    loc_txt = {
        name = 'Dancing H',
        text = {
            [1] = '{C:green}#1# in #2#{} chance{} to',
            [2] = '{C:attention}level up played poker',
            [3] = 'hand{}, probability increases',
            [4] = 'by {C:attention}1{} for every other Joker',
            [5] = 'owned'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    pools = { ["H"] = true },
    pos = {x = 0, y = 0},
    display_size = {w = 71, h = 95},
    cost = 8,
    rarity = "sp_h_uncommon",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'dancingh',

    -- text variables
    loc_vars = function(self, info_queue, card)
        local other_jokers = 0
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card then
                    other_jokers = other_jokers + 1
                end
            end
        end

        local numerator = (card.ability.extra.chance or 2) + other_jokers
        local denominator = card.ability.extra.odds or 13

        return {vars = {numerator, denominator}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    -- main effect
    calculate = function(self, card, context)
    -- trigger before hand scoring starts
    if context.before and context.cardarea == G.jokers then
        local other_jokers = 0
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card then
                    other_jokers = other_jokers + 1
                end
            end
        end

        local numerator = (card.ability.extra.chance or 2) + other_jokers
        local denominator = (card.ability.extra.odds or 13)

        if SMODS.pseudorandom_probability(card, 'group_dancingh', numerator, denominator, 'j_sp_dancingh', false) then
            local target_hand = (context.scoring_name or "High Card")

            -- apply the level up BEFORE scoring
            SMODS.calculate_effect({
                level_up = card.ability.extra.levels,
                level_up_hand = target_hand
            }, card)

            card_eval_status_text(
                context.blueprint_card or card,
                'extra',
                nil,
                nil,
                nil,
                {message = localize('k_level_up_ex'), colour = G.C.RED}
            )
        end
    end
end
}

SMODS.Joker{ --Gordon Ramsay H
    key = "gordonramsayh",
    config = {
        extra = {
            multgain = 5.5,
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gordon Ramsay H',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+5.5{}',
            [2] = 'Mult when round starts,',
            [3] = 'Mult gain increases by',
            [4] = '{C:red}+24{} Mult for every card',
            [5] = 'eaten',
            [6] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}',
            [7] = '{C:inactive,s:0.8}(eaten = destroyed){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = "sp_h_uncommon",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'gordonramsayh',
    pools = { ["H"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multgain, card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + card.ability.extra.multgain
                    return true
                end,
                    message = "WHERE IS THE LAMB SAUCE??"
                }
        end
        if context.remove_playing_cards  then
                return {
                    func = function()
                    card.ability.extra.multgain = (card.ability.extra.multgain) + 24
                    return true
                end,
                    message = "WHAT ARE YOU??"
                }
        end
    end
}

SMODS.Joker{ --Lava Lamp H
    key = "lavalamph",
    config = {
        extra = {
            odds = 2,
            odds2 = 4,
            odds3 = 6,
            Xmult = 1.6,
            Xmult2 = 0.8,
            dollars = 12
        }
    },
    loc_txt = {
        ['name'] = 'Lava Lamp H',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance for {X:red,C:white}X1.6{} Mult,',
            [2] = '{C:green}1 in 4{} chance for {X:red,C:white}X0.8{} Mult,',
            [3] = '{C:green}1 in 6{} chance to give {C:money}$12{}',
            [4] = 'if played hand contains a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = "sp_h_uncommon",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'lavalamph',
    pools = { ["H"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                if SMODS.pseudorandom_probability(card, 'group_0_693c3e2e', 1, card.ability.extra.odds, 'j_modprefix_lavalamph', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
          end
                if SMODS.pseudorandom_probability(card, 'group_1_48ff97f0', 1, card.ability.extra.odds2, 'j_modprefix_lavalamph', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Xmult2}, card)
          end
                if SMODS.pseudorandom_probability(card, 'group_2_676b1888', 1, card.ability.extra.odds3, 'j_modprefix_lavalamph', false) then
              SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
          end
            end
        end
    end
}

SMODS.Joker{ --H of The H
    key = "hoftheh",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'H of The H',
        ['text'] = {
            [1] = 'Creates a Negative',
            [2] = '{C:attention}Crazy Joker{}',
            [3] = 'when {C:attention}Blind{} is selected'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "sp_h_rare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hoftheh',
    pools = { ["H"] = true },

	loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,
    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_crazy' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "CRAZY!", colour = G.C.DARK_EDITION})
            end
            return true
        end
                }
        end
    end
}

SMODS.Joker{ --Hegative
    key = "hegative",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        name = 'Hegative',
        text = {
            [1] = 'Creates a random {C:attention}Negative',
            [2] = 'Joker{} when Boss Blind is',
            [3] = 'defeated',
            [4] = '{C:inactive}(only{} {C:common}Common{} {C:inactive}and {}{C:uncommon}Uncommon{}{C:inactive}){}'
        },
        unlock = {'Unlocked by default.'}
    },
    pos = {x = 0, y = 0},
    display_size = {w = 71, h = 95},
    cost = 16,
    rarity = "sp_h_rare",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hegative',
    pools = { ["H"] = true },

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            -- roll rarity: 50% common, 50% uncommon
                            local rarities = {"Common", "Uncommon"}
                            local rarity = pseudorandom_element(rarities, pseudoseed("hegative_roll"))

                            local joker_card = SMODS.add_card({
                                set = 'Joker',
                                rarity = rarity
                            })

                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                            end

                            return true
                        end
                    }))

                    card_eval_status_text(
                        context.blueprint_card or card,
                        'extra',
                        nil, nil, nil,
                        {message = 'H!', colour = G.C.DARK_EDITION}
                    )

                    return true
                end
            }
        end
    end
}

SMODS.Joker{ --HHHHH
    key = "hhhhh",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'HHHHH',
        ['text'] = {
            [1] = 'Creates a {C:edition}Negative{} {C:attention}Crazy',
            [2] = 'Joker{} every time a {C:planet}Saturn{}',
            [3] = 'is used, creates 3 if a',
            [4] = 'J1407b is used'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 18,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hhhhh',
    pools = { ["H"] = true },
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
        info_queue[#info_queue + 1] = G.P_CENTERS.c_saturn
        info_queue[#info_queue + 1] = G.P_CENTERS.c_sp_j1407b
	end,

    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.key == 'c_saturn' then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_crazy' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
            elseif context.consumeable and (context.consumeable.ability.set == 'Exoplanet' or context.consumeable.ability.set == 'Exoplanet') and context.consumeable.config.center.key == 'c_sp_j1407b' then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_crazy' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_crazy' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_crazy' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                            colour = G.C.BLUE
                        }
                        }
                }
            end
        end
    end
}

SMODS.Joker{ --Hedge
    key = "hedge",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hedge',
        ['text'] = {
            [1] = 'Adds a permanent random',
            [2] = 'card with a {C:attention}Red Seal{} to',
            [3] = 'hand if played hand',
            [4] = 'contains a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hedge',
    pools = { ["H"] = true },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.Red
	end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
            new_card:set_seal("Red", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "H"
                }
            end
        end
    end
}