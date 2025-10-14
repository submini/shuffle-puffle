SMODS.Blind {
    key = "day",
    atlas = 'blinds1',
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 0 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("d6563c"), -- a reddish tint fits the theme
    loc_txt = {
        name = "The Day",
        text = {
            "All Hearts and Diamonds",
            "are drawn face down"
        }
    },

    calculate = function(self, blind, context)
        if blind.disabled then return end

        -- When drawing cards
        if context.stay_flipped and context.to_area == G.hand then
            local card = context.other_card or context.card
            if card and (card.base.suit == "Hearts" or card.base.suit == "Diamonds") then
                return {
                    stay_flipped = true
                }
            end
        end
    end,

    disable = function(self)
        -- Flip any still-facedown Hearts or Diamonds back up
        for _, c in ipairs(G.hand.cards) do
            if c.facing == "back" and (c.base.suit == "Hearts" or c.base.suit == "Diamonds") then
                c:flip()
            end
        end
        for _, c in pairs(G.playing_cards) do
            c.ability.wheel_flipped = nil
        end
    end
}

SMODS.Blind {
    key = "night",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 1 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("1f38a6"),

    calculate = function(self, blind, context)
        if blind.disabled then return end

        -- When drawing cards
        if context.stay_flipped and context.to_area == G.hand then
            local card = context.other_card or context.card
            if card and (card.base.suit == "Clubs" or card.base.suit == "Spades") then
                return {
                    stay_flipped = true
                }
            end
        end
    end,

    disable = function(self)
        -- Flip any still-facedown Hearts or Diamonds back up
        for _, c in ipairs(G.hand.cards) do
            if c.facing == "back" and (c.base.suit == "Clubs" or c.base.suit == "Spades") then
                c:flip()
            end
        end
        for _, c in pairs(G.playing_cards) do
            c.ability.wheel_flipped = nil
        end
    end
}

SMODS.Blind {
    key = "tetrad",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    debuff = { h_size_ge = 4, h_size_le = 4 },
    pos = { x = 0, y = 2 },
    boss = { min = 2, max = 10 },
    boss_colour = HEX("3a9c6f"),
}

SMODS.Blind {
    key = "down",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 3 },
    boss = { min = 4, max = 10 },
    boss_colour = HEX("cf3853"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            -- This triggers during the check for debuff_card
            if context.debuff_card then
                local card = context.debuff_card
                -- Ensure it's a playing card (not joker/consumable)
                if card.ability and card.ability.set == "Enhanced" then
                    return {
                        debuff = true
                    }
                end
            end
        end
    end
}

