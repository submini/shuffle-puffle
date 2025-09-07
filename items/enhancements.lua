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
    atlas = 'ragdoll',
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            if SMODS.pseudorandom_probability(card, 'group_0_93585d88', 1, card.ability.extra.odds, 'm_modprefix_tradingcard') then
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
    atlas = 'siamese',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_9c99bf29', 1, card.ability.extra.odds, 'm_modprefix_cornercard') then
                SMODS.calculate_effect({x_chips = card.ability.extra.x_chips}, card)
            end
        end
    end
}

SMODS.Enhancement {
    key = 'stripedcard',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            turn = 1,
            chips = 10,
            mult = 10
        }
    },
    loc_txt = {
        name = 'Striped Card',
        text = {
        [1] = 'Alternatingly switches',
        [2] = 'the card\'s effect to',
        [3] = '{C:blue}+10{} extra Chips or {C:red}+10{} Mult'
    }
    },
    atlas = 'Enhancement',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and (card.ability.extra.turn or 0) == 2 then
            card.ability.extra.turn = 1
            SMODS.calculate_effect({chips = card.ability.extra.chips}, card)
        end
        if context.main_scoring and context.cardarea == G.play and (card.ability.extra.turn or 0) == 1 then
            card.ability.extra.turn = 2
            SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
        end
    end
}