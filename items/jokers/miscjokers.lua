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


-- pure exponentiation helper
-- raises val to pow, no cap
function exponentiation(val, pow)
    return val ^ pow
end


-- helper: tetration function
local function tetrate(base, height)
    if height <= 0 then return 1 end
    local result = base
    for i = 2, height do
        result = lenient_bignum(base)^result
    end
    return result
end

----------------------------------------------------------------------------------------------------------------------------

SMODS.Joker{ --Black Cat
    name = "Black Cat",
    key = "blackcat",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Black Cat',
        ['text'] = {
            [1] = 'At the {C:attention}start{} of each round,',
            [2] = 'this cat adds a random {C:attention}Glass{}',
            [3] = 'card to deck'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'blackcat',
    pools = { ["Shuffle"] = true },

	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_glass
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Meow!"
                }
        end
    end
}

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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    unlocked = true,
    discovered = false,
    atlas = 'landlord',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    --in_pool = function(self, args)
    --for _, j in ipairs(G.jokers.cards) do
        --if j.config.center.key == self.key then
            --return false
        --end
    --end
    --return true
--end,

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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    unlocked = true,
    discovered = false,
    atlas = 'woodenruler',
    pools = { ["Shuffle"] = true },

    -- inject current mult into loc_vars
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                string.format('%.1f', card and card.ability.extra.mult or 1.0)
            }
        }
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

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

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    discovered = false,
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'measurement',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
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
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'checkpoint',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then
                return {
                    saved = true,
                    saved = localize('sp_saved_checkpoint'),
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

SMODS.Joker{ --Alchemist
    name = "Alchemist",
    key = "alchemist",
    config = {
        extra = {
            chips = 0,
            mult = 0,
            sell_value = 1
        }
    },
    loc_txt = {
        ['name'] = 'Alchemist',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+50{} Chips, {C:red}+5{} Mult,',
            [2] = 'and {C:money}+$1{} sell value for each joker',
            [3] = 'sold this run',
            [4] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips and{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'alchemist',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + 50
                    return true
                end,
                    message = "Al",
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 5
                    return true
                end,
                            message = "che",
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                    return true
                end,
                            message = "mist!",
                            colour = G.C.GREEN
                        }
                        }
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
        end
    end
}

SMODS.Joker{ --Top-up
    name = "Top-up",
    key = "topup",
    config = {
        extra = {
            dollars = 2
        }
    },
    loc_txt = {
        ['name'] = 'Top-up',
        ['text'] = {
            [1] = 'Earn {C:money}$2{} at the {C:attention}start{}',
            [2] = 'of each round'
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
    atlas = 'topup',
    pools = { ["Shuffle"] = true },

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}

SMODS.Joker{ --Virus
    name = "Virus",
    key = "virus",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Virus',
        ['text'] = {
            [1] = 'If {C:blue}first hand{} of round has',
            [2] = '{C:attention}exactly{} 2 cards, {C:attention}copy{} the left',
            [3] = 'card {C:attention}twice{}'
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
    atlas = 'virus',
    pools = { ["Shuffle"] = true },

   loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (G.GAME.current_round.hands_played == 0 and #context.scoring_hand == 2) then
                local cards_to_copy = {}
                local target_index = 1
                if context.full_hand[target_index] then
                    table.insert(cards_to_copy, context.full_hand[target_index])
                end
                
                for i, source_card in ipairs(cards_to_copy) do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local copied_card = copy_card(source_card, nil, nil, G.playing_card)
                    copied_card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copied_card)
                    G.hand:emplace(copied_card)
                    copied_card.states.visible = nil
                    
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            copied_card:start_materialize()
                            return true
                        end
                    }))
                end
                local cards_to_copy = {}
                local target_index = 1
                if context.full_hand[target_index] then
                    table.insert(cards_to_copy, context.full_hand[target_index])
                end
                
                for i, source_card in ipairs(cards_to_copy) do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local copied_card = copy_card(source_card, nil, nil, G.playing_card)
                    copied_card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copied_card)
                    G.hand:emplace(copied_card)
                    copied_card.states.visible = nil
                    
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            copied_card:start_materialize()
                            return true
                        end
                    }))
                end
                return {
                    message = "Copied!",
                    colour = G.C.GREEN
                }
            end
        end
    end
}

