SMODS.Blind {
    key = "day",
    atlas = 'blinds1',
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 0 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("d6563c"), -- a reddish tint fits the theme
    loc_txt = {
        name = "The Day",
        text = {
            "All Hearts and Diamonds",
            "are drawn face down"
        }
    },

    calculate = function(self, blind, context)
        if blind.disabled then return end

        -- When drawing cards
        if context.stay_flipped and context.to_area == G.hand then
            local card = context.other_card or context.card
            if card and (card.base.suit == "Hearts" or card.base.suit == "Diamonds") then
                return {
                    stay_flipped = true
                }
            end
        end
    end,

    disable = function(self)
        -- Flip any still-facedown Hearts or Diamonds back up
        for _, c in ipairs(G.hand.cards) do
            if c.facing == "back" and (c.base.suit == "Hearts" or c.base.suit == "Diamonds") then
                c:flip()
            end
        end
        for _, c in pairs(G.playing_cards) do
            c.ability.wheel_flipped = nil
        end
    end
}

SMODS.Blind {
    key = "night",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 1 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("1f38a6"),

    calculate = function(self, blind, context)
        if blind.disabled then return end

        -- When drawing cards
        if context.stay_flipped and context.to_area == G.hand then
            local card = context.other_card or context.card
            if card and (card.base.suit == "Clubs" or card.base.suit == "Spades") then
                return {
                    stay_flipped = true
                }
            end
        end
    end,

    disable = function(self)
        -- Flip any still-facedown Hearts or Diamonds back up
        for _, c in ipairs(G.hand.cards) do
            if c.facing == "back" and (c.base.suit == "Clubs" or c.base.suit == "Spades") then
                c:flip()
            end
        end
        for _, c in pairs(G.playing_cards) do
            c.ability.wheel_flipped = nil
        end
    end
}

SMODS.Blind {
    key = "tetrad",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    debuff = { h_size_ge = 4, h_size_le = 4 },
    pos = { x = 0, y = 2 },
    boss = { min = 2, max = 10 },
    boss_colour = HEX("3a9c6f"),
}

SMODS.Blind {
    key = "down",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 3 },
    boss = { min = 4, max = 10 },
    boss_colour = HEX("cf3853"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            -- This triggers during the check for debuff_card
            if context.debuff_card then
                local card = context.debuff_card
                -- Ensure it's a playing card (not joker/consumable)
                if card.ability and card.ability.set == "Enhanced" then
                    return {
                        debuff = true
                    }
                end
            end
        end
    end
}

