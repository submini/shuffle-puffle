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