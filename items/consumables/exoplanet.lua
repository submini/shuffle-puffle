SMODS.ConsumableType {
    key = 'Exoplanet',
    primary_colour = {0.749, 0.878, 0.965, 1},
    secondary_colour = {0.039, 0.325, 0.659, 1},
    collection_rows = { 6, 2 },
    shop_rate = 4,
    loc_txt = {
 		name = 'Exoplanet', 
 		collection = 'Exoplanet Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Exoplanet Card',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_j1407b',
	can_stack = true,
	can_divide = true,
}


SMODS.Consumable {
    key = 'j1407b',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        planetcardsused = 0,
        hand_type = "Straight"
    } },
    loc_txt = {
        name = 'J1407b',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
    use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('Straight', 'poker_hands'), 
                  chips = G.GAME.hands['Straight'].chips, 
                  mult = G.GAME.hands['Straight'].mult, 
                  level = G.GAME.hands['Straight'].level })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.planet or 0)) })
            delay(1.3)
            level_up_hand(card, "Straight", true, (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.planet or 0))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize('Straight', 'poker_hands'), 
                 chips = G.GAME.hands['Straight'].chips, 
                 mult = G.GAME.hands['Straight'].mult, 
                 level=G.GAME.hands['Straight'].level})
            delay(1.3)
    end,
    can_use = function(self, card)
        return true
    end
}