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
    end
}
