SMODS.Atlas({
    key = 'sacredbirman',
    path = 'francaise.png',
    px = 71,
    py = 95
})

SMODS.ConsumableType {
    key = 'Catarot',
    primary_colour = { 1, 1, 1, 1 },
    secondary_colour = {0.91, 0.65, 0.74, 1},
    collection_rows = { 4, 4 },
    shop_rate = 4,
    loc_txt = { name = "Catarot" },
    default = 'c_sp_sacredbirman',
	can_stack = true,
	can_divide = true,
}

SMODS.Consumable {
    --object_type = "Consumable",
    key = 'sacredbirman',
    name = 'Sacred Birman',
    set = 'Catarot',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'sacredbirman',

    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 2 then
            -- small juice on the used card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            -- flip & juice both selected
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

            -- wait a little before enhancing
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function() return true end
            }))

            -- set ability
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

            -- flip back with sound
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

            -- unhighlight at the end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))

            -- final small delay for smoothness
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.5,
                func = function() return true end
            }))
        end
    end,

    can_use = function(self, card)
        return (#G.hand.highlighted == 2)
    end
}