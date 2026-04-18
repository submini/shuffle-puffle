SMODS.ConsumableType {
    key = 'Routes',
    primary_colour = { 1, 1, 1, 1 },
    secondary_colour = { 0.4706, 0.7451, 0.1255, 1},
    collection_rows = { 3, 3, 3 },
    shop_rate = 0,
    loc_txt = {
 		name = 'Route', 
 		collection = 'Route Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Route',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_route1',
	can_stack = true,
	can_divide = true,
}

SMODS.Consumable {
    key = 'route1',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route1',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i].ability.perma_p_dollars = G.hand.cards[i].ability.perma_p_dollars or 0
                        G.hand.cards[i].ability.perma_p_dollars = G.hand.cards[i].ability.perma_p_dollars + 1
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route3',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route3',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus or 0
                        G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus + 30
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route5',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route5',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i].ability.perma_mult = G.hand.cards[i].ability.perma_mult or 0
                        G.hand.cards[i].ability.perma_mult = G.hand.cards[i].ability.perma_mult + 3
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route6',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route6',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i].ability.perma_x_chips = G.hand.cards[i].ability.perma_x_chips or 0
                        G.hand.cards[i].ability.perma_x_chips = G.hand.cards[i].ability.perma_x_chips + 0.2
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route11',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route11',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_sp_nature
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        
        -- Initial sound effect
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- Process each card in hand
        for i = 1, #G.hand.cards do
            local c = G.hand.cards[i]
            local percent1 = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3

            -- Flip face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('card1', percent1)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))

            -- Apply nature enhancement while face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c:set_ability(G.P_CENTERS.m_sp_nature)
                    return true
                end
            }))

            -- Flip face-up
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('tarot2', 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3, 0.6)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    key = 'route12',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route12',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        
        -- Initial sound effect
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- Process each card in hand
        for i = 1, #G.hand.cards do
            local c = G.hand.cards[i]
            local percent1 = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3

            -- Flip face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('card1', percent1)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))

            -- Apply nature enhancement while face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c:set_ability(G.P_CENTERS.m_steel)
                    return true
                end
            }))

            -- Flip face-up
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('tarot2', 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3, 0.6)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    key = 'route16',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route16',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        
        -- Initial sound effect
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- Process each card in hand
        for i = 1, #G.hand.cards do
            local c = G.hand.cards[i]
            local percent1 = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3

            -- Flip face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('card1', percent1)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))

            -- Apply nature enhancement while face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c:set_ability(G.P_CENTERS.m_gold)
                    return true
                end
            }))

            -- Flip face-up
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('tarot2', 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3, 0.6)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    key = 'route19',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route19',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus or 0
                        G.hand.cards[i].ability.perma_bonus = G.hand.cards[i].ability.perma_bonus + 130
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route30',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route30',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    use = function(self, card, area, copier)
        local used_card = copier or card
        G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.cards do
                local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.cards[i].ability.perma_x_mult = G.hand.cards[i].ability.perma_x_mult or 0
                        G.hand.cards[i].ability.perma_x_mult = G.hand.cards[i].ability.perma_x_mult + 0.8
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

SMODS.Consumable {
    key = 'route35',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route35',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        
        -- Initial sound effect
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))
        
        -- Juice up all cards in hand
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        
        delay(0.2)
        
        -- Apply chip bonus to all cards in hand
        for i = 1, #G.hand.cards do
            local c = G.hand.cards[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c.ability.perma_bonus = c.ability.perma_bonus or 0
                    c.ability.perma_bonus = c.ability.perma_bonus + 100
                    return true
                end
            }))
        end
        
        delay(0.1)
        
        -- Apply mult bonus to all cards in hand
        for i = 1, #G.hand.cards do
            local c = G.hand.cards[i]
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c.ability.perma_x_mult = c.ability.perma_x_mult or 1
                    c.ability.perma_x_mult = c.ability.perma_x_mult + 0.55
                    return true
                end
            }))
        end
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}

