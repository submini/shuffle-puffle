SMODS.ConsumableType {
    key = 'Catarot',
    primary_colour = { 1, 1, 1, 1 },
    secondary_colour = {0.91, 0.65, 0.74, 1},
    collection_rows = { 8, 2 },
    shop_rate = 4,
    loc_txt = {
 		name = 'Catarot', 
 		collection = 'Catarot Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Cartarot Card',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_ragdoll',
	can_stack = true,
	can_divide = true,
}




-- Ragdoll
SMODS.Consumable {
    key = 'ragdoll',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Ragdoll',
        text = {
            [1] = 'Enhances 1 selected',
            [2] = 'card into a {C:attention}Trading Card{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'ragdoll',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_sp_trading'])
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 or #G.hand.highlighted ~= 1 then return false end
        for _, shop_card in ipairs(G.shop_jokers) do
            if card == shop_card then return false end
        end
        return true
    end
}

-- Siamese
SMODS.Consumable {
    key = 'siamese',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Siamese',
        text = {
            [1] = 'Enhances up to 2',
            [2] = 'selected cards to',
            [3] = '{C:attention}Corner Cards{}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'siamese',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_sp_corner'])
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 or #G.hand.highlighted > 2 then return false end
        for _, shop_card in ipairs(G.shop_jokers) do
            if card == shop_card then return false end
        end
        return true
    end
}

-- Bengal
SMODS.Consumable {
    key = 'bengal',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 2 } },
    loc_txt = {
        name = 'Bengal',
        text = {
            [1] = 'Enhances up to 7',
            [2] = 'selected cards into',
            [3] = 'either {C:diamonds}Diamonds{} or',
            [4] = '{C:spades}Spades{}',
            [5] = '{C:inactive,s:0.75}(randomly selected for each card){}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'bengal',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 7 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if pseudorandom('bengal_coinflip') < 0.5 then
                            SMODS.change_base(G.hand.highlighted[i], 'Diamonds')
                        else
                            SMODS.change_base(G.hand.highlighted[i], 'Spades')
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 or #G.hand.highlighted > 7 then return false end
        for _, shop_card in ipairs(G.shop_jokers) do
            if card == shop_card then return false end
        end
        return true
    end
}

SMODS.Consumable {
    key = 'russianblue',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 2 } },
    loc_txt = {
        name = 'Russian Blue',
        text = {
            [1] = 'Enhances up to 7',
            [2] = 'selected cards into',
            [3] = 'either {C:hearts}Hearts{} or',
            [4] = '{C:clubs}Clubs{}',
            [5] = '{C:inactive,s:0.75}(randomly selected for each card){}'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'russianblue',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 7 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if pseudorandom('bengal_coinflip') < 0.5 then
                            SMODS.change_base(G.hand.highlighted[i], 'Hearts')
                        else
                            SMODS.change_base(G.hand.highlighted[i], 'Clubs')
                        end
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 or #G.hand.highlighted > 7 then return false end
        for _, shop_card in ipairs(G.shop_jokers) do
            if card == shop_card then return false end
        end
        return true
    end
}

-- Helper: round up to next multiple of m
local function round_up_to_multiple(n, m)
    return ((n / m - (n / m % 1)) + 1) * m
end

SMODS.Consumable {
    key = 'abyssinian',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    config = { extra = {
        dollars_value = 26
    } },
    loc_txt = {
        name = 'Abyssinian',
        text = {
        [1] = 'Sets money to the',
        [2] = 'next multiple of {C:money}$26{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'abyssinian',
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local current_dollars = G.GAME.dollars
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                local target_dollars = round_up_to_multiple(current_dollars, 26)
                local difference = target_dollars - current_dollars
                ease_dollars(difference, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'chartreux',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Chartreux',
        text = {
        [1] = 'Adds a {C:attention}Chartreuse Seal{}',
        [2] = 'to 1 selected card'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'chartreux',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_seal("sp_chartreuseseal", nil, true)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 or #G.hand.highlighted ~= 1 then return false end
        for _, shop_card in ipairs(G.shop_jokers) do
            if card == shop_card then return false end
        end
        return true
    end
}
-- Rex
SMODS.Consumable {
    key = 'devonrex',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Devon Rex',
        text = {
        [1] = 'Enhances up to',
        [2] = '2 selected cards to',
        [3] = '{C:attention}Striped Cards{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'devonrex',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_sp_striped'])
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted <= 2)
    end
}


-- Birman
SMODS.Consumable {
    key = 'birman',
    name = 'Birman',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'birman',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i, c in ipairs(G.hand.highlighted) do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        c:flip()
                        play_sound('card1', percent)
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function() return true end
            }))
            for _, c in ipairs(G.hand.highlighted) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        c:set_ability(G.P_CENTERS.m_sp_francaise, nil, true)
                        return true
                    end
                }))
            end
            for i, c in ipairs(G.hand.highlighted) do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        c:flip()
                        play_sound('tarot2', percent, 0.6)
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function() return true end
            }))
        end
    end,
    can_use = function(self, card)
        if #G.hand.highlighted == 0 or #G.hand.highlighted > 2 then return false end
        for _, shop_card in ipairs(G.shop_jokers) do
            if card == shop_card then return false end
        end
        return true
    end
}

