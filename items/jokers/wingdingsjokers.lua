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
            blind_size = 0.75
        }
    },
    loc_txt = {
        ['name'] = 'Scissors 1',
        ['text'] = {
            [1] = 'X0.75 Blind requirement chips',
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
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Snip!"})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end }
        end
    end
}

SMODS.Joker{ --Scissors 2
    key = "scissors2",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Scissors 2',
        ['text'] = {
            [1] = 'If {C:blue}first hand{} of round',
            [2] = 'has only {C:attention}2{} played cards,',
            [3] = '{C:red}destroy{} both of them and',
            [4] = 'gain {X:red,C:white}+X0.5{} Mult',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
    atlas = 'scissors2',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (G.GAME.current_round.hands_played == 0 and #context.scoring_hand == 2) then
                context.other_card.should_destroy = true
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                return {
                    message = "Snip!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Joker{ --Glasses
    key = "glasses",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glasses',
        ['text'] = {
            [1] = 'If at least {C:attention}3{} cards of',
            [2] = '{C:spades}Spade{} or {C:clubs}Club{} suit are',
            [3] = 'discarded, this joker',
            [4] = 'gains {C:red}+8{} Mult',
            [5] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
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
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'glasses',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.pre_discard  then
            if (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Spades") or c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 3
end)() then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 8
                    return true
                end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Bell
    key = "bell",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Bell',
        ['text'] = {
            [1] = 'If played {C:blue}hand{} is the',
            [2] = '{C:attention}first hand{} of round,',
            [3] = 'retrigger every card',
            [4] = '{C:attention}2{} times'
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
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'bell',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
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