SMODS.Blind {
    key = "anti",
    dollars = 5,
    atlas = 'blinds1',
    mult = 0.5,
    pos = { x = 0, y = 4 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("888888"),
}

SMODS.Blind {
    key = "67",
    dollars = 5,
    mult = 1.67,
    atlas = 'blinds1',
    pos = { x = 0, y = 5 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("444444"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            -- Debuff check for each individual card
            if context.debuff_card then
                local card = context.debuff_card
                local rank = card.base.value

                -- Handle both string and numeric rank formats safely
                local rank_str = tostring(rank):lower()
                if rank_str == "6" or rank_str == "7" or rank_str == "six" or rank_str == "seven" then
                    return { debuff = true }
                end
            end
        end
    end
}

SMODS.Blind {
    key = "face",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 6 },
    boss = { min = 4, max = 10 },
    boss_colour = HEX("d19e47"),
    calculate = function(self, blind, context)
        if not blind.disabled and context.debuff_card then
            local c = context.debuff_card
            -- Only apply to numbered cards 2–10 (exclude Aces and face cards)
            local val = tonumber(c.base.value)
            if val and val >= 2 and val <= 10 then
                return { debuff = true }
            end
        end
    end
}

SMODS.Blind {
    key = "derivative",
    dollars = 5,
    mult = 2,
    atlas = 'blinds1',
    pos = { x = 0, y = 7 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("6aad51"),

    calculate = function(self, blind, context)
        -- When a hand is being checked for debuffs
        if context.debuff_hand then
            local name = context.scoring_name
            if name == "Straight" or name == "Straight Flush" or name == "Royal Flush" then
                -- Return a table with a proper card list (even if empty)
                return {
                    debuff = true,
                    cards = context.full_hand or {} -- prevent nil crashes
                }
            end
        end
    end
}

SMODS.Blind {
    key = "integral",
    dollars = 5,
    mult = 1.5,
    atlas = 'blinds1',
    pos = { x = 0, y = 8 },
    boss = { min = 2, max = 10 },
    boss_colour = HEX("ad5151"),

    calculate = function(self, blind, context)
        if context.debuff_hand then
            local name = context.scoring_name
            -- debuff everything EXCEPT straight-type hands
            if name ~= "Straight" and name ~= "Straight Flush" and name ~= "Royal Flush" then
                return {
                    debuff = true,
                    cards = context.full_hand or {}
                }
            end
        end
    end
}

-- The Sine
SMODS.Blind {
    key = "sine",
    dollars = 5,
    mult = 1,
    atlas = 'blinds1',
    pos = { x = 0, y = 9 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("30a6d1"),

    -- Called during various calculation contexts. We use it to trigger debuff checks
    calculate = function(self, blind, context)
        if not blind.disabled then
            -- mark active when the blind is chosen
            if context.setting_blind then
                blind.active = true
            end

            -- When the game asks if a specific card should be debuffed
            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                -- recalc_debuff returns true if the card is considered debuffed by this blind
                if self:recalc_debuff(context.debuff_card, false) then
                    blind.triggered = true
                    return {
                        debuff = true
                    }
                end
            end

            -- clean up per-hand
            if context.hand_drawn then
                blind.active = nil
            end
        end
    end,

    -- Decide which cards are debuffed. Return true if the card is debuffed.
    -- This will also set card.debuff = true so the engine recognizes it.
    recalc_debuff = function(self, card, from_blind)
        if not card or not card.base or not card.base.value then return false end

        local v = card.base.value
        local rank_num = nil
        local rank_str = nil

        -- normalize numeric ranks (some cards use numbers, some use strings like "Ace" or "A")
        if type(v) == "number" then
            rank_num = v
            rank_str = tostring(v)
        else
            rank_str = tostring(v)
            -- try to parse numeric-looking strings
            rank_num = tonumber(rank_str)
            -- normalize face names
            if not rank_num then
                local s = rank_str:lower()
                if s == "ace" or s == "a" then
                    rank_str = "A"
                elseif s == "jack" or s == "j" then
                    rank_str = "J"
                elseif s == "queen" or s == "q" then
                    rank_str = "Q"
                elseif s == "king" or s == "k" then
                    rank_str = "K"
                end
            end
        end

        -- odd rank set: Ace, 3, 5, 7, 9
        local odd_ranks = {
            ["A"] = true, ["Ace"] = true,
            ["3"] = true, ["5"] = true, ["7"] = true, ["9"] = true
        }

        -- check string-normalized first (handles "A" / "Ace")
        if odd_ranks[rank_str] then
            card.debuff = true
            return true
        end

        -- check numeric if available (handles numeric base.value)
        if rank_num and (rank_num == 3 or rank_num == 5 or rank_num == 7 or rank_num == 9) then
            card.debuff = true
            return true
        end

        -- not matched => ensure card.debuff not set by this blind
        -- (do not clear debuff if another blind set it; engine usually handles combining)
        return false
    end,

    -- Optional: message shown when hand is invalid; leave default otherwise
    get_loc_debuff_text = function(self)
        return G.GAME.blind.loc_debuff_text .. " [A, 3, 5, 7, 9]"
    end,

    -- No persistent flip/size changes to undo, but include disable hook for completeness
    disable = function(self)
        -- nothing special to clean up here
    end,
}

-- The Cosine
SMODS.Blind {
    key = "cosine",
    dollars = 5,
    mult = 1,
    atlas = 'blinds1',
    pos = { x = 0, y = 10 },
    boss = { min = 1, max = 10 },
    boss_colour = HEX("d1be30"),

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                blind.active = true
            end

            if context.debuff_card and context.debuff_card.area ~= G.jokers then
                if self:recalc_debuff(context.debuff_card, false) then
                    blind.triggered = true
                    return {
                        debuff = true
                    }
                end
            end

            if context.hand_drawn then
                blind.active = nil
            end
        end
    end,

    recalc_debuff = function(self, card, from_blind)
        if not card or not card.base or not card.base.value then return false end

        local v = card.base.value
        local rank_num = nil
        local rank_str = nil

        if type(v) == "number" then
            rank_num = v
            rank_str = tostring(v)
        else
            rank_str = tostring(v)
            rank_num = tonumber(rank_str)
            if not rank_num then
                local s = rank_str:lower()
                if s == "ace" or s == "a" then
                    rank_str = "A"
                elseif s == "jack" or s == "j" then
                    rank_str = "J"
                elseif s == "queen" or s == "q" then
                    rank_str = "Q"
                elseif s == "king" or s == "k" then
                    rank_str = "K"
                end
            end
        end

        -- even rank set: 2, 4, 6, 8, 10
        local even_ranks = {
            ["2"] = true, ["4"] = true, ["6"] = true,
            ["8"] = true, ["10"] = true
        }

        if even_ranks[rank_str] then
            card.debuff = true
            return true
        end

        if rank_num and (rank_num == 2 or rank_num == 4 or rank_num == 6 or rank_num == 8 or rank_num == 10) then
            card.debuff = true
            return true
        end

        return false
    end,

    get_loc_debuff_text = function(self)
        return G.GAME.blind.loc_debuff_text .. " [2, 4, 6, 8, 10]"
    end,

    disable = function(self)
        -- nothing special to clean up here
    end,
}

SMODS.Blind {
    key = "distance",
    dollars = 5,
    mult = 1,
    pos = { x = 0, y = 11 },
    boss = { min = 3, max = 10 },
    boss_colour = HEX("675497"),
    atlas = 'blinds1',
    config = {extra = {multiplier = 1.75}},
    loc_vars = function(self, info_queue, card)
        return {vars = {self.config.extra.multiplier}}
    end,
    collection_loc_vars = function(self)
        return {vars = {self.config.extra.multiplier}}
    end,
    modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * self.config.extra.multiplier)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                play_sound('tarot2', 1.1, 0.4)
                SMODS.juice_up_blind()
                return true
            end
        }))
        return mult, hand_chips, false
    end
}

