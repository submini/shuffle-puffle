SMODS.Tag{
    key = "shuffytag",
    atlas = 'shuffytag', -- or your custom atlas
    pos = { x = 0, y = 0 },
    discovered = false,
    min_ante = 1,

    -- control when it can appear
    in_pool = function(self, args)
        return true  -- always allowed
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_sp_megashufflepack_1
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", HEX("e67e22"), function()
				local key = "p_sp_megashufflepack_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,

}

SMODS.Tag{
    key = "exotag",
    atlas = 'exotag', -- or your custom atlas
    pos = { x = 0, y = 0 },
    discovered = false,
    min_ante = 1,

    -- control when it can appear
    in_pool = function(self, args)
        return true  -- always allowed
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_sp_megaexocelestialpack_1
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("O", HEX("0A53A8"), function()
				local key = "p_sp_megaexocelestialpack_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,

}

SMODS.Tag{
    key = "carcanatag",
    atlas = 'carcanatag', -- or your custom atlas
    pos = { x = 0, y = 0 },
    discovered = false,
    min_ante = 1,

    -- control when it can appear
    in_pool = function(self, args)
        return true  -- always allowed
    end,

    loc_vars = function(self, info_queue, center)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_sp_megacarcanapack_1
	end,

    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep(":3", HEX("E8A6BD"), function()
				local key = "p_sp_megacarcanapack_1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,

}

SMODS.Tag {
    key = "phosphytag",
	atlas = "phosphytag",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_sp_phosphorescent
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_sp_phosphorescent", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_sp_phosphorescent"].discovered
    end
}

SMODS.Tag {
    key = "aethertag",
	atlas = "aethertag",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_sp_aetherescent
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_sp_aetherescent", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_sp_aetherescent"].discovered
    end
}

SMODS.Tag {
    key = "prismtag",
	atlas = "prismtag",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_sp_prismatic
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_sp_prismatic", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_sp_prismatic"].discovered
    end
}

SMODS.Tag {
    key = "woodtag",
	atlas = "woodtag",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_sp_wooden
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_sp_wooden", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_sp_wooden"].discovered
    end
}

SMODS.Tag {
    key = "statictag",
	atlas = "statictag",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_sp_grainy
    end,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION, function()
                    context.card.temp_edition = nil
                    context.card:set_edition("e_sp_grainy", true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    in_pool = function(self, args)
        return G.P_CENTERS["e_sp_grainy"].discovered
    end
}

SMODS.Tag {
    key = "sumeable",
    atlas = "sumeabletag",
    pos = { x = 0, y = 0 },
    config = { type = "immediate" },
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep('+', G.C.GREEN, function()
                -- Add 2 random consumables regardless of space
                for i = 1, 2 do
                    -- Get random consumable type
                    local consumable_pool = {}
                    for k, v in pairs(G.P_CENTER_POOLS["Consumeables"]) do
                        if v.set then
                            table.insert(consumable_pool, v)
                        end
                    end
                    
                    if #consumable_pool > 0 then
                        local selected = pseudorandom_element(consumable_pool, pseudoseed('sumeable'))
                        
                        -- Create the card
                        local card = create_card('Consumeable', G.consumeables, nil, nil, nil, nil, selected.key)
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                    end
                end
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = "fancy",
    atlas = "fancytag",
    pos = { x = 0, y = 0 },
    config = { type = "immediate" },
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep('+', G.C.YELLOW, function()
                -- Create 3 enhanced cards with sick animations
                local cards_to_add = {}
                
                for i = 1, 3 do
                    -- Create an enhanced playing card
                    local card = SMODS.create_card({
                        set = 'Enhanced',
                        area = G.deck
                    })
                    
                    -- Set position to center of screen for that juicy effect
                    card.T.x = G.ROOM.T.w/2 - G.CARD_W/2
                    card.T.y = G.ROOM.T.h/2 - G.CARD_H/2
                    
                    -- Add card to the deck (this is what makes it actually go into your deck)
                    card:add_to_deck()
                    G.deck:emplace(card)
                    
                    table.insert(cards_to_add, card)
                end
                
                -- Animate all cards flying to deck with a slight delay between each
                for i, card in ipairs(cards_to_add) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3 + (i-1) * 0.15,
                        blockable = false,
                        func = function()
                            -- Draw attention to the card (makes it pop)
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                
                return true
            end)
            tag.triggered = true
            return true
        end
    end

}

SMODS.Tag {
    key = "fixy",
    atlas = "fixytag",
    pos = { x = 0, y = 0 },
    config = { type = "immediate" },
    apply = function(self, tag, context)
        if context.type == "immediate" then
            tag:yep('+', G.C.RED, function()
                -- Calculate how many cards to remove (5-7 random)
                local cards_to_remove = pseudorandom('fixy_count', 5, 7)
                
                -- Get all cards from deck
                local deck_cards = {}
                for i, card in ipairs(G.playing_cards) do
                    if card.area == G.deck then
                        table.insert(deck_cards, card)
                    end
                end
                
                -- Make sure we don't try to remove more cards than we have
                cards_to_remove = math.min(cards_to_remove, #deck_cards)
                
                -- Randomly select cards to remove
                for i = 1, cards_to_remove do
                    if #deck_cards > 0 then
                        local random_index = pseudorandom('fixy_select', 1, #deck_cards)
                        local card_to_remove = table.remove(deck_cards, random_index)
                        
                        -- Animate the card dissolving with a delay
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.15 * (i - 1),
                            blockable = false,
                            func = function()
                                -- Make card visible in center of screen first
                                card_to_remove.T.x = G.ROOM.T.w/2 - G.CARD_W/2
                                card_to_remove.T.y = G.ROOM.T.h/2 - G.CARD_H/2
                                card_to_remove:juice_up(0.3, 0.5)
                                
                                -- Then dissolve it
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.3,
                                    blockable = false,
                                    func = function()
                                        card_to_remove:start_dissolve(nil, nil, 1.6)
                                        return true
                                    end
                                }))
                                return true
                            end
                        }))
                    end
                end
                
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = 'temporahandy',
	atlas = "temphandy",
	pos = { x = 0, y = 0 },
    config = { type = 'round_start_bonus' },
    
    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Add 1 to current hands without modifying round_resets
                    ease_hands_played(1)
                    tag:yep('+', G.C.BLUE, function()
                        tag.triggered = true
                        return true
                    end)
                    return true
                end
            }))
        end
    end
}

-- Temporatrashy Tag: +1 temporary discard next round
SMODS.Tag {
    key = 'temporatrashy',
	atlas = "temptrashy",
	pos = { x = 0, y = 0 },
    config = { type = 'round_start_bonus' },
    
    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- Add 1 to current discards without modifying round_resets
                    ease_discard(1)
                    tag:yep('+', G.C.RED, function()
                        tag.triggered = true
                        return true
                    end)
                    return true
                end
            }))
        end
    end
}