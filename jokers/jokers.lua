function shakecard(self)
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end

function return_JokerValues()
    if context.joker_main and context.cardarea == G.jokers then
        return {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
            x_mult = card.ability.extra.x_mult,
            card = self,
            colour = G.C.CHIPS,
            message = localize('k_upgrade_ex'),
            extra = { focus = self, message = localize('k_upgrade_ex') },
        }
    end
end

SMODS.Atlas({
    key = "deckhugger",
    path = "deckhugger1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "landlord",
    path = "landlord1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "cowboyfromhell",
    path = "cfh1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "woodenruler",
    path = "woodenruler1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "skyline",
    path = "skyline1x.png",
    px = 71,
    py = 95
})







SMODS.Joker{ --Deckhugger
    name = "Deckhugger",
    key = "deckhugger",
    config = {
        extra = {
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Deckhugger',
        ['text'] = {
            [1] = 'Earn {C:money}$3{} when hand does not',
            [2] = 'contain any {C:attention}face cards{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'deckhugger',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if not ((function()
    local rankFound = false
    for i, c in ipairs(context.scoring_hand) do
        if c:is_face() then
            rankFound = true
            break
        end
    end
    
    return rankFound
end)()) then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "Money!"
                }
            end
        end
    end
}

SMODS.Joker{ --Landlord
    name = "Landlord",
    key = "landlord",
    config = {
        extra = {
            sell_value = 6
        }
    },
    loc_txt = {
        ['name'] = 'Landlord',
        ['text'] = {
            [1] = 'Gains {C:money}$6{} sell value',
            [2] = 'when playing a {C:attention}Full House{},',
            [3] = 'Selling removes {C:attention}2{} Full House levels',
            [4] = '{C:inactive}(cannot go below 1){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'landlord',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.level_hand = 'Full House'
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Full House"]) then
                card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                return {
                    message = "House!"
                }
            end
        end

    if context.selling_self and not context.blueprint then
    local full_house = G.GAME.hands["Full House"]
    if full_house and full_house.level then
        full_house.level = math.max(1, full_house.level - 2)
        return {
            message = "House Sold!"
        }
    
    end
end
end,

}

SMODS.Joker{ --Cowboy From Hell
    name = "Cowboy From Hell",
    key = "cowboyfromhell",
    config = {
        extra = {
            mult = 5,
            chips = 25
        }
    },
    loc_txt = {
        ['name'] = 'Cowboy From Hell',
        ['text'] = {
            [1] = 'If the amount of {C:blue}hands{}',
            [2] = 'left is {C:attention}3{}, {C:red}+5{} Mult and {C:blue}+25{} Chips'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'cowboyfromhell',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if G.GAME.current_round.hands_left == 3 then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        chips = card.ability.extra.chips,
                        colour = G.C.CHIPS
                        }
                }
            end
        end
    end
}

SMODS.Joker{
    name = "Wooden Ruler",
    key = "woodenruler",
    config = {
        extra = {
            mult = 1.0 -- base multiplier
        }
    },
    loc_txt = {
        ['name'] = 'Wooden Ruler',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}X0.5{} Mult if',
            [2] = 'played hand is a {C:attention}Straight{}, loses {X:red,C:white}-X0.5{}',
            [3] = 'Mult if played hand is not a {C:attention}Straight{}',
            [4] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} Mult){}{}'
        }
    },
    pos = { x = 0, y = 0 },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'woodenruler',

    -- inject current mult into loc_vars
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                string.format('%.1f', card and card.ability.extra.mult or 1.0)
            }
        }
    end,

    calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
        local prev = card.ability.extra.mult
        if context.scoring_name == "Straight" then
            card.ability.extra.mult = prev + 0.5
            return {
                message = "+X0.5 Mult",
                Xmult = card.ability.extra.mult,
                colour = G.C.RED
            }
        else
            card.ability.extra.mult = math.max(1.0, prev - 0.5)
            return {
                message = (prev > 1.0) and "-X0.5 Mult" or nil,
                colour = (prev > 1.0) and G.C.RED or nil,
                Xmult = card.ability.extra.mult
            }
        end
    end
end,
}

SMODS.Joker{ -- Skyline
    name = "Skyline",
    key = "skyline",
    config = {
        extra = {
            xchips = 1,
            rank = nil
        }
    },
    loc_txt = {
        name = "Skyline",
        text = {
            [1] = "This Joker gains {X:blue,C:white}+X0.35{} Chips",
            [2] = "for each played {C:attention}#3#{} when scored,",
            [3] = "rank changes at end of round",
            [4] = "{C:inactive}(Currently {X:blue,C:white}X#1#{}{C:inactive} Chips){}{}"
        }
    },
    pos = { x = 0, y = 0 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "skyline",

    loc_vars = function(self, info_queue, card)
        local rank = card.ability.extra.rank
        local rank_name = ({
            [11] = "Jack",
            [12] = "Queen",
            [13] = "King",
            [14] = "Ace"
        })[rank] or tostring(rank)

        return {
            vars = {
                card.ability.extra.xchips,
                rank,
                localize(rank_name, "ranks")
            }
        }
    end,

    set_ability = function(self, card, initial)
        card.ability.extra.rank = pseudorandom("skyline_init", 2, 14)
        local rank = card.ability.extra.rank
        local rank_names = {
            [11] = "Jack",
            [12] = "Queen",
            [13] = "King",
            [14] = "Ace"
        }
        G.GAME.current_round.rankdisplay_card = {
            rank = rank_names[rank] or tostring(rank),
            id = rank
        }

        -- Store these for display consistency across round
        G.GAME.current_round.jack_card = { rank = "Jack", id = 11 }
        G.GAME.current_round.queen_card = { rank = "Queen", id = 12 }
        G.GAME.current_round.king_card = { rank = "King", id = 13 }
        G.GAME.current_round.ace_card = { rank = "Ace", id = 14 }
    end,

    calculate = function(self, card, context)
        -- Give +X0.35 chips per played card of matching rank
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local id = context.other_card and context.other_card:get_id()
            local rank = card.ability.extra.rank or 0

            if id and id == rank then
                card.ability.extra.xchips = card.ability.extra.xchips + 0.35
                return {
                    message = "+X0.35",
                    extra = {
                        x_chips = card.ability.extra.xchips,
                        colour = G.C.BLUE
                    }
                }
            end
        end

        -- Roll new rank at end of round
        if context.end_of_round and not context.blueprint then
            return {
                func = function()
                    local new_rank = pseudorandom("skyline_roll", 2, 14)
                    card.ability.extra.rank = new_rank

                    local rank_names = {
                        [11] = "Jack",
                        [12] = "Queen",
                        [13] = "King",
                        [14] = "Ace"
                    }

                    G.GAME.current_round.rankdisplay_card = {
                        rank = rank_names[new_rank] or tostring(new_rank),
                        id = new_rank
                    }

                    return true
                end
            }
        end
    end,
}