SMODS.Joker{ --Triangular Joker
    name = "Triangular Joker",
    key = "triangularjoker",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Triangular Joker',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+2{} Mult',
            [2] = 'for each scoring {C:attention}Ace{}, {C:attention}3{}, {C:attention}6{} or {C:attention}10{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
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
    atlas = 'triangular',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 6 or context.other_card:get_id() == 10) then
                card.ability.extra.mult = (card.ability.extra.mult) + 2
                return {
                    message = "Triangle!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Resonance
    name = "Resonance",
    key = "resonance",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Resonance',
        ['text'] = {
            [1] = 'When a hand is played, if {C:attention}all cards{} scored',
            [2] = 'are of the {C:attention}same rank{}, this joker gains',
            [3] = '{X:red,C:white}+X0.05{} Mult for each card scored',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
    atlas = 'resonance',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.scoring_name == "Pair" or context.scoring_name == "Three of a Kind" or context.scoring_name == "Four of a Kind" or context.scoring_name == "Five of a Kind" or context.scoring_name == "Flush Five" then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.05
                return {
                    message = "Resonance!"
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

SMODS.Joker{ --Frog
    name = "Frog",
    key = "frog",
    config = {
        extra = {
            expmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Frog',
        ['text'] = {
            [1] = '{C:purple}+^0.05{} Mult for each Blind',
            [2] = '{C:attention}skipped{} this run',
            [3] = '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
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
    atlas = 'frog',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.expmult}}
    end,
    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.expmult = (card.ability.extra.expmult) + 0.05
                    return true
                end,
                    message = "Hop!",
                    colour = G.C.GREEN
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    e_mult = card.ability.extra.expmult
                }
        end
    end
}

SMODS.Joker{ --Encore
    name = "Encore",
    key = "encore",
    config = {
        extra = {
            j_joker = 0
        }
    },
    loc_txt = {
        ['name'] = 'Encore',
        ['text'] = {
            [1] = 'Creates a random {C:uncommon}Uncommon{} Joker',
            [2] = 'when played poker hand is the',
            [3] = '{C:attention}most played hand{}',
            [4] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'encore',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (function()
    local current_played = G.GAME.hands[context.scoring_name].played or 0
    for handname, values in pairs(G.GAME.hands) do
        if handname ~= context.scoring_name and values.played > current_played and values.visible then
            return false
        end
    end
    return true
end)() then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Uncommon',
                                key_append = 'joker_forge_random'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                return {
                    message = "Encore!"
                }
            end
        end
    end
}

SMODS.Joker{ --Scrap Heap
    name = "Scrap Heap",
    key = "scrapheap",
    config = {
        extra = {
            constant = 5,
            chips = 0,
            cardsindiscard = 0
        }
    },
    loc_txt = {
        ['name'] = 'Scrap Heap',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+5{} Chips',
            [2] = 'for {C:attention}every card in the discard pile{},',
            [3] = '{C:attention}resets{} after round ends',
            [4] = '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
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
    atlas = 'scrapheap',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.constant, card.ability.extra.chips}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                local constant_value = card.ability.extra.constant
                card.ability.extra.constant = 5
                card.ability.extra.constant = (card.ability.extra.constant) * #G.discard.cards
                card.ability.extra.chips = card.ability.extra.constant
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.constant = 5
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.chips = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.pre_discard and not context.blueprint then
                local constant_value = card.ability.extra.constant
                return {
                    func = function()
                    card.ability.extra.constant = 5
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.constant = (card.ability.extra.constant) * #G.discard.cards
                    return true
                end,
                        colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.chips = card.ability.extra.constant
                    return true
                end,
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end
}

SMODS.Joker{ --Lone Wolf
    name = "Lone Wolf",
    key = "lonewolf",
    config = {
        extra = {
            Xmult = 7
        }
    },
    loc_txt = {
        ['name'] = 'Lone Wolf',
        ['text'] = {
            [1] = '{X:red,C:white}X7{} Mult if there are',
            [2] = 'no other jokers owned'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'lonewolf',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if #G.jokers.cards == 1 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Joker{ --Coin Flip
    name = "Coin Flip",
    key = "coinflip",
    config = {
        extra = {
            odds = 2,
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Coin Flip',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to earn',
            [2] = '{C:attention}$5{} at start of round'
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
    atlas = 'coinflip',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_e04a4870', 1, card.ability.extra.odds, 'group_0_e04a4870') then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                    end
            end
        end
    end
}

SMODS.Joker{ --Lucky Break
    name = "Lucky Break",
    key = "luckybreak",
    config = {
        extra = {
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Lucky Break',
        ['text'] = {
            [1] = '{C:green}1 in 10{} chance for a',
            [2] = 'scoring card to be',
            [3] = 'turned into a {C:attention}Lucky{} card'
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
    atlas = 'luckybreak',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_364c3fd6', 1, card.ability.extra.odds, 'group_0_364c3fd6') then
                        context.other_card:set_ability(G.P_CENTERS.m_lucky)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Luckified!", colour = G.C.BLUE})
                    end
            end
        end
    end
}

SMODS.Joker{ --Apex Joker
    name = "Apex Joker",
    key = "apex",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Apex Joker',
        ['text'] = {
            [1] = 'When {C:attention}Boss Blind{} is defeated,',
            [2] = 'this joker gains {X:red,C:white}+X1{} Mult',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{}{C:inactive} Mult){}'
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
    atlas = 'apex',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 1
                    return true
                end,
                    message = "Apex!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Joker{ --One-Time Use
    name = "One-Time Use",
    key = "onetimeuse",
    config = {
        extra = {
            xchips = 5,
            Xmult = 5,
            j_onetimeuse = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'One-Time Use',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult and {X:blue,C:white} X5{} Chips,',
            [2] = 'then {C:red}self destructs{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'onetimeuse',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_sp_onetimeuse" and not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "One-Time!", colour = G.C.RED})
                end
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
        end
    end
}

SMODS.Joker{ --Speed Ramp
    name = "Speed Ramp",
    key = "speedramp",
    config = {
        extra = {
            chips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Speed Ramp',
        ['text'] = {
            [1] = 'This joker gains {C:blue}Chips{} at the',
            [2] = 'end of {C:attention}each round{}, but {C:blue}the number{}',
            [3] = '{C:blue}of Chips gained{} keeps doubling.',
            [4] = 'Chips value start at {C:blue}+1{}',
            [5] = '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips){}'
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
    atlas = 'speedramp',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) * 2
                    return true
                end,
                    message = "Double!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}

SMODS.Joker{ --Sacrifice
    name = "Sacrifice",
    key = "sacrifice",
    config = {
        extra = {
            slot_change = 2
        }
    },
    loc_txt = {
        ['name'] = 'Sacrifice',
        ['text'] = {
            [1] = '{C:attention}+2{} Joker slots,',
            [2] = '{C:red}-2{} Consumable slots'
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
    atlas = 'sacrifice',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 2
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = math.max(0, G.consumeables.config.card_limit - card.ability.extra.slot_change)
            return true
        end }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 2
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + card.ability.extra.slot_change
            return true
        end }))
    end
}

SMODS.Joker{ --Sir Baudelaire
    name = "Sir Baudelaire",
    key = "sirbaudelaire",
    config = {
        extra = {
            chips = 400000
        }
    },
    loc_txt = {
        ['name'] = 'Sir Baudelaire',
        ['text'] = {
            [1] = '{C:blue}+400000{} Chips,',
            [2] = '{C:red}-4{} Joker slots'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 17,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'sirbaudelaire',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 4)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 4
    end
}

SMODS.Joker{ --IGOR
    name = "IGOR",
    key = "igor",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'IGOR',
        ['text'] = {
            [1] = 'This joker gains {C:red}+4{} Mult',
            [2] = 'for every {C:attention}4{} scored.',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'igor',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 4 then
                card.ability.extra.mult = (card.ability.extra.mult) + 4
                return {
                    message = "Four!",
                    colour = G.C.PURPLE,
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Ritualist
    name = "Ritualist",
    key = "ritualist",
    config = {
        extra = {
            cons = 1,
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ritualist',
        ['text'] = {
            [1] = 'This joker gains {C:red}+5{} Mult every',
            [2] = 'two {C:attention}consumables{} used',
            [3] = '{C:inactive}(Currently{} {C:red}+#2# {}{C:inactive}Mult){}'
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
    atlas = 'ritualist',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.cons, card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if (card.ability.extra.cons or 0) == 2 then
                return {
                    func = function()
                    card.ability.extra.cons = 1
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 5
                    return true
                end,
                            message = "2/2!",
                            colour = G.C.PURPLE
                        }
                }
            elseif not (card.ability.extra.cons == 2) then
                return {
                    func = function()
                    card.ability.extra.cons = (card.ability.extra.cons) + 1
                    return true
                end,
                    message = "1/2!",
                    colour = G.C.PURPLE
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Straightbroidery
    name = "Straightbroidery",
    key = "straightbroidery",
    config = {
        extra = {
            odds = 4,
            double = 0
        }
    },
    loc_txt = {
        ['name'] = 'Straightbroidery',
        ['text'] = {
            [1] = 'When played hand contains a',
            [2] = '{C:attention}Straight{}, {C:green}1 in 4{} chance to',
            [3] = 'create a {C:attention}Double Tag{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'straightbroidery',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = { key = 'tag_double', set = 'Tag' }
    return { vars = {} }
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Straight"]) then
                if SMODS.pseudorandom_probability(card, 'group_0_953c9bf9', 1, card.ability.extra.odds, 'group_0_953c9bf9') then
                      G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_double")
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Tag!", colour = G.C.GREEN})
                  end
            end
        end
    end
}

SMODS.Joker{ --Stone Sentinel
    name = "Stone Sentinel",
    key = "stonesentinel",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Stone Sentinel',
        ['text'] = {
            [1] = 'Every scored {C:attention}Stone{} card gives {C:red}+5{} Mult'
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
    atlas = 'stonesentinel',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    mult = card.ability.extra.mult,
                    message = "Stone!"
                }
            end
        end
    end
}

SMODS.Joker{ --Glass Glimmer
    name = "Glass Glimmer",
    key = "glassglimmer",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Glass Glimmer',
        ['text'] = {
            [1] = 'Every scored {C:attention}Glass{} card gives {C:red}+5{} Mult'
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
    atlas = 'glassglimmer',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
	end,
    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_glass"] == true then
                return {
                    mult = card.ability.extra.mult,
                    message = "Glass!"
                }
            end
        end
    end
}

SMODS.Joker{ --Steel Spark
    name = "Steel Spark",
    key = "steelspark",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Steel Spark',
        ['text'] = {
            [1] = 'Every scored {C:attention}Steel{} card gives {C:red}+5{} Mult'
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
    atlas = 'steelspark',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    mult = card.ability.extra.mult,
                    message = "Steel!"
                }
            end
        end
    end
}

SMODS.Joker{ --Golden Glean
    name = "Golden Glean",
    key = "goldenglean",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Golden Glean',
        ['text'] = {
            [1] = 'Every scored {C:attention}Gold{} card gives {C:red}+5{} Mult'
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
    atlas = 'goldenglean',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    mult = card.ability.extra.mult,
                    message = "Gold!"
                }
            end
        end
    end
}

SMODS.Joker{ --Lucky Lode
    name = "Lucky Lode",
    key = "luckylode",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Lucky Lode',
        ['text'] = {
            [1] = 'Every scored {C:attention}Lucky{} card gives {C:red}+5{} Mult'
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
    atlas = 'luckylode',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, center)
	info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    mult = card.ability.extra.mult,
                    message = "Lucky!"
                }
            end
        end
    end
}

SMODS.Joker{ --Aura Amp
    name = "Aura Amp",
    key = "auraamp",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Aura Amp',
        ['text'] = {
            [1] = 'Every scored {C:attention}enhanced{}',
            [2] = 'card gives {X:red,C:white}X1.5{} Mult'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'auraamp',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (function()
        local enhancements = SMODS.get_enhancements(context.other_card)
        for k, v in pairs(enhancements) do
            if v then
                return true
            end
        end
        return false
    end)() then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Enhanced!"
                }
            end
        end
    end
}

SMODS.Joker{ --Maximum Load
    name = "Maximum Load",
    key = "maximumload",
    config = {
        extra = {
            freejokerslots = 0,
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Maximum Load',
        ['text'] = {
            [1] = 'If there are {C:red}no{} free',
            [2] = 'joker slots left, {X:red,C:white}X2{} Mult'
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
    unlocked = true,
    discovered = false,
    atlas = 'maximumload',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if 0 == (G.jokers.config.card_limit - #G.jokers.cards) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

SMODS.Joker{ --LeJoker James
    name = "LeJoker James",
    key = "lejokerjames",
    config = {
        extra = {
            Xmult = 2.3,
            chips = 32
        }
    },
    loc_txt = {
        ['name'] = 'LeJoker James',
        ['text'] = {
            [1] = 'If scored card is a {C:attention}6{},',
            [2] = '{X:red,C:white}X2.3{} Mult and {C:blue}+32 {}Chips'
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
    atlas = 'lejokerjames',
    pools = { ["Shuffle"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 6 then
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

SMODS.Joker{ --Nikola Jokić
    name = "Nikola Jokić",
    key = "nikolajokic",
    config = {
        extra = {
            mult = 15,
            odds = 5,
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Nikola Jokić',
        ['text'] = {
            [1] = '{C:red}+15{} Mult {C:attention}most of the time{},',
            [2] = '{C:green}1 in 5{} chance to give',
            [3] = '{X:red,C:white}X1.5{} Mult also'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'nikolajokic',
    pools = { ["Shuffle"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                return {
                    mult = card.ability.extra.mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_70383874', 1, card.ability.extra.odds, 'j_modprefix_nikolajokic') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Joker{ --Handful Fortune
    name = "Handful Fortune",
    key = "handfulfortune",
    config = {
        extra = {
            constant = 20,
            chips = 0,
            cardsinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Handful Fortune',
        ['text'] = {
            [1] = '{C:blue}+20{} Chips for every',
            [2] = 'card in hand',
            [3] = '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
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
    atlas = 'handfulfortune',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.constant, card.ability.extra.chips}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                local constant_value = card.ability.extra.constant
                card.ability.extra.constant = 20
                card.ability.extra.constant = (card.ability.extra.constant) * #(G.hand and G.hand.cards or {})
                card.ability.extra.chips = card.ability.extra.constant
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.constant = 20
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.chips = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.hand_drawn and not context.blueprint then
                local constant_value = card.ability.extra.constant
                return {
                    func = function()
                    card.ability.extra.constant = 20
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.constant = (card.ability.extra.constant) * #(G.hand and G.hand.cards or {})
                    return true
                end,
                        colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.chips = card.ability.extra.constant
                    return true
                end,
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end
}

SMODS.Joker{ --Handful Multiply
    name = "Handful Multiply",
    key = "handfulmultiply",
    config = {
        extra = {
            constant = 20,
            mult = 0,
            cardsinhand = 0
        }
    },
    loc_txt = {
        ['name'] = 'Handful Multiply',
        ['text'] = {
            [1] = '{C:red}+2{} Mult for every',
            [2] = 'card in hand',
            [3] = '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
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
    atlas = 'handfulmultiply',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.constant, card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                local constant_value = card.ability.extra.constant
                card.ability.extra.constant = 2
                card.ability.extra.constant = (card.ability.extra.constant) * #(G.hand and G.hand.cards or {})
                card.ability.extra.mult = card.ability.extra.constant
                return {
                    mult = card.ability.extra.mult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.constant = 2
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.mult = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.hand_drawn and not context.blueprint then
                local constant_value = card.ability.extra.constant
                return {
                    func = function()
                    card.ability.extra.constant = 2
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.constant = (card.ability.extra.constant) * #(G.hand and G.hand.cards or {})
                    return true
                end,
                        colour = G.C.MULT,
                        extra = {
                            func = function()
                    card.ability.extra.mult = card.ability.extra.constant
                    return true
                end,
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end
}

SMODS.Joker{ --Pacer
    name = "Pacer",
    key = "pacer",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pacer',
        ['text'] = {
            [1] = '{C:red}+1{} Mult per hand played',
            [2] = '{C:inactive}(Currently {}{C:red}+#1#{} {C:inactive}Mult){}'
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
    atlas = 'pacer',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                card.ability.extra.mult = (card.ability.extra.mult) + 1
                return {
                    message = "Indiana!",
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
        end
    end
}

SMODS.Joker{ --Opening Gambit
    name = "Opening Gambit",
    key = "openinggambit",
    config = {
        extra = {
            chips = 50,
            mult = 3
        }
    },
    loc_txt = {
        ['name'] = 'Opening Gambit',
        ['text'] = {
            [1] = 'First scored card of round gives',
            [2] = '{C:blue}+50{} Chips and {C:red}+3{} Mult'
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
    atlas = 'openinggambit',
    pools = { ["Shuffle"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (G.GAME.current_round.hands_played == 0 and context.other_card == context.scoring_hand[1]) then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
            end
        end
    end
}

SMODS.Joker{ --Two Sides
    name = "Two Sides",
    key = "twosides",
    config = {
        extra = {
            chips = 0,
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Two Sides',
        ['text'] = {
            [1] = 'Gains {C:blue}+1{} Chip if scored card',
            [2] = 'is a {C:spades}Spade{} or {C:clubs}Club{} suit,',
            [3] = 'gains {C:red}+0.5{} Mult if scored card',
            [4] = 'is a {C:hearts}Heart{} or {C:diamonds}Diamond{} suit',
            [5] = '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips{} {C:inactive}and{} {C:red}+#2#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'twosides',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                card.ability.extra.chips = (card.ability.extra.chips) + 5
                return {
                    message = "Black!"
                }
            elseif context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                card.ability.extra.mult = (card.ability.extra.mult) + 5
                return {
                    message = "Red!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.chips,
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
        end
    end
}

SMODS.Joker{ --Cosmic Dust
    name = "Cosmic Dust",
    key = "cosmicdust",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cosmic Dust',
        ['text'] = {
            [1] = 'Each time a card is',
            [2] = '{C:attention}destroyed{} or {C:attention}sold{}, this',
            [3] = 'joker gains {X:red,C:white}+X0.75{} Mult',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
    atlas = 'cosmicdust',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.75
                    return true
                end,
                    message = "Cosmic!"
                }
        end
        if context.remove_playing_cards and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.75
                    return true
                end,
                    message = "Cosmic!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Joker{ --Quintet Reward
    name = "Quintet Reward",
    key = "quintetreward",
    config = {
        extra = {
            chips = 0,
            odds = 6,
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Quintet Reward',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+40{} Chips',
            [2] = 'and a {C:green}1 in 6{} chance to give',
            [3] = '{X:red,C:white}X1.5{} Mult if played hand',
            [4] = 'has {C:attention}5{} scoring cards',
            [5] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'quintetreward',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_quintetreward') --Please-work
        return {vars = {card.ability.extra.chips, new_numerator, new_denominator}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if #context.scoring_hand == 5 then
                card.ability.extra.chips = (card.ability.extra.chips) + 40
                return {
                    chips = card.ability.extra.chips
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_3a72250c', 1, card.ability.extra.odds, 'j_modprefix_quintetreward') then
                      SMODS.calculate_effect({Xmult = card.ability.extra.Xmult}, card)
                  end
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Joker{ --Straight to Business
    name = "Straight to Business",
    key = "straighttobusiness",
    config = {
        extra = {
            dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Straight to Business',
        ['text'] = {
            [1] = 'If hand played contains',
            [2] = 'a {C:attention}Straight{}, earn {C:money}$5{}'
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
    atlas = 'straighttobusiness',
    pools = { ["Shuffle"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if next(context.poker_hands["Straight"]) then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
}

SMODS.Joker{ --Point Guard
    name = "Point Guard",
    key = "pointguard",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Point Guard',
        ['text'] = {
            [1] = 'If hand played is a',
            [2] = '{C:attention}High Card{}, this joker',
            [3] = 'gains {C:red}+10{} Mult',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
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
    unlocked = true,
    discovered = false,
    atlas = 'pointguard',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if context.scoring_name == "High Card" then
                card.ability.extra.mult = (card.ability.extra.mult) + 10
                return {
                    message = "The One!",
                    extra = {
                        mult = card.ability.extra.mult
                        }
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}

SMODS.Joker{ --All Wild
    name = "All Wild",
    key = "allwild",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'All Wild',
        ['text'] = {
            [1] = 'Every scored card is',
            [2] = 'turned into a {C:attention}Wild{} card,',
            [3] = '{C:green}1 in 4{} chance it will',
            [4] = 'also have a {C:attention}Red{} Seal'
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
    atlas = 'allwild',
    pools = { ["Shuffle"] = true },

    	loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        info_queue[#info_queue + 1] = G.P_SEALS.Red
	end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,


    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if true then
                context.other_card:set_ability(G.P_CENTERS.m_wild)
                return {
                    message = "Card Modified!"
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_da5caf1a', 1, card.ability.extra.odds, 'j_modprefix_allwild') then
                      context.other_card:set_seal("Red", true)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.YELLOW})
                  end
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Joker{ --Number Line
    name = "Number Line",
    key = "numberline",
    config = {
        extra = {
            highestrankinhand = 0,
            lowestrankinhand = 0,
            Xmult = 1.5,
            xchips = 2
        }
    },
    loc_txt = {
        ['name'] = 'Number Line',
        ['text'] = {
            [1] = 'This joker gives {X:red,C:white}X1.5{}',
            [2] = 'Mult and {X:blue,C:white}X2{} Chips if',
            [3] = 'the highest rank in hand',
            [4] = 'is an {C:attention}Ace{} and the lowest',
            [5] = 'rank in hand is a {C:attention}2{}'
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
    unlocked = true,
    discovered = false,
    atlas = 'numberline',
    pools = { ["Shuffle"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (14 == (function() local max = 0; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id > max then max = card.base.id end end; return max end)() and 2 == (function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)()) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        x_chips = card.ability.extra.xchips,
                        colour = G.C.DARK_EDITION
                        }
                }
            end
        end
    end
}

SMODS.Joker{ --Luka Dončić
    name = "Luka Dončić",
    key = "lukadoncic",
    config = {
        extra = {
            xchips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Luka Dončić',
        ['text'] = {
            [1] = 'This joker gains {X:blue,C:white}+X0.5{} Chips',
            [2] = 'if only two {C:attention}7{}s are scored',
            [3] = '{C:inactive}(Currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'lukadoncic',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (#context.scoring_hand == 2 and (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 7 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 2
end)()) then
                card.ability.extra.xchips = (card.ability.extra.xchips) + 0.5
                return {
                    message = "Luka!",
                    extra = {
                        x_chips = card.ability.extra.xchips,
                        colour = G.C.YELLOW
                        }
                }
            else
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}

SMODS.Joker{ --Bering Strait
    name = "Bering Strait",
    key = "beringstrait",
    config = {
        extra = {
            hand_size = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bering Strait',
        ['text'] = {
            [1] = 'If played hand is a',
            [2] = '{C:attention}Straight{}, {C:attention}+1{} Hand size'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 23,
    rarity = "sp_unfair",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'beringstrait',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if context.scoring_name == "Straight" then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hand_size).." Hand Size", colour = G.C.BLUE})
                G.hand:change_size(card.ability.extra.hand_size)
                return true
            end
                }
            end
        end
    end
}

SMODS.Joker{ --Lemniscate
    key = "lemniscate",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Lemniscate',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}XX2.622{}',
            [2] = 'Mult for every scored',
            [3] = '{C:attention}8{}, {C:attention}3{}, {C:attention}4{}, and {C:attention}6{}',
            [4] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 24,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'lemniscate',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 8 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6) then
                card.ability.extra.xmult = (card.ability.extra.xmult) * 2.622
                return {
                    message = "Lemniscate!"
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

SMODS.Joker{ --Toad
    name = "Toad",
    key = "toad",
    config = {
        extra = {
            eeemult = 1,
        }
    },
    loc_txt = {
        ['name'] = 'Toad',
        ['text'] = {
            [1] = '{X:edition,C:white}+^^^1{} Mult for each Blind',
            [2] = '{C:attention}skipped{} this run',
            [3] = '{C:inactive}(Currently{} {X:edition,C:white}^^^#1#{} {C:inactive}Mult){}',
            [4] = '{X:edition,C:white,s:0.8}^^^{} {s:0.8}is pentation, the fifth hyperoperation{}'
        }
    },
    pos = { x = 0, y = 0 },
    cost = 888,
    rarity = "sp_unfair",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'toad',

    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.eeemult) } }
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.eeemult = (card.ability.extra.eeemult) + 1
                    return true
                end,
                    message = "Hop!"
                }
        end

        if context.cardarea == G.jokers and context.joker_main then
            return {
                message = "^^^" .. lenient_bignum(card.ability.extra.eeemult) .. " Mult",
                EEEmult_mod = lenient_bignum(card.ability.extra.eeemult),
                colour = G.C.EDITION,
            }
        end
    end
}

SMODS.Joker{ --Jimbro
    key = "jimbro",
    config = {
        extra = {
            mult = 7625597484987
        }
    },
    loc_txt = {
        ['name'] = 'Jimbro',
        ['text'] = {
            [1] = '{C:red}+7625597484987{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 92,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jimbro',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Unfair Ruler
    key = "unfairruler",
    config = {
        extra = {
            expmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Unfair Ruler',
        ['text'] = {
            [1] = 'This Joker gains {C:purple}+^2{} Mult',
            [2] = 'if played hand contains',
            [3] = 'a {C:attention}Straight{}',
            [4] = '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = { x = 1, y = 0 },
    cost = 20,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'unfairruler',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.expmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                card.ability.extra.expmult = (card.ability.extra.expmult) + 2
                return {
                    message = "Straight!",
                    extra = {
                        e_mult = card.ability.extra.expmult,
                        colour = G.C.DARK_EDITION
                        }
                }
            else
                return {
                    e_mult = card.ability.extra.expmult
                }
            end
        end
    end
}

SMODS.Joker{ --Jackfruit
    key = "jackfruit",
    config = {
        extra = {
            retriggersleft = 14,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Jackfruit',
        ['text'] = {
            [1] = '{C:attention}Retriggers{} the next',
            [2] = '{C:attention}#1#{} scored Jacks'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jackfruit',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.retriggersleft}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (card.ability.extra.retriggersleft > 0 and context.other_card:get_id() == 11) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "Jack!"
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (card.ability.extra.retriggersleft > 0 and context.other_card:get_id() == 11) then
                card.ability.extra.retriggersleft = math.max(0, (card.ability.extra.retriggersleft) - 0.5)
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if card.ability.extra.retriggersleft == 0 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            end
        end
    end
}

SMODS.Joker{ -- Double Bongcloud
    key = "doublebongcloud",
    config = {
        extra = {
            eemult = 1,
        }
    },
    loc_txt = {
        ['name'] = 'Double Bongcloud',
        ['text'] = {
            [1] = 'This Joker gains {C:edition}+^^4{} Mult',
            [2] = 'if the {C:blue}first hand{} of round',
            [3] = 'has {C:attention}only two scoring rank 13 cards{}',
            [4] = '{C:inactive}(Currently{} {C:edition}^^#1#{} {C:inactive}Mult){}',
            [5] = '{C:edition,s:0.8}^^{} {s:0.8}is tetration, the fourth hyperoperation{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = { x = 0, y = 0 },
    cost = 115,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'doublebongcloud',

    loc_vars = function(self, info_queue, card)
        return { vars = { lenient_bignum(card.ability.extra.eemult) } }
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        -- First hand condition
        if context.before and G.GAME.current_round.hands_played == 0 and context.full_hand then
            if #context.full_hand == 2 then
                local count = 0
                for _, c in ipairs(context.full_hand) do
                    if c:get_id() == 13 then
                        count = count + 1
                    end
                end
                if count == 2 then
                    card.ability.extra.eemult = card.ability.extra.eemult + 4
                    return {
                        message = "Bongcloud!",
                        colour = G.C.EDITION
                    }
                end
            end
        end

        -- Show multiplier when active
        if context.cardarea == G.jokers and context.joker_main then
            return {
                message = "^^" .. lenient_bignum(card.ability.extra.eemult) .. " Mult",
                EEmult_mod = lenient_bignum(card.ability.extra.eemult),
                colour = G.C.EDITION,
            }
        end
    end
}

SMODS.Joker{ --Freddy Fazbear
    key = "freddyfazbear",
    config = {
        extra = {
            repetitions = 5
        }
    },
    loc_txt = {
        ['name'] = 'Freddy Fazbear',
        ['text'] = {
            [1] = 'Retriggers {C:attention}Aces{}, {C:attention}9{}s, {C:attention}8{}s,',
            [2] = 'and {C:attention}7{}s five times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'freddyfazbear',
    pools = { ["Shuffle"] = true },

        in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 9 or context.other_card:get_id() == 8 or context.other_card:get_id() == 7) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "O Cholera!"
                }
            end
        end
    end
}

SMODS.Joker{ --Bonnie the Bunny
    key = "bonniebunny",
    config = {
        extra = {
            xchips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bonnie the Bunny',
        ['text'] = {
            [1] = 'This joker gains {X:blue,C:white}+X0.5{} Chips',
            [2] = 'every time a {C:attention}leftmost card{}',
            [3] = 'is triggered in a {C:attention}five-card',
            [4] = 'hand{}',
            [5] = '{C:inactive}(Currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'bonniebunny',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (#context.scoring_hand == 5 and context.other_card == context.scoring_hand[1]) then
                card.ability.extra.xchips = (card.ability.extra.xchips) + 0.5
                return {
                    message = "Bonnie!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
    end
}

SMODS.Joker{ --Chica the Chicken
    key = "chicachicken",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Chica the Chicken',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}+X0.5{} Mult',
            [2] = 'every time a {C:attention}rightmost card{}',
            [3] = 'is triggered in a {C:attention}five-card',
            [4] = 'hand{}',
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
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'chicachicken',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (#context.scoring_hand == 5 and context.other_card == context.scoring_hand[5]) then
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                return {
                    message = "Chica!"
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

SMODS.Joker{ --Foxy the Pirate Fox
    key = "foxy",
    config = {
        extra = {
            money = 0
        }
    },
    loc_txt = {
        ['name'] = 'Foxy the Pirate Fox',
        ['text'] = {
            [1] = 'This joker gains {C:money}+$5{}',
            [2] = 'if played hand contains',
            [3] = 'a {C:attention}Straight{}, total money',
            [4] = 'will be given at {C:attention}payout{}',
            [5] = '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 15,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'foxy',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.money}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                card.ability.extra.money = (card.ability.extra.money) + 5
                return {
                    message = "Yarr har har!"
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = card.ability.extra.money
                }
        end
    end
}

SMODS.Joker{ --Noisy Joker
    key = "noisyjoker",
    config = {
        extra = {
            mult = 0,
            odds = 2,
            odds2 = 4,
            odds3 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Noisy Joker',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to gain {C:red}+2{} Mult for',
            [2] = 'every scored card, {C:green}1 in 4{} chance to',
            [3] = 'lose {C:red}-1{} Mult for every scored card,',
            [4] = '{C:green}1 in 10{} chance to gain {C:red}+10{} Mult for',
            [5] = 'every scored card',
            [6] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
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
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'noisyjoker',
    pools = { ["Shuffle"] = true },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_noisyjoker')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_modprefix_noisyjoker')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_modprefix_noisyjoker')
        return {vars = {card.ability.extra.mult, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d64d1402', 1, card.ability.extra.odds, 'j_modprefix_noisyjoker') then
                      card.ability.extra.mult = (card.ability.extra.mult) + 2
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Noisy!", colour = G.C.GREEN})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_0357f99a', 1, card.ability.extra.odds2, 'j_modprefix_noisyjoker') then
                      card.ability.extra.mult = math.max(0, (card.ability.extra.mult) - 1)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Noisy!", colour = G.C.RED})
                  end
                if SMODS.pseudorandom_probability(card, 'group_2_a4083ee6', 1, card.ability.extra.odds3, 'j_modprefix_noisyjoker') then
                      card.ability.extra.mult = (card.ability.extra.mult) + 10
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Noisy!", colour = G.C.GREEN})
                  end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

function exponentiation(val, pow)
    return val ^ pow
end

SMODS.Joker{ --Speedrunner
    key = "speedrunner",
    config = {
        extra = {
            emult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Speedrunner',
        ['text'] = {
            [1] = 'This Joker gains {C:purple}^(^12){} Mult',
            [2] = 'if played hand contains a {C:attention}Straight{}.',
            [3] = '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = { x = 0, y = 0 },
    display_size = { w = 71, h = 95 },
    cost = 55,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'speedrunner',

        -- this makes #1# in loc_txt show the current emult value
    loc_vars = function(self, info_queue, card)
        return { vars = { string.format("%.6g", card.ability.extra.emult) } }
    end,

    in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            -- if straight: update stored value first
            if context.poker_hands and context.poker_hands["Straight"] and next(context.poker_hands["Straight"]) then
                card.ability.extra.emult = exponentiation(card.ability.extra.emult, 12)
            end
            -- always apply ^emult mult
            return {
                x_mult = card.ability.extra.emult,
                message = "^" .. card.ability.extra.emult .. " Mult",
                colour = G.C.PURPLE
            }
        end
    end
}

SMODS.Joker{ --Cantaloupe
    key = "cantaloupe",
    config = {
        extra = {
            emult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Cantaloupe',
        ['text'] = {
            [1] = 'This joker gains {C:purple}^(+7){}',
            [2] = 'Mult if played hand',
            [3] = 'contains a {C:attention}Full House{}',
            [4] = '{C:inactive}(Currently {}{C:purple}^#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = { x = 1, y = 0 },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'cantaloupe',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'jud' 
          or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.emult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Full House"]) then
                card.ability.extra.emult = (card.ability.extra.emult) + 7
                return {
                    message = "Yahi!",
                    extra = {
                        e_mult = card.ability.extra.emult,
                        colour = G.C.PURPLE
                        }
                }
            else
                return {
                    e_mult = card.ability.extra.emult,
                    message = "^" .. card.ability.extra.emult .. " Mult",
                    colour = G.C.PURPLE
                }
            end
        end
    end
}

SMODS.Joker{ --Crazy Hamburger
    key = "crazyhamburger",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Crazy Hamburger',
        ['text'] = {
            [1] = 'This burger gains {C:purple}^+12{}',
            [2] = 'Mult every round if {C:attention}Crazy{}',
            [3] = '{C:attention}Joker{} is present',
            [4] = '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
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
    cost = 40,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'crazyhamburger',

loc_vars = function(self, info_queue, card)
    -- add crazy joker text to tooltip
    info_queue[#info_queue + 1] = G.P_CENTERS.j_crazy
    
    -- return your custom vars
    return {
        vars = {
            card.ability.extra.mult
        }
    }
end,

in_pool = function(self, args)
    for _, j in ipairs(G.jokers.cards) do
        if j.config.center.key == self.key then
            return false
        end
    end
    return true
end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_crazy" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 12
                    return true
                end,
                    message = "CRAZY HAMBURGOR!!!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --The Crazy of Joker
    key = "thecrazyofjoker",
    config = {
        extra = {
            hypermult_n = 12,
            hypermult_arrows = 3
        }
    },
    loc_txt = {
        ['name'] = 'The Crazy of Joker',
        ['text'] = {
            [1] = '{X:edition,C:white}^^^12{} Mult if played',
            [2] = 'hand contains a {C:attention}Straight{}'
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
    cost = 99,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'crazyofjoker',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                return {
                    hypermult = {
    card.ability.extra.hypermult_arrows,
    card.ability.extra.hypermult_n
}
                }
            end
        end
    end
}

SMODS.Joker{ --The Joke of 87
    key = "thejokeof87",
    config = {
        extra = {
            var1 = 5
        }
    },
    loc_txt = {
        ['name'] = 'The Joke of 87',
        ['text'] = {
            [1] = 'If played hand contains an',
            [2] = '{C:attention}8{} and a {C:attention}7{}, create #1#',
            [3] = '{C:dark_edition}Negative{} {C:attention}Freddy Fazbears{}',
            [4] = 'and increase number by {C:attention}5{}'
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
    cost = 87,
    rarity = "sp_unfair",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'thejokeof87',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        info_queue[#info_queue + 1] = G.P_CENTERS.j_sp_freddyfazbear
        return {vars = {card.ability.extra.var1}}
        
    end,

   calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main then
        if ((function()
            local rankCount = 0
            for _, c in ipairs(context.full_hand) do
                if c:get_id() == 8 then
                    rankCount = rankCount + 1
                end
            end
            return rankCount >= 1
        end)() and (function()
            local rankCount = 0
            for _, c in ipairs(context.full_hand) do
                if c:get_id() == 7 then
                    rankCount = rankCount + 1
                end
            end
            return rankCount >= 1
        end)()) then

            -- store current value before increment
            local to_create = card.ability.extra.var1

            for i = 1, to_create do
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_sp_freddyfazbear' })
                        if joker_card then
                            joker_card:set_edition("e_negative", true)
                        end
                        return true
                    end
                }))
            end

            -- now increment AFTER spawning
            card.ability.extra.var1 = card.ability.extra.var1 + 5
        end
    end
end

}

SMODS.Joker{ --Sealed Package
    key = "sealedpackage",
    config = {
        extra = {
            repetitions = 5
        }
    },
    loc_txt = {
        ['name'] = 'Sealed Package',
        ['text'] = {
            [1] = 'When {C:attention}Boss Blind{} is selected,',
            [2] = 'creates {C:attention}5{} random playing',
            [3] = 'cards with a {C:attention}random seal{}',
            [4] = 'and draws it to hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'sealedpackage',
    pools = { ["Shuffle"] = true },

    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                for i = 1, card.ability.extra.repetitions do
              SMODS.calculate_effect({func = function()
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.c_base
                }, G.discard, true, false, nil, true)
            new_card:set_seal(pseudorandom_element({"Gold", "Red", "Blue", "Purple"}, pseudoseed('add_card_hand_seal')), true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card to Hand!", colour = G.C.GREEN})
          end
            end
        end
    end
}

SMODS.Joker{ --Ninety-Seven
    key = "ninetyseven",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ninety-Seven',
        ['text'] = {
            [1] = 'Copies the leftmost',
            [2] = 'joker {C:attention}97{} times'
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
    cost = 97,
    rarity = "sp_exquisite",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'placeholder',
    pools = { ["Shuffle"] = true },
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = 97,
                extra = {
                    x_chips = 97,
                    colour = G.C.DARK_EDITION
                }
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_joker_slots = G.jokers.config.card_limit
        G.jokers.config.card_limit = 97
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_joker_slots then
            G.jokers.config.card_limit = card.ability.extra.original_joker_slots
        end
    end
}


SMODS.Joker{ --Jackpot
    key = "jackpot",
    config = {
        extra = {
            dollars0 = 2,
            odds = 18,
            odds2 = 135,
            dollars = 20,
            dollars2 = 777
        }
    },
    loc_txt = {
        ['name'] = 'Jackpot',
        ['text'] = {
            [1] = 'Scored {C:attention}Jacks{} give {C:money}+$2{},',
            [2] = '{C:green}1 in 18{} chance to also give {C:money}+$20{},',
            [3] = '{C:green}1 in 135{} chance to also give {C:money}+$777{}'
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
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'placeholder',
    pools = { ["Shuffle"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_jackpot')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_modprefix_jackpot')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        -- Jacks = base value 11
        if context.other_card:get_id() == 11 then
            
            return {
                func = function()
                    -- +2 dollars always
                    ease_dollars(2)
                    card_eval_status_text(
                        context.blueprint_card or card,
                        'extra', nil, nil, nil,
                        {message = "+2", colour = G.C.MONEY}
                    )

                    -- 1-in-odds → +20
                    if SMODS.pseudorandom_probability(
                        card, 'jackpot_group_20',
                        1, card.ability.extra.odds,
                        'j_modprefix_jackpot',
                        false
                    ) then

                        SMODS.calculate_effect({
                            func = function()
                                ease_dollars(20)
                                card_eval_status_text(
                                    context.blueprint_card or card,
                                    'extra', nil, nil, nil,
                                    {message = "+20", colour = G.C.MONEY}
                                )
                                return true
                            end
                        }, card)
                    end

                    -- 1-in-odds2 → +777
                    if SMODS.pseudorandom_probability(
                        card, 'jackpot_group_777',
                        1, card.ability.extra.odds2,
                        'j_modprefix_jackpot',
                        false
                    ) then

                        SMODS.calculate_effect({
                            func = function()
                                ease_dollars(777)
                                card_eval_status_text(
                                    context.blueprint_card or card,
                                    'extra', nil, nil, nil,
                                    {message = "+777", colour = G.C.MONEY}
                                )
                                return true
                            end
                        }, card)
                    end

                    return true
                end
            }
        end
    end
end
}

SMODS.Joker{ --All In One
    key = "allinone",
    config = {
        extra = {
            xmult = 1,
            count = 0,
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'All In One',
        ['text'] = {
            [1] = 'Scored {C:attention}face cards{} give {X:red,C:white}X1.5{} Mult when scored,',
            [2] = 'this Joker gains {X:red,C:white}+X0.75{} Mult when a {C:attention}face card{}',
            [3] = 'is {C:red}destroyed{}, this Joker gains {X:red,C:white}+X0.75{} Mult for',
            [4] = 'every {C:attention}25{} cards discarded, {C:attention}disables{} effect of',
            [5] = 'every boss blind, creates a {C:dark_edition}Negative{} copy of',
            [6] = 'a random consumable at the end of the shop',
            [7] = '{C:inactive}(Currently {}{X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
    cost = 40,
    rarity = 'sp_exquisite',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'placeholder',
    pools = { ["Shuffle"] = true },
    
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {vars = {card.ability.extra.xmult, card.ability.extra.count }}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    Xmult = 1.5
                }
            end
        end
        if context.remove_playing_cards  then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    func = function()
                        card.ability.extra.xmult = (card.ability.extra.xmult) + 0.75
                        return true
                    end,
                    message = "Upgrade!"
                }
            end
        end
        if context.discard  then
            if to_big((card.ability.extra.count or 0)) == to_big(24) then
                return {
                    func = function()
                        card.ability.extra.xmult = (card.ability.extra.xmult) + 0.75
                        return true
                    end,
                    message = "Upgrade!",
                    extra = {
                        func = function()
                            card.ability.extra.count = 0
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            elseif not (to_big((card.ability.extra.count or 0)) == to_big(24)) then
                return {
                    func = function()
                        card.ability.extra.count = (card.ability.extra.count) + 1
                        return true
                    end
                }
            end
        end
        if context.ending_shop  then
            if to_big(#G.consumeables.cards) >= to_big(1) then
                return {
                    func = function()
                        local target_cards = {}
                        for i, consumable in ipairs(G.consumeables.cards) do
                            table.insert(target_cards, consumable)
                        end
                        if #target_cards > 0  then
                            local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                            
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local copied_card = copy_card(card_to_copy)
                                    copied_card:set_edition("e_negative", true)
                                    copied_card:add_to_deck()
                                    G.consumeables:emplace(copied_card)
                                    
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied!", colour = G.C.GREEN})
                        end
                        return true
                    end
                }
            end
        end
        
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
            SMODS.calculate_effect({ message = "Disabled!" }, card)
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            play_sound('timpani')
            SMODS.calculate_effect({ message = "Disabled!" }, card)
        end
        
    end
}

SMODS.Joker{ --Centennium
    key = "centennium",
    config = {
        extra = {
            slot_change = '100',
            hand_size_increase = '10',
            play_size_increase = '10',
            xchips0 = 100,
            xmult0 = 100,
            dollars0 = 100
        }
    },
    loc_txt = {
        ['name'] = 'Centennium',
        ['text'] = {
            [1] = '{X:blue,C:white}X100{} Chips, {X:red,C:white}X100{} Mult,',
            [2] = '{X:money,C:white}X$100{}, {C:attention}+100{} Joker slots,',
            [3] = '{C:attention}+100{} Consumable slots,',
            [4] = '{C:attention}+10{} Hand size,',
            [5] = '{C:attention}+10{} card selection limit'
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
    cost = 50,
    rarity = 'sp_exquisite',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'placeholder',
    pools = { ["Shuffle"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = 100,
                extra = {
                    Xmult = 100,
                    extra = {
                        
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars * 100
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X$"..tostring(100), colour = G.C.MONEY})
                            return true
                        end,
                        colour = G.C.MONEY
                    }
                }
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 100
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit + 100
            return true
        end }))
        G.hand:change_size(10)
        SMODS.change_play_limit(10)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 100
        G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - 100
            return true
        end }))
        G.hand:change_size(-10)
        SMODS.change_play_limit(-10)
    end
}