SMODS.ConsumableType {
    key = 'Gem',
    primary_colour = { 1, 1, 1, 1 },
    secondary_colour = { 0.0667, 0.4510, 0.2941, 1},
    collection_rows = { 3, 3, 3 },
    shop_rate = 0,
    loc_txt = {
 		name = 'Gem', 
 		collection = 'Gem Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Gem',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_obsidian',
	can_stack = true,
	can_divide = true,
}

SMODS.Consumable {
    key = 'obsidian',
    set = 'Gem',
    pos = { x = 0, y = 0 },
    config = { mod_conv = 'm_sp_obsidized' },
    loc_txt = {
        name = 'Obsidian',
        text = {
            [1] = 'h'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
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
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local _card = G.hand.cards[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- apply your enhancement
                    if self.config.mod_conv then
                        _card:set_ability(G.P_CENTERS[self.config.mod_conv])
                    end

                    -- force suit to Spades
                    SMODS.change_base(_card, 'Spades')

                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'ruby',
    set = 'Gem',
    pos = { x = 0, y = 0 },
    config = { mod_conv = 'm_sp_rubified' },
    loc_txt = {
        name = 'Ruby',
        text = {
            [1] = 'h'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
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
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local _card = G.hand.cards[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- apply your enhancement
                    if self.config.mod_conv then
                        _card:set_ability(G.P_CENTERS[self.config.mod_conv])
                    end

                    -- force suit to Spades
                    SMODS.change_base(_card, 'Hearts')

                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'onyx',
    set = 'Gem',
    pos = { x = 0, y = 0 },
    config = { mod_conv = 'm_sp_onyxxified' },
    loc_txt = {
        name = 'Onyx',
        text = {
            [1] = 'h'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
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
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local _card = G.hand.cards[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- apply your enhancement
                    if self.config.mod_conv then
                        _card:set_ability(G.P_CENTERS[self.config.mod_conv])
                    end

                    -- force suit to Spades
                    SMODS.change_base(_card, 'Clubs')

                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'topaz',
    set = 'Gem',
    pos = { x = 0, y = 0 },
    config = { mod_conv = 'm_sp_topazzified' },
    loc_txt = {
        name = 'Topaz',
        text = {
            [1] = 'h'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
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
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local _card = G.hand.cards[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- apply your enhancement
                    if self.config.mod_conv then
                        _card:set_ability(G.P_CENTERS[self.config.mod_conv])
                    end

                    -- force suit to Spades
                    SMODS.change_base(_card, 'Diamonds')

                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}