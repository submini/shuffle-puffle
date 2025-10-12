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
    discovered = true,
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
