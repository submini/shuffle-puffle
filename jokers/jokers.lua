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

-- Helper function to count face cards
local function count_face_cards()
    local count = 0
    for _, v in ipairs(G.playing_cards or {}) do
        if v:is_face() then count = count + 1 end
    end
    return count
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

SMODS.Atlas({
    key = "tamerlane",
    path = "tamerlane1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "moodring",
    path = "moodring1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "juler",
    path = "juler1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "ragazzo",
    path = "ragazzo1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "symmetry",
    path = "symmetry1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "finisher",
    path = "finisher1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sparechange",
    path = "sparechange1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sparedollars",
    path = "sparedollars1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "jackboys",
    path = "placeholder1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "placeholder",
    path = "placeholder1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "entanglement",
    path = "placeholder1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "measurement",
    path = "placeholder1x.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "checkpoint",
    path = "checkpoint1x.png",
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
            Xmult = 1.9,
            chips = 25
        }
    },
    loc_txt = {
        ['name'] = 'Cowboy From Hell',
        ['text'] = {
            [1] = 'If the amount of {C:blue}hands{}',
            [2] = 'left is {C:attention}3{}, {X:red,C:white}X1.9{} Mult and {C:blue}+25{} Chips'
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
                    Xmult = card.ability.extra.Xmult,
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

SMODS.Joker{
    name = "Tamerlane",
    key = "tamerlane",
    config = {
        extra = {
            emult = 1.0 -- Initial base
        }
    },
    loc_txt = {
        name = "Tamerlane",
        text = {
            [1] = "This Joker grants {C:purple}+^0.025{} Mult",
            [2] = "for each {C:attention}face card{} in your full deck",
            [3] = "{C:inactive}(Currently ^#1# Mult){}"
        }
    },
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "tamerlane", -- your layered Joker sprite base name

    loc_vars = function(self, info_queue, card)
        local face_count = count_face_cards()
        local emult = 1.0 + (0.025 * face_count)
        card.ability.extra.emult = emult -- update it here too!
        return {
            vars = {
                string.format("%.3f", emult)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local face_count = count_face_cards()
            local emult = 1.0 + (0.025 * face_count)
            card.ability.extra.emult = emult
            return {
                    e_mult = card.ability.extra.emult
                }

        end
    end
}

SMODS.Joker{ --Mood Ring
    name = "Mood Ring",
    key = "moodring",
    config = {
        extra = {
            action = 1,
            mult = 10,
            chips = 100,
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Mood Ring',
        ['text'] = {
            [1] = 'When a poker hand is played,',
            [2] = 'this Joker gives a random effect',
            [3] = 'from the following:',
            [4] = '{C:red}+10{} Mult, {C:money}+$5{}, or {C:blue}+100{} Chips'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'moodring',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (card.ability.extra.action or 0) == 1 then
                return {
                    mult = card.ability.extra.mult
                }
            elseif (card.ability.extra.action or 0) == 2 then
                return {
                    chips = card.ability.extra.chips
                }
            elseif (card.ability.extra.action or 0) == 3 then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
        if context.after and context.cardarea == G.jokers then
                return {
                    func = function()
                    card.ability.extra.action = pseudorandom('action_b2eb658b', 1, 3)
                    return true
                end
                }
        end
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.action = pseudorandom('action_55f58ae4', 1, 3)
                    return true
                end
                }
        end
    end
}

SMODS.Joker {
    name = "Juler",
    key = "juler",
    cost = 3,
    rarity = 1, -- Common
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    atlas = "juler", -- Replace with your atlas name if needed
    config = {
        extra = 1
    },
    loc_txt = {
        name = "Juler",
        text = {
            "Retriggers every {C:attention}2{}, {C:attention}7{}, {C:attention}Ace{} and {C:attention}8{}"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local id = context.other_card:get_id()
            if id == 2 or id == 7 or id == 8 or id == 14 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{ --Ragazzo
    name = "Ragazzo",
    key = "ragazzo",
    config = {
        extra = {
            chips = 0,
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Ragazzo',
        ['text'] = {
            [1] = 'Gains {C:blue}+50{} Chips for each face card',
            [2] = 'scored if at least one of them was a',
            [3] = '{C:hearts}Heart{} or {C:diamonds}Diamond{}. If all 5 cards are',
            [4] = 'scoring face cards, gain {X:red,C:white}+X0.08{} Mult',
            [5] = '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips and{} {X:red,C:white}X#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'ragazzo',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (context.other_card:is_face() and context.other_card:is_suit("Hearts") or context.other_card:is_face() and context.other_card:is_suit("Diamonds")) then
                card.ability.extra.chips = (card.ability.extra.chips) + 50
                return {
                    message = "Ragazzo!",
                    colour = G.C.GREEN
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_face() then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 5
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_suit("Hearts") or c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 1
end)()) then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.08
                return {
                    message = "RAGAZZO!",
                    colour = G.C.GREEN
                }
            else
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        Xmult = card.ability.extra.xmult
                        }
                }
            end
        end
    end
}

SMODS.Joker{ --Symmetry
    name = "Symmetry",
    key = "symmetry",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Symmetry',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}+X0.3{} Mult if played hand has',
            [2] = 'two {C:hearts}Heart{} cards and two {C:diamonds}Diamond{} cards',
            [3] = 'or two {C:spades}Spade{} cards and two {C:clubs}Club{} cards,',
            [4] = 'loses {X:red,C:white}-X0.5{} Mult if not',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'symmetry',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (#context.full_hand == 4 and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Hearts") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.3
                return {
                    message = "Symmetrical!",
                    extra = {
                        Xmult = card.ability.extra.xmult
                        }
                }
            elseif (#context.full_hand == 4 and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Spades") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)() and (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.3
                return {
                    message = "Symmetrical!",
                    extra = {
                        Xmult = card.ability.extra.xmult
                        }
                }
            elseif (not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Hearts") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) and not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) or not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Spades") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) and not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) or not (#context.full_hand == 4) and (card.ability.extra.xmult or 0) > 1.4) then
                card.ability.extra.xmult = math.max(1, (card.ability.extra.xmult) - 0.5)
                return {
                    message = "Asymmetrical",
                    extra = {
                        Xmult = card.ability.extra.xmult
                        }
                }
            elseif (not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Hearts") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) and not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Diamonds") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) or not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Spades") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) and not ((function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount == 2
end)()) or not (#context.full_hand == 4) and (card.ability.extra.xmult or 0) < 1.5) then
                card.ability.extra.xmult = 1
                return {
                    message = "Asymmetrical"
                }
            end
        end
    end
}

SMODS.Joker{ --Finisher
    name = "Finisher",
    key = "finisher",
    config = {
        extra = {
            xmult = 2,
            xchips = 4,
            xchips2 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Finisher',
        ['text'] = {
            [1] = 'When played hand is the last hand',
            [2] = 'of round, {X:blue,C:white}X4{} Chips and {X:red,C:white}X2{} Mult.',
            [3] = 'If hand includes a scoring',
            [4] = 'face card, {X:red,C:white}X3{} Mult instead'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'finisher',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (G.GAME.current_round.hands_left == 0 and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_face() then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)()) then
                card.ability.extra.xmult = 3
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.xmult
                        }
                }
            elseif (G.GAME.current_round.hands_left == 0 and not ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_face() then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)())) then
                card.ability.extra.xmult = 2
                return {
                    x_chips = card.ability.extra.xchips2,
                    extra = {
                        Xmult = card.ability.extra.xmult
                        }
                }
            end
        end
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.xmult = 2
                    return true
                end
                }
        end
    end
}

SMODS.Joker{ --Spare Change
    name = "Spare Change",
    key = "sparechange",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Spare Change',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+2{} Chips for',
            [2] = 'each {C:attention}discarded card{}',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
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
    atlas = 'sparechange',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + 2
                    return true
                end,
                    message = "Spare!",
                    colour = G.C.CHIPS                 
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}

SMODS.Joker{ --Spare Dollars
    name = "Spare Dollars",
    key = "sparedollars",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Spare Dollars',
        ['text'] = {
            [1] = 'This joker gains {C:red}+2{} Mult for',
            [2] = 'each {C:attention}discarded card{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'sparedollars',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 2
                    return true
                end,
                    message = "Spare!",
                    colour = G.C.MULT
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --JACKBOYS
    name = "JACKBOYS",
    key = "jackboys",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'JACKBOYS',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}+X0.07{} Mult',
            [2] = 'for each scored {C:attention}Jack{}',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jackboys',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 11 then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.07
                return {
                    message = "Travis Scott!",
                    colour = G.C.MULT
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Joker{ --Placeholder
    name = "Placeholder",
    key = "placeholder",
    config = {
        extra = {
            random = 1
        }
    },
    loc_txt = {
        ['name'] = 'Placeholder',
        ['text'] = {
            [1] = '{C:attention}Copies{} the {C:attention}effect{} of the',
            [2] = 'jokers to its left and right'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 11,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'placeholder',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

calculate = function(self, card, context)
    local left_joker = nil
    local right_joker = nil
    local my_pos = nil

    -- Find current joker position
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
            my_pos = i
            break
        end
    end

    if not my_pos then return end

    if my_pos > 1 then
        left_joker = G.jokers.cards[my_pos - 1]
    end
    if my_pos < #G.jokers.cards then
        right_joker = G.jokers.cards[my_pos + 1]
    end

    -- Get results from both neighbors
    local effect_left = left_joker and SMODS.blueprint_effect(card, left_joker, context) or nil
    local effect_right = right_joker and SMODS.blueprint_effect(card, right_joker, context) or nil

    -- Merge the effects safely
    local final_effect = {}

    -- Copy all keys from left effect
    if type(effect_left) == "table" then
        for k, v in pairs(effect_left) do
            final_effect[k] = v
        end
    end

    -- Merge in right effect, adding values if they overlap
    if type(effect_right) == "table" then
        for k, v in pairs(effect_right) do
            if type(v) == "number" then
                final_effect[k] = (final_effect[k] or 0) + v
            elseif final_effect[k] == nil then
                final_effect[k] = v
            end
        end
    end

    return next(final_effect) and final_effect or nil
end
}

SMODS.Joker{ --Entanglement
    name = "Entanglement",
    key = "entanglement",
    config = {
        extra = {
            Planet = 0
        }
    },
    loc_txt = {
        ['name'] = 'Entanglement',
        ['text'] = {
            [1] = 'Create a {C:planet}Planet{} card if poker hand',
            [2] = 'contains an {C:attention}Ace{} and a {C:attention}Straight{}',
            [3] = '{C:inactive}(Must have room){}'
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
    atlas = 'entanglement',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 14 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and next(context.poker_hands["Straight"])) then
                local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local consumable_card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'joker_forge_planet')
                            consumable_card:add_to_deck()
                            G.consumeables:emplace(consumable_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_consumable and localize('k_plus_planet') or nil,
                    colour = G.C.SECONDARY_SET.Planet,
                    card = self
                }
            end
        end
    end
}

SMODS.Joker{ --Measurement
    name = "Measurement",
    key = "measurement",
    config = {
        extra = {
            Spectral = 0
        }
    },
    loc_txt = {
        ['name'] = 'Measurement',
        ['text'] = {
            [1] = 'Create a {C:spectral}Spectral{} card if poker hand',
            [2] = 'contains an {C:attention}Ace{} and a {C:attention}Straight{}',
            [3] = '{C:inactive}(Must have room){}'
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
    atlas = 'measurement',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if ((function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 14 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() and next(context.poker_hands["Straight"])) then
                local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local consumable_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'joker_forge_spectral')
                            consumable_card:add_to_deck()
                            G.consumeables:emplace(consumable_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil,
                    colour = G.C.SECONDARY_SET.Spectral,
                    card = self
                }
            end
        end
    end
}

SMODS.Joker{ --Checkpoint
    name = "Checkpoint",
    key = "checkpoint",
    config = {
        extra = {
            ante_value = 1
        }
    },
    loc_txt = {
        ['name'] = 'Checkpoint',
        ['text'] = {
            [1] = '{C:red}Prevents death{} but',
            [2] = '{C:red}self destructs{}, {C:attention}-1 Ante{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'checkpoint',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then
                return {
                    saved = true,
                    message = "Wahoo!",
                    extra = {
                        func = function()
                    G.GAME.round_resets.ante = G.GAME.round_resets.ante - card.ability.extra.ante_value
                    return true
                end,
                            message = "Ante -" .. card.ability.extra.ante_value,
                        colour = G.C.FILTER,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Bye-bye!",
                            colour = G.C.RED
                        }
                        }
                }
        end
    end
}


