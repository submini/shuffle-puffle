SMODS.Joker{ --H
    key = "et",
    config = {
        extra = {
            Xmult = 12
        }
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
        badges[#badges+1] = create_badge("Wingdings 2", HEX("000000"), G.C.WHITE, 1)
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