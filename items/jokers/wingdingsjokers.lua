SMODS.Joker{ --Pencil
    key = "pencil",
    config = {
        extra = {
            pb_bonus_c492cbdd = 20,
            perma_bonus = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pencil',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = 'a {C:attention}Straight{}, give each',
            [3] = 'scored card a',
            [4] = 'permanent {C:blue}+20{} Chips',
            [5] = 'bonus'
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
        w = 66 * 1,
        h = 66 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'pencil',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if next(context.poker_hands["Straight"]) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.pb_bonus_c492cbdd
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}

SMODS.Joker{ --Scissors
    key = "scissors1",
    config = {
        extra = {
            xmult = 1,
            blind_size = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Scissors 1',
        ['text'] = {
            [1] = '{C:red}X1.5 Blind requirement{}',
            [2] = 'at {C:attention}start of round{},',
            [3] = 'gains {X:red,C:white}X0.75{} Mult',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'scissors1',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.RED})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end,
                    extra = {
                        func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.75
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
        end
    end
}

SMODS.Joker{ --H
    key = "et",
    config = {
    },
    loc_txt = {
        ['name'] = 'Ampersand 1',
        ['text'] = {
            [1] = 'h',
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
        w = 66 * 1,
        h = 66 * 1,
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'et',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[1]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}

SMODS.Joker{ --Ampersand 2
    key = "ampersand2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ampersand 2',
        ['text'] = {
            [1] = '{C:attention}Copies{} the effect of',
            [2] = 'the last {C:attention}2{} jokers',
            [3] = 'in the jokers slot'
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
        w = 66 * 1,
        h = 66 * 1,
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'and2',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

     calculate = function(self, card, context)
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}