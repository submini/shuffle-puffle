SMODS.ConsumableType {
    key = 'Lenormand',
    primary_colour = { 1, 1, 1, 1 },
    secondary_colour = {0.694, 0.008, 0.008, 1},
    collection_rows = { 6, 6 },
    shop_rate = 4,
    loc_txt = {
 		name = 'Lenormand', 
 		collection = 'Lenormand Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Lenormand Card',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_theheart',
	can_stack = true,
	can_divide = true,
}

SMODS.Consumable {
    key = 'theclover',
    set = 'Lenormand',
    atlas = 'leclover',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_lucky' },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
	end,
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
    end
}

SMODS.Consumable {
    key = 'theship',
    set = 'Lenormand',
    atlas = 'leship',
    pos = { x = 0, y = 0 },
    config = { extra = { money = 0, max = 30 } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, card)
        local money = 0
        if G.jokers and G.jokers.cards then
            -- use length, not table itself
            money = #G.jokers.cards * 3
        end
        card.ability.extra.money = math.min(money, card.ability.extra.max)

        return { vars = { card.ability.extra.money, card.ability.extra.max } }
    end,

    use = function(self, card, area, copier)
        local money = 0
        if G.jokers and G.jokers.cards then
            money = #G.jokers.cards * 3
        end
        local final_money = math.min(money, card.ability.extra.max)
        card.ability.extra.money = final_money

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(final_money, true)
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'thehouse',
    set = 'Lenormand',
    atlas = 'lehouse',
    pos = { x = 0, y = 0 },
    config = { extra = { planets = 2 } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, card)
    return {
        vars = {
            colours = {
                HEX('0A53A8'),
            },
            card.ability.extra.planets
        }
    }
end,
    use = function(self, card, area, copier)
        for i = 1, math.min(card.ability.extra.planets, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Exoplanet' })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit
    end
}

SMODS.Consumable {
    key = 'thetree',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, extra = { seal = 'sp_treeseal' } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'letree',
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_SEALS.sp_treeseal
	end,
   use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_seal(card.ability.extra.seal, nil, true)
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
    end
}

SMODS.Consumable {
    key = 'clouds',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'leclouds',
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_SEALS.sp_whiteseal
	end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        local highlighted = G.hand.highlighted

        if #highlighted >= 3 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            -- random pick
            local chosen = pseudorandom_element(highlighted, pseudoseed('clouds' .. G.GAME.round_resets.ante))

            -- apply white seal only to that card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                    if chosen and chosen.set_seal then
                        chosen:set_seal('sp_whiteseal', nil, true)
                        play_sound('tarot2')
                        chosen:juice_up(0.6, 0.5)
                    end
                    return true
                end
            }))

            -- finish animation + cleanup
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.6,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,

    can_use = function(self, card)
        return (G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted >= 3)
    end
}

SMODS.Consumable {
    key = 'thesnake',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'lesnake',
    can_repeat_soul = false,
     use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 4 then
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
                        assert(SMODS.modify_rank(G.hand.highlighted[i], -1))
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
        return (G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= 4)
    end
}

SMODS.Consumable {
    key = 'thecoffin',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'lecoffin',
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
            HEX('0A53A8'),
     }
        }
    }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
              G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            end

  
            play_sound('timpani')
            local sets = { 'Catarot', 'Exoplanet' }
            local chosen_set = pseudorandom_element(sets, pseudoseed('dual_tarot'))
            SMODS.add_card({ set = chosen_set, edition = 'e_negative', })        
            used_card:juice_up(0.3, 0.5)
            return true
            end
        }))
    end
    delay(0.6)

                      if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil)
                    end
                    return true
    end,
    can_use = function(self, card)
        return true
    end

}

SMODS.Consumable {
    key = 'thebouquet',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'lebouquet',
    can_repeat_soul = false,
use = function(self, card, area, copier)
    local used_card = copier or card
    if #G.hand.highlighted == 1 then
        local selected = G.hand.highlighted[1]
        local suits = {"Clubs", "Hearts", "Spades", "Diamonds"}
        local new_cards = {}

        -- add a small visual + sound effect
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        -- create two copies
        for i = 1, 2 do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3 * i,
                func = function()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local copy = copy_card(selected, nil, nil, G.playing_card)
                        copy:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copy)
                        G.hand:emplace(copy)

                        -- assign unique random suit
                        local rand_suit = pseudorandom_element(suits, pseudoseed('bouquet' .. i .. G.playing_card))
                        assert(SMODS.change_base(copy, rand_suit))

                    -- visual flip + sound
                    copy:start_materialize()
                    play_sound('card1', 1.0 + (i * 0.1))
                    copy:juice_up(0.3, 0.3)
                    
                    new_cards[#new_cards + 1] = copy
                    return true
                end
            }))
        end

        -- finalize
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 1.0,
            func = function()
                G.hand:unhighlight_all()
                SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                return true
            end
        }))
    end