SMODS.Blind {
    key = "anti",
    dollars = 5,
    atlas = 'blinds1',
    mult = 0.5,
    pos = { x = 0, y = 4 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("888888"),
}

SMODS.Blind {
    key = "67",
    dollars = 5,
    mult = 1.67,
    atlas = 'blinds1',
    pos = { x = 0, y = 5 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("444444"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            -- Debuff check for each individual card
            if context.debuff_card then
                local card = context.debuff_card
                local rank = card.base.value

                -- Handle both string and numeric rank formats safely
                local rank_str = tostring(rank):lower()
                if rank_str == "6" or rank_str == "7" or rank_str == "six" or rank_str == "seven" then
                    return { debuff = true }
                end
            end
        end
    end
}

SMODS.Blind {
    key = "face",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 6 },
    boss = { min = 4, max = 10 },
    boss_colour = HEX("d19e47"),
    calculate = function(self, blind, context)
        if not blind.disabled and context.debuff_card then
            local c = context.debuff_card
            -- Only apply to numbered cards 2–10 (exclude Aces and face cards)
            local val = tonumber(c.base.value)
            if val and val >= 2 and val <= 10 then
                return { debuff = true }
            end
        end
    end
}

SMODS.Blind {
    key = "derivative",
    dollars = 5,
    mult = 2,
    atlas = 'blinds2',
    pos = { x = 0, y = 2 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("6aad51"),

    calculate = function(self, blind, context)
        -- When a hand is being checked for debuffs
        if context.debuff_hand then
            local name = context.scoring_name
            if name == "Straight" or name == "Straight Flush" or name == "Royal Flush" then
                -- Return a table with a proper card list (even if empty)
                return {
                    debuff = true,
                    cards = context.full_hand or {} -- prevent nil crashes
                }
            end
        end
    end
}

SMODS.Blind {
    key = "integral",
    dollars = 5,
    mult = 1.5,
    atlas = 'blinds2',
    pos = { x = 0, y = 3 },
    boss = { min = 2, max = 10 },
    boss_colour = HEX("ad5151"),

    calculate = function(self, blind, context)
        if context.debuff_hand then
            local name = context.scoring_name
            -- debuff everything EXCEPT straight-type hands
            if name ~= "Straight" and name ~= "Straight Flush" and name ~= "Royal Flush" then
                return {
                    debuff = true,
                    cards = context.full_hand or {}
                }
            end
        end
    end
}

-- The Sine
SMODS.Blind {
    key = "sine",
    dollars = 5,
    mult = 1,
    atlas = 'blinds2',
    pos = { x = 0, y = 0 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("30a6d1"),

    -- Called during various calculation contexts. We use it to trigger debuff checks
    calculate = function(self, blind, context)
        if not blind.disabled then
            -- mark active when the blind is chosen
            if context.setting_blind then
                blind.active = true
            end

            -- When the game asks if a specific card should be debuffed
            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                -- recalc_debuff returns true if the card is considered debuffed by this blind
                if self:recalc_debuff(context.debuff_card, false) then
                    blind.triggered = true
                    return {
                        debuff = true
                    }
                end
            end

            -- clean up per-hand
            if context.hand_drawn then
                blind.active = nil
            end
        end
    end,

    -- Decide which cards are debuffed. Return true if the card is debuffed.
    -- This will also set card.debuff = true so the engine recognizes it.
    recalc_debuff = function(self, card, from_blind)
        if not card or not card.base or not card.base.value then return false end

        local v = card.base.value
        local rank_num = nil
        local rank_str = nil

        -- normalize numeric ranks (some cards use numbers, some use strings like "Ace" or "A")
        if type(v) == "number" then
            rank_num = v
            rank_str = tostring(v)
        else
            rank_str = tostring(v)
            -- try to parse numeric-looking strings
            rank_num = tonumber(rank_str)
            -- normalize face names
            if not rank_num then
                local s = rank_str:lower()
                if s == "ace" or s == "a" then
                    rank_str = "A"
                elseif s == "jack" or s == "j" then
                    rank_str = "J"
                elseif s == "queen" or s == "q" then
                    rank_str = "Q"
                elseif s == "king" or s == "k" then
                    rank_str = "K"
                end
            end
        end

        -- odd rank set: Ace, 3, 5, 7, 9
        local odd_ranks = {
            ["A"] = true, ["Ace"] = true,
            ["3"] = true, ["5"] = true, ["7"] = true, ["9"] = true
        }

        -- check string-normalized first (handles "A" / "Ace")
        if odd_ranks[rank_str] then
            card.debuff = true
            return true
        end

        -- check numeric if available (handles numeric base.value)
        if rank_num and (rank_num == 3 or rank_num == 5 or rank_num == 7 or rank_num == 9) then
            card.debuff = true
            return true
        end

        -- not matched => ensure card.debuff not set by this blind
        -- (do not clear debuff if another blind set it; engine usually handles combining)
        return false
    end,

    -- Optional: message shown when hand is invalid; leave default otherwise
    get_loc_debuff_text = function(self)
        return G.GAME.blind.loc_debuff_text .. " [A, 3, 5, 7, 9]"
    end,

    -- No persistent flip/size changes to undo, but include disable hook for completeness
    disable = function(self)
        -- nothing special to clean up here
    end,
}

-- The Cosine
SMODS.Blind {
    key = "cosine",
    dollars = 5,
    mult = 1,
    atlas = 'blinds2',
    pos = { x = 0, y = 1 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("d1be30"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                blind.active = true
            end

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if self:recalc_debuff(context.debuff_card, false) then
                    blind.triggered = true
                    return {
                        debuff = true
                    }
                end
            end

            if context.hand_drawn then
                blind.active = nil
            end
        end
    end,

    recalc_debuff = function(self, card, from_blind)
        if not card or not card.base or not card.base.value then return false end

        local v = card.base.value
        local rank_num = nil
        local rank_str = nil

        if type(v) == "number" then
            rank_num = v
            rank_str = tostring(v)
        else
            rank_str = tostring(v)
            rank_num = tonumber(rank_str)
            if not rank_num then
                local s = rank_str:lower()
                if s == "ace" or s == "a" then
                    rank_str = "A"
                elseif s == "jack" or s == "j" then
                    rank_str = "J"
                elseif s == "queen" or s == "q" then
                    rank_str = "Q"
                elseif s == "king" or s == "k" then
                    rank_str = "K"
                end
            end
        end

        -- even rank set: 2, 4, 6, 8, 10
        local even_ranks = {
            ["2"] = true, ["4"] = true, ["6"] = true,
            ["8"] = true, ["10"] = true
        }

        if even_ranks[rank_str] then
            card.debuff = true
            return true
        end

        if rank_num and (rank_num == 2 or rank_num == 4 or rank_num == 6 or rank_num == 8 or rank_num == 10) then
            card.debuff = true
            return true
        end

        return false
    end,

    get_loc_debuff_text = function(self)
        return G.GAME.blind.loc_debuff_text .. " [2, 4, 6, 8, 10]"
    end,

    disable = function(self)
        -- nothing special to clean up here
    end,
}

SMODS.Blind {
    key = "distance",
    dollars = 5,
    mult = 1,
    pos = { x = 0, y = 0 },
    boss = { min = 3, max = 10 },
    boss_colour = HEX("675497"),
    atlas = 'blinds3',
    config = {extra = {multiplier = 1.75}},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.multiplier}}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.multiplier}}
    end,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * self.config.extra.multiplier)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                play_sound('tarot2', 1.1, 0.4)
                SMODS.juice_up_blind()
                return true
            end
        }))
        return mult, hand_chips, false
    end
}

SMODS.Blind {
    key = "euler",
    dollars = 5,
    mult = 1.25,
    atlas = 'blinds3',
    pos = { x = 0, y = 1 },
    boss = { min = 2, max = 10 },
    boss_colour = HEX("737c99"),
    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.debuff_hand then
            local scoring_cards = context.scoring_hand or G.hand.cards or {}
            local count = #scoring_cards
            blind.triggered = false

            -- Only apply if hand has 3 or more cards
            if count >= 3 then
                blind.triggered = true
                if not context.check then
                    for i, card in ipairs(scoring_cards) do
                        if i ~= 1 and i ~= count then
                            card.debuff = true
                            card.ability.perma_debuff = true
                            card.states.debuffed = true
                            card:juice_up(0.4, 0.4)
                            play_sound('tarot2', 0.8)
                        end
                    end
                end
            end
        end
    end
}

