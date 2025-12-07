SMODS.Joker{
    key = "randomwalk",
    config = {
        extra = {
            chance = 20,
            odds = 40,
            levels_dec = -1,
            levels_inc = 1,
            odds_adjust = 4
        }
    },
    loc_txt = {
        unlock = {'Unlocked by default.'}
    },
    pos = {x = 0, y = 0},
    display_size = {w = 71, h = 95},
    cost = 13,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'randwalk',
    pools = {["Math"] = true},

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Math", HEX("1155cc"), G.C.WHITE, 1)
    end,

     loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chance}}
    end,

    calculate = function(self, card, context)
    -- When hand is about to be scored
    if context.before and context.cardarea == G.jokers then
        local target_hand = context.scoring_name or "High Card"
        return {
            func = function()
                -- Roll: [chance] in [odds] to increase instead of decrease
                local inc = SMODS.pseudorandom_probability(
                    card,
                    'hand_roll',
                    card.ability.extra.chance,
                    card.ability.extra.odds,
                    'j_sp_randomwalk',
                    false
                )

                if inc then
                    SMODS.calculate_effect({
                        level_up = card.ability.extra.levels_inc,
                        level_up_hand = target_hand
                    }, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                        message = localize('k_level_up_ex'),
                        colour = G.C.GREEN
                    })
                else
                    SMODS.calculate_effect({
                        level_up = card.ability.extra.levels_dec,
                        level_up_hand = target_hand
                    }, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                        message = "Level Down...",
                        colour = G.C.RED
                    })
                end
                return true
            end
        }
    end

    -- After each hand scored or discard, adjust chance
    if context.joker_main or context.pre_discard then
        return {
            func = function()
                local prev = card.ability.extra.chance
                local msg, col

                -- Roll 1 in 5 to decrease, otherwise increase
                if SMODS.pseudorandom_probability(
                    card,
                    'adjust_chance',
                    1,
                    card.ability.extra.odds_adjust,
                    'j_sp_randomwalk',
                    false
                ) then
                    card.ability.extra.chance = math.max(0, prev - 1)
                    msg, col = '-1', G.C.RED
                else
                    card.ability.extra.chance = math.min(40, prev + 1)
                    msg, col = '+1', G.C.GREEN
                end

                -- Only show message if it actually changed
                if card.ability.extra.chance ~= prev then
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                        message = msg,
                        colour = col
                    })
                end
                return true
            end
        }
    end
end
}

SMODS.Joker{ --Inaccurate Regression
    key = "inaccurateregression",
    config = {
        extra = {
            odds = 15,
            xmult = 1
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
    cost = 13,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'inaccurateregression',
    pools = { ["Math"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Math", HEX("1155cc"), G.C.WHITE, 1)
    end,
    
   loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(
            card,
            7,
            card.ability.extra.odds,
            'j_sp_inaccurateregression'
        )
        return { vars = { card.ability.extra.xmult, num, den } }
    end,
    
    calculate = function(self, card, context)

    -- SAFETY FIX: ensure xmult is initialized
    card.ability.extra.xmult = card.ability.extra.xmult or 1

    -------------------------------------------------------------------
    -- CARD PLAYED: Rank Up or Rank Down
    -------------------------------------------------------------------
    if context.individual and context.cardarea == G.play then
        local scored_card = context.other_card

        if scored_card:get_id() ~= 14 then

            -- Roll 7/15 chance
            local success = SMODS.pseudorandom_probability(
                card,
                'group_0_ae23d7ec',
                7,
                card.ability.extra.odds,
                'j_sp_inaccurateregression',
                false
            )

            if success then
                -- SUCCESS: Raise rank, add mult
                G.E_MANAGER:add_event(Event({
                    func = function()
                        assert(SMODS.modify_rank(scored_card, 1))
                        return true
                    end,
                    message = "Rank + Upgrade!", colour = HEX('1155cc')
                }))

                card.ability.extra.xmult = card.ability.extra.xmult + 0.1

            else
                -- FAILURE: Lower rank only
                G.E_MANAGER:add_event(Event({
                    func = function()
                        assert(SMODS.modify_rank(scored_card, -1))
                        return true
                    end,
                    message = "Rank Down!", colour = G.C.RED
                }))
            end
        end
    end

    -------------------------------------------------------------------
    -- JOKER SCORING: Apply xmult
    -------------------------------------------------------------------
    if context.cardarea == G.jokers and context.joker_main then
        return {
            Xmult = card.ability.extra.xmult
        }
    end
end

}


SMODS.Joker{ --Floret Pentagonal Tiling
    key = "floretpentagonaltiling",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Floret Pentagonal Tiling',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}+X1.5{}',
            [2] = 'Mult if played hand',
            [3] = 'contains at least {C:attention}4{} cards',
            [4] = 'each with {C:attention}distinct suits{}',
            [5] = '{C:inactive}(Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
    cost = 11,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'placeholder',
    pools = { ["Math"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Math", HEX("1155cc"), G.C.WHITE, 1)
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
        
        -- Gather suits of scoring hand, mod-friendly
        local suit_set = {}
        local distinct = 0

        for _, playing_card in ipairs(context.scoring_hand or {}) do
            local suit = playing_card.base.suit
            if suit and not suit_set[suit] then
                suit_set[suit] = true
                distinct = distinct + 1
            end
        end

        local upgraded = false

        -- Condition: at least 4 distinct suits
        if distinct >= 4 then
            card.ability.extra.xmult = card.ability.extra.xmult + 1.5
            upgraded = true
        end

        -- Always apply the multiplier
        if upgraded then
            return {
                message = "Upgrade!",
                Xmult = card.ability.extra.xmult
            }
        else
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
end
}


SMODS.Joker{ --Einstein Tile
    key = "einsteintile",
    config = {
        extra = {
            count = 0,
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Einstein Tile',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}XX1.618{}',
            [2] = 'Mult for every {C:attention}16{}',
            [3] = 'cards scored',
            [4] = '{C:inactive}Cards counted: #1#{}',
            [5] = '{C:inactive}(Currently {}{X:red,C:white}X#2#{} {C:inactive}Mult){}'
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
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'einsteintile',
    pools = { ["Math"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Math", HEX("1155cc"), G.C.WHITE, 1)
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.count, card.ability.extra.xmult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if to_big((card.ability.extra.count or 0)) == to_big(15) then
                card.ability.extra.xmult = (card.ability.extra.xmult) * 1.618
                card.ability.extra.count = 0
                return {
                    message = "What is this diddyblud doing??"
                }
            elseif not (to_big((card.ability.extra.count or 0)) == to_big(15)) then
                card.ability.extra.count = (card.ability.extra.count) + 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end
}


