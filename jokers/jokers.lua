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
    path = "deckhugger.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "landlord",
    path = "landlord.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "cowboyfromhell",
    path = "cfh.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "woodenruler",
    path = "woodenruler.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "skyline",
    path = "skyline.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "tamerlane",
    path = "tamerlane.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "moodring",
    path = "moodring.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "juler",
    path = "juler.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "ragazzo",
    path = "ragazzo.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "symmetry",
    path = "symmetry.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "finisher",
    path = "finisher.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sparechange",
    path = "sparechange.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sparedollars",
    path = "sparedollars.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "jackboys",
    path = "jackboys.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "placeholder",
    path = "placeholder.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "entanglement",
    path = "entanglement.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "measurement",
    path = "measurement.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "checkpoint",
    path = "checkpoint.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "alchemist",
    path = "alchemist.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "topup",
    path = "topup.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "virus",
    path = "virus.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "triangular",
    path = "triangularjoker.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "resonance",
    path = "resonance.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "frog",
    path = "frog.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "encore",
    path = "encore.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "scrapheap",
    path = "scrapheap.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lonewolf",
    path = "lonewolf.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "coinflip",
    path = "coinflip.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "blackcat",
    path = "blackcat.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "luckybreak",
    path = "luckybreak.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "apex",
    path = "apexjoker.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "onetimeuse",
    path = "onetimeuse.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "speedramp",
    path = "speedramp.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sacrifice",
    path = "sacrifice.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sirbaudelaire",
    path = "sirbaudelaire.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "igor",
    path = "igor.png",
    px = 71,
    py = 95 
})

SMODS.Atlas({
    key = "ritualist",
    path = "ritualist.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "straightbroidery",
    path = "straightbroidery.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "stonesentinel",
    path = "stonesentinel.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "glassglimmer",
    path = "glassglimmer.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "steelspark",
    path = "steelspark.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "goldenglean",
    path = "goldenglean.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "luckylode",
    path = "luckylode.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "auraamp",
    path = "auraamp.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "maximumload",
    path = "maximumload.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lejokerjames",
    path = "lejokerjames.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "nikolajokic",
    path = "nikolajokic.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "handfulfortune",
    path = "handfulfortune.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "handfulmultiply",
    path = "handfulmult.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "pacer",
    path = "pacer.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "openinggambit",
    path = "openinggambit.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "twosides",
    path = "twosides.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "cosmicdust",
    path = "cosmicdust.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "quintetreward",
    path = "quintent.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "straighttobusiness",
    path = "stb.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "pointguard",
    path = "pointguard.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "allwild",
    path = "allwild.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "numberline",
    path = "numberline.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lukadoncic",
    path = "lukadoncic.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "beringstrait",
    path = "beringstrait.png",
    px = 71,
    py = 95
})



----------------------------------------------------------------------------------------------------------------------------

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
    unlocked = true,
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
    cost = 5,
    rarity = 2,
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
    blueprint_compat = false,
    eternal_compat = false,
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
                    saved = localize('shufflepuffle_saved_checkpoint'),
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
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

   loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.expmult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.constant, card.ability.extra.chips}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.cons, card.ability.extra.mult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.constant, card.ability.extra.chips}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.constant, card.ability.extra.mult}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
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
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'twosides',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:is_suit("Spades") or context.other_card:is_suit("Clubs") then
                card.ability.extra.chips = (card.ability.extra.chips) + 1
                return {
                    message = "Black!"
                }
            elseif context.other_card:is_suit("Hearts") or context.other_card:is_suit("Diamonds") then
                card.ability.extra.mult = (card.ability.extra.mult) + 0.5
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
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

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_quintetreward') --Please-work
        return {vars = {card.ability.extra.chips, new_numerator, new_denominator}}
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips}}
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