SMODS.Blind {
    key = "euler",
    dollars = 5,
    mult = 1.25,
    atlas = 'blinds1',
    pos = { x = 0, y = 12 },
    boss = { min = 2, max = 10 },
    boss_colour = HEX("737c99"),
    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.debuff_hand then
            local scoring_cards = context.scoring_hand or G.hand.cards or {}
            local count = #scoring_cards
            blind.triggered = false

            -- Only apply if hand has 3 or more cards
            if count >= 3 then
                blind.triggered = true
                if not context.check then
                    for i, card in ipairs(scoring_cards) do
                        if i ~= 1 and i ~= count then
                            card.debuff = true
                            card.ability.perma_debuff = false
                            card.states.debuffed = true
                            card:juice_up(0.4, 0.4)
                            play_sound('tarot2', 0.8)
                        end
                    end
                end
            end
        end
    end
}

SMODS.Blind {
    key = "secant",
    dollars = 8,
    mult = 1.7,
    boss_colour = HEX('eb8334'),
    debuff = {
        mult_penalty = 0.7
    },
    loc_vars = function (self)
        return {
            vars = {self.debuff.mult_penalty}
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {0.7}
        }
    end,
    in_pool = function (self)
        return G.GAME.round_resets.ante >= 2
    end,
    boss = {min = 3, max = 12},
    pos = { x = 0, y = 0 },  -- change coords for your sprite
    
    calculate = function (self, blind, context)
        if context.individual and context.cardarea == G.play then
            -- Check if card has an enhancement (not base)
            if context.other_card.config.center.key and 
               context.other_card.config.center.key ~= 'c_base' then
                
                return {
                    x_mult = blind.debuff.mult_penalty,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Blind {
    key = "cosecant",
    dollars = 9,
    mult = 1.7,
    boss_colour = HEX('34ed81'),
    debuff = {
        mult_penalty = 0.7
    },
    loc_vars = function (self)
        return {
            vars = {self.debuff.mult_penalty}
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {0.7}
        }
    end,
    in_pool = function (self)
        return G.GAME.round_resets.ante >= 2
    end,
    boss = {min = 4, max = 10},
    pos = { x = 0, y = 0 },  -- change coords for your sprite
    
    calculate = function (self, blind, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center.key and 
               context.other_card.config.center.key == 'c_base' then
                
                return {
                    x_mult = blind.debuff.mult_penalty,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Blind {
	key = "final_floret",
	boss = {
		min = 24,
		max = 100,
		showdown = true
	},
	boss_colour = HEX("3d0a47"),
	dollars = 10,
	mult = 1,
	--atlas = "blinds",
	pos = { x = 0, y = 10 },
	-- Define which boss blinds to combine
	combined_bosses = {
		"bl_small", "bl_big", "bl_hook",
		"bl_eye", "bl_mouth", "bl_plant",
		"bl_fish", "bl_psychic", "bl_goad",
		"bl_water", "bl_needle", "bl_head",
		"bl_tooth", "bl_wall", "bl_wheel",
		"bl_arm", "bl_club", "bl_window",
		"bl_house", "bl_mark", "bl_ox",
		"bl_final_leaf", "bl_final_vessel",
		"bl_final_heart", "bl_final_bell", "bl_final_acorn"
	},
	
	set_blind = function(self, reset, silent)
		if not reset then
			local ante = G.GAME.round_resets.ante
			local base = get_blind_amount(ante) * G.GAME.starting_params.ante_scaling
			G.GAME.blind.chips = math.floor(base ^ 2.6)
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			
			-- Loop through our specific boss array
			for _, boss_key in ipairs(self.combined_bosses) do
				local boss = G.P_BLINDS[boss_key]
				if boss and boss.set_blind then
					boss:set_blind(reset, silent)
				end
				
				-- Handle specific vanilla boss mechanics
				if boss then
					-- The Eye - disable all hands
					if boss.name == "The Eye" then
						G.GAME.blind.hands = {
							["Flush Five"] = false,
							["Flush House"] = false,
							["Five of a Kind"] = false,
							["Straight Flush"] = false,
							["Four of a Kind"] = false,
							["Full House"] = false,
							["Flush"] = false,
							["Straight"] = false,
							["Three of a Kind"] = false,
							["Two Pair"] = false,
							["Pair"] = false,
							["High Card"] = false,
						}
					end
					
					-- The Mouth - clear hand type
					if boss.name == "The Mouth" then
						G.GAME.blind.only_hand = false
					end
					
					-- The Fish - prep state
					if boss.name == "The Fish" then
						G.GAME.blind.prepped = nil
					end
					
					-- The Water - remove discards
					if boss.name == "The Water" then
						G.GAME.blind.discards_sub = G.GAME.current_round.discards_left
						ease_discard(-G.GAME.blind.discards_sub)
					end
					
					-- The Needle - remove hands
					if boss.name == "The Needle" then
						G.GAME.blind.hands_sub = G.GAME.round_resets.hands - 1
						ease_hands_played(-G.GAME.blind.hands_sub)
					end
					
					-- The Manacle - reduce hand size
					if boss.name == "The Manacle" then
						G.hand:change_size(-1)
					end
					
					-- Amber Acorn - flip and shuffle jokers
					if boss.name == "Amber Acorn" and #G.jokers.cards > 0 then
						G.jokers:unhighlight_all()
						for k, v in ipairs(G.jokers.cards) do
							v:flip()
						end
						if #G.jokers.cards > 1 then
							G.E_MANAGER:add_event(Event({
								trigger = "after",
								delay = 0.2,
								func = function()
									for i = 1, 3 do
										G.E_MANAGER:add_event(Event({
											func = function()
												G.jokers:shuffle("aajk")
												play_sound("cardSlide1", 0.85 + i * 0.15)
												return true
											end,
										}))
										delay(0.15)
									end
									delay(0.5)
									return true
								end,
							}))
						end
					end
				end
			end
			
			-- Apply debuffs to all cards
			for _, v in ipairs(G.playing_cards) do
				self:recalc_debuff(v)
			end
			for _, v in ipairs(G.jokers.cards) do
				self:recalc_debuff(v, true)
			end
		end
	end,
	
	defeat = function(self, silent)
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.defeat then
				boss:defeat(silent)
			end
			if boss and boss.name == "The Manacle" and not self.disabled then
				G.hand:change_size(1)
			end
		end
	end,
	
	disable = function(self, silent)
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.disable then
				boss:disable(silent)
			end
			
			-- Revert specific mechanics
			if boss then
				if boss.name == "The Water" then
					ease_discard(G.GAME.blind.discards_sub)
				end
				
				if boss.name == "The Wheel" or boss.name == "The House" or 
				   boss.name == "The Mark" or boss.name == "The Fish" then
					for i = 1, #G.hand.cards do
						if G.hand.cards[i].facing == "back" then
							G.hand.cards[i]:flip()
						end
					end
					for k, v in pairs(G.playing_cards) do
						v.ability.wheel_flipped = nil
					end
				end
				
				if boss.name == "The Needle" then
					ease_hands_played(G.GAME.blind.hands_sub)
				end
				
				if boss.name == "The Wall" then
					G.GAME.blind.chips = G.GAME.blind.chips / 2
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				end
				
				if boss.name == "Cerulean Bell" then
					for k, v in ipairs(G.playing_cards) do
						v.ability.forced_selection = nil
					end
				end
				
				if boss.name == "The Manacle" then
					G.hand:change_size(1)
					G.FUNCS.draw_from_deck_to_hand(1)
				end
				
				if boss.name == "Violet Vessel" then
					G.GAME.blind.chips = G.GAME.blind.chips / 3
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				end
			end
		end
	end,
	
	press_play = function(self)
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.press_play then
				boss:press_play()
			end
			
			-- Handle specific press_play mechanics
			if boss then
				if boss.name == "The Hook" then
					G.E_MANAGER:add_event(Event({
						func = function()
							local _cards = {}
							for k, v in ipairs(G.hand.cards) do
								_cards[#_cards + 1] = v
							end
							for i = 1, 2 do
								if G.hand.cards[i] then
									local selected_card, card_key = pseudorandom_element(_cards, pseudoseed("combined_terror"))
									G.hand:add_to_highlighted(selected_card, true)
									table.remove(_cards, card_key)
									play_sound("card1", 1)
								end
							end
							G.FUNCS.discard_cards_from_highlighted(nil, true)
							return true
						end,
					}))
					G.GAME.blind.triggered = true
					delay(0.7)
				end
				
				if boss.name == "Crimson Heart" and G.jokers.cards[1] then
					G.GAME.blind.triggered = true
					G.GAME.blind.prepped = true
				end
				
				if boss.name == "The Fish" then
					G.GAME.blind.prepped = true
				end
				
				if boss.name == "The Tooth" then
					G.E_MANAGER:add_event(Event({
						trigger = "after",
						delay = 0.2,
						func = function()
							for i = 1, #G.play.cards do
								G.E_MANAGER:add_event(Event({
									func = function()
										G.play.cards[i]:juice_up()
										return true
									end,
								}))
								ease_dollars(-1)
								delay(0.23)
							end
							return true
						end,
					}))
					G.GAME.blind.triggered = true
				end
			end
		end
	end,
	
	modify_hand = function(self, cards, poker_hands, text, mult, hand_chips)
		local new_mult = mult
		local new_chips = hand_chips
		local trigger = false
		
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.modify_hand then
				local this_trigger = false
				new_mult, new_chips, this_trigger = boss:modify_hand(cards, poker_hands, text, new_mult, new_chips)
				trigger = trigger or this_trigger
			end
			
			if boss and boss.name == "The Flint" then
				G.GAME.blind.triggered = true
				new_mult = math.max(math.floor(new_mult * 0.5 + 0.5), 1)
				new_chips = math.max(math.floor(new_chips * 0.5 + 0.5), 0)
				trigger = true
			end
		end
		
		return new_mult, new_chips, trigger
	end,
	
	debuff_hand = function(self, cards, hand, handname, check)
		G.GAME.blind.debuff_boss = nil
		
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.debuff_hand and boss:debuff_hand(cards, hand, handname, check) then
				G.GAME.blind.debuff_boss = boss
				return true
			end
			
			if boss and boss.debuff then
				G.GAME.blind.triggered = false
				
				if boss.debuff.hand and next(hand[boss.debuff.hand]) then
					G.GAME.blind.triggered = true
					G.GAME.blind.debuff_boss = boss
					return true
				end
				
				if boss.debuff.h_size_ge and #cards < boss.debuff.h_size_ge then
					G.GAME.blind.triggered = true
					G.GAME.blind.debuff_boss = boss
					return true
				end
				
				if boss.debuff.h_size_le and #cards > boss.debuff.h_size_le then
					G.GAME.blind.triggered = true
					G.GAME.blind.debuff_boss = boss
					return true
				end
				
				if boss.name == "The Eye" then
					if G.GAME.blind.hands[handname] then
						G.GAME.blind.triggered = true
						G.GAME.blind.debuff_boss = boss
						return true
					end
					if not check then
						G.GAME.blind.hands[handname] = true
					end
				end
				
				if boss.name == "The Mouth" then
					if boss.only_hand and boss.only_hand ~= handname then
						G.GAME.blind.triggered = true
						G.GAME.blind.debuff_boss = boss
						return true
					end
					if not check then
						boss.only_hand = handname
					end
				end
			end
			
			if boss and boss.name == "The Arm" then
				G.GAME.blind.triggered = false
				if to_big(G.GAME.hands[handname].level) > to_big(1) then
					G.GAME.blind.triggered = true
					if not check then
						level_up_hand(G.GAME.blind.children.animatedSprite, handname, nil, -1)
						G.GAME.blind:wiggle()
					end
				end
			end
			
			if boss and boss.name == "The Ox" then
				G.GAME.blind.triggered = false
				if handname == G.GAME.current_round.most_played_poker_hand then
					G.GAME.blind.triggered = true
					if not check then
						ease_dollars(-G.GAME.dollars, true)
						G.GAME.blind:wiggle()
					end
				end
			end
		end
		
		return false
	end,
	
	drawn_to_hand = function(self)
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.drawn_to_hand then
				boss:drawn_to_hand()
			end
			
			if boss and boss.name == "Cerulean Bell" then
				local any_forced = nil
				for k, v in ipairs(G.hand.cards) do
					if v.ability.forced_selection then
						any_forced = true
					end
				end
				if not any_forced then
					G.hand:unhighlight_all()
					local forced_card = pseudorandom_element(G.hand.cards, pseudoseed("combined_terror"))
					forced_card.ability.forced_selection = true
					G.hand:add_to_highlighted(forced_card)
				end
			end
			
			if boss and boss.name == "Crimson Heart" and G.GAME.blind.prepped and G.jokers.cards[1] then
				local jokers = {}
				for i = 1, #G.jokers.cards do
					if not G.jokers.cards[i].debuff or #G.jokers.cards < 2 then
						jokers[#jokers + 1] = G.jokers.cards[i]
					end
					G.jokers.cards[i]:set_debuff(false)
				end
				local _card = pseudorandom_element(jokers, pseudoseed("combined_terror"))
				if _card then
					_card:set_debuff(true)
					_card:juice_up()
					G.GAME.blind:wiggle()
				end
			end
		end
	end,
	
	stay_flipped = function(self, area, card)
		for _, boss_key in ipairs(self.combined_bosses) do
			local boss = G.P_BLINDS[boss_key]
			if boss and boss.stay_flipped and boss:stay_flipped(area, card) then
				return true
			end
			
			if boss and area == G.hand then
				if boss.name == "The Wheel" and pseudorandom("combined_terror" .. G.GAME.round_resets.ante) < 1/7 then
					return true
				end
				
				if boss.name == "The House" and G.GAME.current_round.hands_played == 0 and 
				   G.GAME.current_round.discards_used == 0 then
					return true
				end
				
				if boss.name == "The Mark" and card:is_face(true) then
					return true
				end
				
				if boss.name == "The Fish" and G.GAME.blind.prepped then
					return true
				end
			end
		end
		return false
	end,
	
	recalc_debuff = function(self, card, from_blind)
		if card and card.area then
			for _, boss_key in ipairs(self.combined_bosses) do
				local boss = G.P_BLINDS[boss_key]
				if boss and boss.recalc_debuff then
					boss:recalc_debuff(card, from_blind)
				end
				
				if boss and boss.debuff and not G.GAME.blind.disabled and card.area ~= G.jokers then
					if boss.debuff.suit and card:is_suit(boss.debuff.suit, true) then
						card:set_debuff(true)
						return
					end
					
					if boss.debuff.is_face == "face" and card:is_face(true) then
						card:set_debuff(true)
						return
					end
					
					if boss.name == "The Pillar" and card.ability.played_this_ante then
						card:set_debuff(true)
						return
					end
					
					if boss.debuff.value and boss.debuff.value == card.base.value then
						card:set_debuff(true)
						return
					end
					
					if boss.debuff.nominal and boss.debuff.nominal == card.base.nominal then
						card:set_debuff(true)
						return
					end
				end
				
				if boss and boss.name == "Crimson Heart" and not G.GAME.blind.disabled and card.area == G.jokers then
					return
				end
				
				if boss and boss.name == "Verdant Leaf" and not G.GAME.blind.disabled and card.area ~= G.jokers then
					card:set_debuff(true)
					return
				end
			end
		end
	end,
}