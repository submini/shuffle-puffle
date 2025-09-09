SMODS.Enhancement {
    key = 'francaise',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 70,
        mult = 7
    },
    loc_txt = {
        name = 'Carte Française',
        text = {
        [1] = '{C:blue}+70{} extra chips, {C:red}+7{} Mult'
    }
    },
    weight = 4,
    atlas = 'francaise',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false
}

SMODS.Enhancement {
    key = 'trading',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 3,
            odds = 5
        }
    },
    loc_txt = {
        name = 'Trading Card',
        text = {
        [1] = '{X:red,C:white}X3{} Mult, {C:green}1 in 5{} chance',
        [2] = 'this card is {C:red}destroyed{}'
    }
    },
    atlas = 'trading',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 1.5,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_93585d88', 1, card.ability.extra.odds, 'm_sp_trading') then
                card.should_destroy = true
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Traded!", colour = G.C.RED})
            end
            return { x_mult = card.ability.extra.x_mult }
        end
    end
}

SMODS.Enhancement {
    key = 'corner',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 75,
        extra = {
            odds = 4,
            x_chips = 2
        }
    },
    loc_txt = {
        name = 'Corner Card',
        text = {
        [1] = '{C:blue}+75{} Chips, {C:green}1 in 4{}',
        [2] = 'chance {X:blue,C:white}X2{} Chips'
    }
    },
    atlas = 'corner',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 3.5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_9c99bf29', 1, card.ability.extra.odds, 'm_sp_corner') then
                SMODS.calculate_effect({x_chips = card.ability.extra.x_chips}, card)
            end
        end
    end
}

SMODS.Enhancement {
    key = 'striped',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            chips = 10,
            mult = 10
        }
    },
    loc_txt = {
        name = 'Striped Card',
        text = {
        [1] = 'This card either gives',
        [2] = '{C:blue}+10{} extra chips or',
        [3] = '{C:red}+10{} Mult when scored'
    }
    },
    atlas = 'striped',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 7,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            -- coin flip (1 = chips, 2 = mult)
            local flip = pseudorandom_element({1, 2}, pseudoseed('striped_flip'))
            if flip == 1 then
                return {chips = card.ability.extra.chips}
            else
                return {mult = card.ability.extra.mult}
            end
        end
    end
}

SMODS.Enhancement {
    key = 'random',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            mult_min = 0,
            mult_max = 28,
            odds = 5,
            x_mult_min = 1.5,
            x_mult_max = 3
        }
    },
    loc_txt = {
        name = 'Random Card',
        text = {
        [1] = '{C:red}+0-28{} Mult, {C:green}1 in 5{}',
        [2] = 'chance {X:red,C:white}X1.5-X3{} Mult'
    }
    },
    atlas = 'random',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_29f69666', 1, card.ability.extra.odds, 'm_sp_random') then
                SMODS.calculate_effect({x_mult = pseudorandom('x_mult_b80338db', card.ability.extra.x_mult_min, card.ability.extra.x_mult_max)}, card)
            end
            return { mult = pseudorandom('mult_107b3e99', card.ability.extra.mult_min, card.ability.extra.mult_max) }
        end
    end
}

SMODS.Enhancement {
    key = 'lebronned',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 32,
        mult = 23,
        extra = {
            odds = 23,
            x_mult = 6
        }
    },
    loc_txt = {
        name = 'LeBronned Card',
        text = {
        [1] = '{C:blue}+32{} extra chips, {C:red}+23{}',
        [2] = 'Mult, {C:green}1 in 23{} chance',
        [3] = '{X:red,C:white}X6{} Mult'
    }
    },
    atlas = 'mainecoon',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 2.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_a2667417', 1, card.ability.extra.odds, 'm_sp_lebronned') then
                SMODS.calculate_effect({x_mult = card.ability.extra.x_mult}, card)
            end
        end
    end
}