SMODS.Consumable {
    key = 'route48',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route48',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_SEALS.sp_whiteseal
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        
        -- Initial sound effect
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- Process each card in hand
        for i = 1, #G.hand.cards do
            local c = G.hand.cards[i]
            local percent1 = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3

            -- Flip face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('card1', percent1)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))

            -- Apply nature enhancement while face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    c:set_seal("sp_whiteseal", nil, true)
                    return true
                end
            }))

            -- Flip face-up
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    play_sound('tarot2', 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3, 0.6)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    key = 'route57',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route57',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    can_use = function(self, card)
        return (to_big(#G.jokers.cards) >= to_big(2))
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        
        if to_big(#G.jokers.cards) >= to_big(2) then
            local jokers_to_destroy = {}
            local deletable_jokers = {}
            
            -- Find all non-eternal jokers
            for _, joker in pairs(G.jokers.cards) do
                if joker.ability.set == 'Joker' and not SMODS.is_eternal(joker, card) then
                    deletable_jokers[#deletable_jokers + 1] = joker
                end
            end
            
            -- Pick 2 random jokers to destroy
            if #deletable_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(deletable_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 98765)
                
                for i = 1, math.min(2, #temp_jokers) do
                    jokers_to_destroy[#jokers_to_destroy + 1] = temp_jokers[i]
                end
            end
            
            -- Initial sound
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            
            -- Destroy the selected jokers
            local _first_dissolve = nil
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.75,
                func = function()
                    for _, joker in pairs(jokers_to_destroy) do
                        joker:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                    end
                    return true
                end
            }))
            
            delay(0.6)
            
            -- Create legendary joker
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                        G.GAME.joker_buffer = 0
                    end
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            
            delay(0.6)
        end
    end
}

SMODS.Consumable {
    key = 'route58',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route58',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        local created_any = false
        
        for i = 1, 5 do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    
                    -- Get all available consumable sets dynamically
                    local available_sets = {}
                    for k, v in pairs(SMODS.ConsumableType.obj_buffer) do
                        if v.type == 'Consumable' and v.key ~= 'Routes' then
                            available_sets[#available_sets + 1] = v.key
                        end
                    end
                    
                    -- Fallback to vanilla sets if nothing found
                    if #available_sets == 0 then
                        available_sets = {'Tarot', 'Planet', 'Spectral'}
                    end
                    
                    local random_set = pseudorandom_element(available_sets, pseudoseed('route58_' .. i))
                    
                    -- Temporarily increase buffer and create card
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    SMODS.add_card({ set = random_set, edition = 'e_negative' })
                    G.GAME.consumeable_buffer = 0
                    
                    created_any = true
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        
        delay(0.6)
        
        if created_any then
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
        end
        
        return true
    end
}

SMODS.Consumable {
    key = 'route59',
    set = 'Routes',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'route59',
    display_size = {
        w = 64 * 1, 
        h = 64 * 1
    },
    can_use = function(self, card)
        return true
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
            HEX('FECB00'),

     }
        }
    }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        local created_any = false
        
        -- Pick either Catarot or Spectaclaw randomly
        local chosen_set = pseudorandom(pseudoseed('route59_choice')) > 0.5 and 'Catarot' or 'Spectaclaw'
        
        for i = 1, 4 do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    
                    -- Temporarily increase buffer and create card
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    SMODS.add_card({ set = chosen_set, edition = 'e_negative' })
                    G.GAME.consumeable_buffer = 0
                    
                    created_any = true
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        
        delay(0.6)
        
        if created_any then
            card_eval_status_text(used_card, 'extra', nil, nil, nil, {
                message = localize('k_plus_consumable'), 
                colour = chosen_set == 'Catarot' and G.C.SECONDARY_SET.Tarot or G.C.SECONDARY_SET.Spectral
            })
        end
        
        return true
    end
}