SMODS.ConsumableType {
    key = 'Spectaclaw',
    primary_colour = { 0, 0, 0, 1 },
    secondary_colour = {0.996, 0.796, 0.000, 1},
    collection_rows = { 8, 8 },
    shop_rate = 0,
    loc_txt = {
 		name = 'Spectaclaw', 
 		collection = 'Spectaclaw Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Spectaclaw Card',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_bombay',
	can_stack = true,
	can_divide = true,
}

SMODS.Consumable {
    key = 'bombay',
    set = 'Spectaclaw',
    pos = { x = 0, y = 0 },
    config = { extra = { odds = 7 } },
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        info_queue[#info_queue + 1] = G.P_SEALS.Red
        info_queue[#info_queue + 1] = G.P_SEALS.Blue
	end,
    cost = 4,
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
            local c = G.hand.cards[i]

            -- flip face-down
            local percent1 = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
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

            -- apply glass, then maybe seal WHILE face-down
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    -- glass first
                    c:set_ability(G.P_CENTERS.m_glass)

                    -- then seal (so it sticks)
                    if pseudorandom('bombay') < (1/self.config.extra.odds) then
                        local seal = pseudorandom('bombay_seal') < 0.5 and 'Red' or 'Blue'
                        c:set_seal(seal)
                    end
                    return true
                end
            }))

            -- flip face-up
            local percent2 = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('tarot2', percent2, 0.6)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'tuxedo',
    set = 'Spectaclaw',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_sp_tuxedo' },
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_sp_tuxedo
	end,
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
        use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
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
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.mod_conv])
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'britishshorthair',
    set = 'Spectaclaw',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_sp_upward' },
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_sp_upward
	end,
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
        use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
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
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.mod_conv])
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Consumable {
    key = 'calico',
    set = 'Spectaclaw',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_sp_igorcard' },
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_sp_igorcard
	end,
    cost = 4,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
        use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
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
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS[card.ability.mod_conv])
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
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}