end,
can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}

SMODS.Consumable {
    key = 'thewhip',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'lewhip',
    can_repeat_soul = false,
    config = { max_highlighted = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
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
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,
}

SMODS.Consumable {
    key = 'birds',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'lebirds',
    can_repeat_soul = false,

    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted ~= 3 then return end

        -- find leftmost card (smallest X)
        local leftmost = G.hand.highlighted[1]
        for _, c in ipairs(G.hand.highlighted) do
            if c.T.x < leftmost.T.x then
                leftmost = c
            end
        end

        -- extract leftmost rank as string
        local rank = leftmost.base.value

        -- animation/sound
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for _, c in ipairs(G.hand.highlighted) do
    if c ~= leftmost then
        -- flip down (show transformation)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                c:flip()
                play_sound('card1')
                return true
            end
        }))

        -- change rank
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                SMODS.change_base(c, nil, rank)
                c:juice_up(0.3, 0.3)
                return true
            end
        }))

        -- flip back up
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.3,
            func = function()
                c:flip()
                play_sound('tarot2')
                return true
            end
        }))
    end
end

-- cleanup after all
G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.8,
    func = function()
        G.hand:unhighlight_all()
        return true
    end
}))
        delay(0.2)
    end,
can_use = function(self, card)
        return G.hand and #G.hand.highlighted == 3
    end,
}

SMODS.Consumable {
    key = 'thechild',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    atlas = 'lechild',
    can_repeat_soul = false,
use = function(self, card, area, copier)
        local used_card = copier or card
        if ((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})) >= 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    ease_dollars(-math.min(G.GAME.dollars, 6), true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Uncommon' })
                      if new_joker then
                      end
                          G.GAME.joker_buffer = 0
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {})) >= 1 and G.GAME.dollars >= 6)
    end
}

SMODS.Consumable {
    key = 'thefox',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    config = { extra = {
        perma_bonus_value = 2
    } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'lefox',
    use = function(self, card, area, copier)
        local used_card = copier or card
        if (#G.hand.highlighted > 0 and #G.hand.highlighted <= 2) then
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
                        G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult or 0
                        G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult + 2
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
        return ((G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= 2))
    end
}

SMODS.Consumable {
    key = 'thebear',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 1, extra = { seal = 'sp_fazbearseal' } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'lebear',
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_SEALS.sp_fazbearseal
	end,
   use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(card.ability.extra.seal, nil, true)
                return true
            end
        }))

        delay(0.5)
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
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted == card.ability.max_highlighted
    end
}


