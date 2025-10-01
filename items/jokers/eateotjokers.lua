SMODS.Joker{ --beaten frowns after
    key = "beatenfrownsafter",
    config = {
        extra = {
            xchips = 2,
            Xmult = 1.5,
            dollars = 20
        }
    },
    loc_txt = {
        ['name'] = 'beaten frowns after',
        ['text'] = {
            [1] = 'Every {C:attention}number card{} gives {X:blue,C:white}X2{} Chips',
            [2] = 'Every {C:attention}face card{} gives {X:red,C:white}X1.5{} Mult',
            [3] = 'Every {C:attention}Ace{} gives {C:gold}+$20{}'
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
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'bfa',
    pools = { ["EATEOT"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("EATEOT", HEX("245570"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not (context.other_card:is_face()) and not (context.other_card:get_id() == 14)) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            elseif context.other_card:is_face() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif context.other_card:get_id() == 14 then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}

SMODS.Joker{ --pittor pickgown in khatheinstersper
    key = "ppik",
    config = {
        extra = {
            xmult = 5,
            odds = 5,
            odds2 = 3
        }
    },
    loc_txt = {
        ['name'] = 'pittor pickgown in khatheinstersper',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult,',
            [2] = '{C:green}1 in 5{} chance to lose',
            [3] = '{X:red,C:white}-X0.5{} Mult and {C:green}1 in',
            [4] = '3{} chance to gain {X:red,C:white}+X0.5{}',
            [5] = 'Mult when {C:attention}Blind{} is selected'
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
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'ppik',
    pools = { ["EATEOT"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("EATEOT", HEX("245570"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_ppik')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_modprefix_ppik')
        return {vars = {card.ability.extra.xmult, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1e3fe6e3', 1, card.ability.extra.odds, 'j_modprefix_ppik', false) then
              SMODS.calculate_effect({func = function()
                    card.ability.extra.xmult = math.max(0, (card.ability.extra.xmult) - 0.5)
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "stage 2", colour = G.C.RED})
          end
                if SMODS.pseudorandom_probability(card, 'group_1_e5ac4725', 1, card.ability.extra.odds2, 'j_modprefix_ppik', false) then
              SMODS.calculate_effect({func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "stage 2", colour = G.C.GREEN})
          end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Joker{ --hag
    key = "hag",
    config = {
        extra = {
            min = 1,
            max = 10
        }
    },
    loc_txt = {
        ['name'] = 'hag',
        ['text'] = {
            [1] = ''
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
    cost = 19,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hag',
    pools = { ["EATEOT"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("EATEOT", HEX("245570"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = pseudorandom('Xmult_cbae9447', card.ability.extra.min, card.ability.extra.max)
                }
        end
    end,

     loc_vars = function(self, info_queue, card)
        local r_mults = {}
        for i = card.ability.extra.min, card.ability.extra.max do
            r_mults[#r_mults + 1] = tostring(i)
        end
        local loc_mult = ' ' .. (localize('k_mult')) .. ' '
        main_start = {
            { n = G.UIT.T, config = { text = '  X', colour = G.C.MULT, scale = 0.32 } },
            { n = G.UIT.O, config = { object = DynaText({ string = r_mults, colours = { G.C.RED }, pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0 }) } },
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = 'stage3()', colour = G.C.JOKER_GREY }, { string = 'POSTAWARENESSCONFUSIONS', colour = G.C.RED }, { string = 'LEYLANDkirby', colour = G.C.BLACK }, { string = 'A1-', colour = G.C.BLACK }, { string = 'A2-', colour = G.C.BLACK }, { string = 'A3-', colour = G.C.BLACK }, { string = 'B1-', colour = G.C.BLACK }, { string = 'C3-', colour = G.C.BLACK }, { string = 'F2-', colour = G.C.BLACK }, { string = 'F7-', colour = G.C.BLACK }, { string = "#@" .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11) .. (G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1, 1) or 'D'), colour = G.C.RED },
                            loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult,
                            loc_mult, loc_mult, loc_mult, loc_mult },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },
        }
        return { main_start = main_start }
    end,
}

SMODS.Joker{ --giltsholder
    key = "giltsholder",
    config = {
        extra = {
            mult = 50,
            mult2 = 50
        }
    },
    loc_txt = {
        ['name'] = 'giltsholder',
        ['text'] = {
            [1] = 'Every {C:attention}face card{} gives',
            [2] = '{C:red}+50{} Mult when {C:attention}scored{}',
            [3] = 'or {C:attention}held in hand{}'
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
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'giltsholder',
    pools = { ["EATEOT"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("EATEOT", HEX("245570"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:is_face() then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    mult = card.ability.extra.mult2
                }
            end
        end
    end
}

SMODS.Joker{ --eptitranxisticemestionscers descending
    key = "stage5",
    config = {
        extra = {
            pb_x_chips_228531e0 = 1,
            perma_x_chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'eptitranxisticemestionscers descending',
        ['text'] = {
            [1] = 'If {C:attention}five cards{} are scored, give every',
            [2] = 'card except for the {C:attention}first{} one a',
            [3] = '{X:blue,C:white}X2{} Chips bonus'
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
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'edescending',
    pools = { ["EATEOT"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("EATEOT", HEX("245570"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (#context.scoring_hand == 5 and not (context.other_card == context.scoring_hand[1])) then
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + card.ability.extra.pb_x_chips_228531e0
                return {
                    extra = { message = "stage 5", colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}

SMODS.Joker{ --necrotomigaud
    key = "necrotomigaud",
    config = {
        extra = {
            hand_change = 2,
            discard_change = 2
        }
    },
    loc_txt = {
        ['name'] = 'necrotomigaud',
        ['text'] = {
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
    cost = 16,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'necrotomigaud',
    pools = { ["EATEOT"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("EATEOT", HEX("245570"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_change
        G.hand:change_size(2)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_change
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_change
        G.hand:change_size(-2)
    end
}