SMODS.Consumable {
    key = 'thetower',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
        config = { extra = { jokercount = 0,
        edition_amount = 5 }, },
    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
	end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'letower',
        use = function(self, card, area, copier)
        local used_card = copier or card
            local jokers_to_edition = {}
            local eligible_jokers = {}
            
            if 'editionless' == 'editionless' then
                eligible_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
            else
                for _, joker in pairs(G.jokers.cards) do
                    if joker.ability.set == 'Joker' then
                        eligible_jokers[#eligible_jokers + 1] = joker
                    end
                end
            end
            
            if #eligible_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(eligible_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 76543)
                
                for i = 1, math.min(card.ability.extra.edition_amount, #temp_jokers) do
                    jokers_to_edition[#jokers_to_edition + 1] = temp_jokers[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            for _, joker in pairs(jokers_to_edition) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        joker:set_edition({ foil = true }, true)
                        return true
                    end
                }))
            end
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'themountain',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    atlas = 'lemountain',
    config = { extra = { max_highlighted = 1, destroy = 5 } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_sp_upward
    end,

    use = function(self, card, area, copier)
        if not G.hand or #G.hand.cards == 0 then return end

        -- tarot-style conversion
        if #G.hand.highlighted > 0 and #(G.hand and G.hand.cards or {}) >= 6 then
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
                        local target = G.P_CENTERS["m_sp_upward"]
                        if target then
                            G.hand.highlighted[i]:set_ability(target)
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
        end

        -- spectral-style destruction (exclude highlighted cards)
        if card.ability.extra and card.ability.extra.destroy and card.ability.extra.destroy > 0 then
            local destroyed_cards = {}
            local temp_hand = {}

            -- Only include NON-highlighted cards
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card.highlighted then
                    temp_hand[#temp_hand + 1] = playing_card
                end
            end

            pseudoshuffle(temp_hand)
            for i = 1, math.min(card.ability.extra.destroy, #temp_hand) do
                destroyed_cards[#destroyed_cards + 1] = temp_hand[i]
            end

            if #destroyed_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        SMODS.destroy_cards(destroyed_cards)
                        return true
                    end
                }))
            end
        end
end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted == card.ability.extra.max_highlighted and #(G.hand and G.hand.cards or {}) >= 6
    end
}



SMODS.Consumable {
    key = 'mice',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    atlas = 'lemice',
    config = {
        max_highlighted = 3,
        extra = {
        dollars = 8
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
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
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.5)
        ease_dollars(card.ability.extra.dollars)
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted == card.ability.max_highlighted
    end
}


SMODS.Consumable {
    key = 'theheart',
    set = 'Lenormand',
    atlas = 'leheart',
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 5, suit_conv = 'Hearts' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
}

SMODS.Consumable {
    key = 'theletter',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    config = { extra = {
        repetitions = 2
    } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'leletter',
    loc_vars = function(self, info_queue, card)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or
            localize('k_none')
        local colour = (not fool_c or fool_c.name == 'The Fool') and G.C.RED or G.C.GREEN

        if not (not fool_c or fool_c.name == 'The Fool') then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_tarot_planet .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_tarot_planet }, main_end = main_end }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.repetitions do
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    SMODS.add_card({ key = G.GAME.last_tarot_planet })
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end
    end,
    can_use = function(self, card)
        return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and
            G.GAME.last_tarot_planet and
            G.GAME.last_tarot_planet ~= 'c_fool'
    end
}

SMODS.Consumable {
    key = 'thekey',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'lekey',

    loc_vars = function(self, info_queue, card)
        -- get last Lenormand used (modded key)
        local last_key = G.GAME.sp_last_lenormand
        local last_card = last_key and G.P_CENTERS[last_key] or nil

        local last_name = last_card and localize { type = 'name_text', key = last_card.key, set = 'Lenormand' } or localize('k_none')
        local disallow = (not last_card) or (last_card.key == self.key)
        local colour = disallow and G.C.RED or G.C.GREEN

        -- add tooltip for that card
        if not disallow then
            info_queue[#info_queue + 1] = last_card
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_name .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_name, colours = { 
            HEX('b10202'),
     } }, main_end = main_end  }
    end,

    can_use = function(self, card)
        -- only usable if there’s a last Lenormand and it isn’t The Key itself
        return (G.GAME.sp_last_lenormand and G.GAME.sp_last_lenormand ~= 'c_sp_thekey')
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local last_key = G.GAME.sp_last_lenormand
                local last_card = last_key and G.P_CENTERS[last_key]

                if last_card and G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    card:juice_up(0.3, 0.5)
                    SMODS.add_card({ key = last_key })
                end

                return true
            end
        }))

        delay(0.6)
    end
}

SMODS.Consumable {
    key = 'thecross',
    set = 'Lenormand',
    pos = { x = 0, y = 0 },
    config = { extra = {
        destroy_joker_amount = 1,
        dollars_value = 25
    } },
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'lecross',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars_value } }
    end,

    use = function(self, card, area, copier)
        local used_card = copier or card
        local deletable_jokers = {}

        -- collect non-eternal jokers
        for _, joker in ipairs(G.jokers.cards) do
            if joker.ability.set == 'Joker' and not SMODS.is_eternal(joker) then
                deletable_jokers[#deletable_jokers + 1] = joker
            end
        end

        if #deletable_jokers == 0 then return end -- safety

        pseudoshuffle(deletable_jokers, 98765)
        local target = deletable_jokers[1]

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                if target and not SMODS.is_eternal(target) then
                    target:start_dissolve()
                end
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 1.0,
    func = function()
        local extra = used_card.ability and used_card.ability.extra
        -- skip the status text entirely to avoid nil crashes
        ease_dollars((extra and extra.dollars_value) or 25, true)
        return true
    end
}))
    end,

    can_use = function(self, card)
        -- can only use if at least one non-eternal Joker exists
        if not G.jokers or not G.jokers.cards then return false end
        for _, joker in ipairs(G.jokers.cards) do
            if joker.ability.set == 'Joker' and not SMODS.is_eternal(joker) then
                return true
            end
        end
        return false
    end
}