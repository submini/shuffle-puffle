SMODS.Back {
    key = 'consecutive',
    atlas = 'consecutivedeck',
    pos = {
        x = 0,
        y = 0
    },
    config = {
    jokers = {
      'j_order'
    },
    consumables = {
        'c_saturn', 'c_saturn'
    },
    voucher = 'v_crystal_ball',
    extra = {
    start_ante = 1,
    win_ante = 9,
    },
  },
  loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.voucher, set = 'Voucher' },
                         localize { type = 'name_text', key = self.config.consumables[1], set = 'Planet' },
                         localize { type = 'name_text', key = self.config.jokers, set = 'Joker' }
            }
        }
end,
apply = function(self, back)
        local extra_cards = {}
        for i, v in pairs(SMODS.Suits) do
            if type(v) == 'table' and type(v.in_pool) == 'function' and v.in_pool then
                if v:in_pool({ initial_deck = true }) then
                    for j = 1, 1 do
                        extra_cards[#extra_cards + 1] = { s = v.card_key, r = 'J' }
                        extra_cards[#extra_cards + 1] = { s = v.card_key, r = 'Q' }
                        extra_cards[#extra_cards + 1] = { s = v.card_key, r = 'K' }
                    end
                end
            else
                for j = 1, 1 do
                    extra_cards[#extra_cards + 1] = { s = v.card_key, r = 'J' }
                    extra_cards[#extra_cards + 1] = { s = v.card_key, r = 'Q' }
                    extra_cards[#extra_cards + 1] = { s = v.card_key, r = 'K' }
                end
            end
        end
        G.GAME.starting_params.extra_cards = extra_cards
        G.GAME.win_ante = self.config.extra.win_ante
        G.GAME.round_resets.ante = self.config.extra.start_ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.ante
    end,
    
}

SMODS.Back {
    key = 'permission',
    atlas = 'permissiondeck',
    pos = {
        x = 0,
        y = 0
    },
    config = {
    vouchers = { 'v_sp_expansionpermit', 'v_sp_prestigepermit' },
  },
  loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.vouchers[1], set = 'Voucher' },
                         localize { type = 'name_text', key = self.config.vouchers[2], set = 'Voucher' },
            }
        }
end
}

SMODS.Back {
    key = 'spectacle',
    atlas = 'spectacledeck',
    pos = {
        x = 0,
        y = 0
    },
    config = { consumables = { 'c_sp_calico' } ,
    extra = {
    start_ante = 1,
    win_ante = 10,
    },
},
loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables, set = 'Spectaclaw' },
            colours = { 
            HEX('FECB00'),
     }
            }
        }
end,
    apply = function(self, back)
        G.GAME.spectaclaw_rate = 2
        G.GAME.win_ante = self.config.extra.win_ante
        G.GAME.round_resets.ante = self.config.extra.start_ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.ante
    end
}

SMODS.Back {
    key = 'feline',
    atlas = 'felinedeck',
    pos = {
        x = 0,
        y = 0
    },  
    config = { consumable_slot = 2, consumables = { 'c_sp_abyssinian', 'c_sp_abyssinian' } },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables[1], set = 'Catarot' },
            colours = { 
            HEX('E8A6BD'),
     }
            }
        }
end,
    apply = function(self, back)
        G.GAME.catarot_rate = G.GAME.catarot_rate * 3
    end
}

SMODS.Back {
    key = 'crimson',
    atlas = 'crimsondeck',
    pos = {
        x = 0,
        y = 0
    },  
    config = { consumable_slot = 1, consumables = { 'c_sp_themountain' } },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.consumables[1], set = 'Lenormand' },
            colours = { 
            HEX('b10202'),
     }
            }
    }
end,
    apply = function(self, back)
        G.GAME.lenormand_rate = G.GAME.lenormand_rate * 2
    end,
}

SMODS.Back {
    key = 'oinch',
    atlas = 'oinchdeck',
    pos = {
        x = 0,
        y = 0
    }, 
    config = { extra = { boosters = 'p_sp_ultrashufflepack_1' } },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.extra.boosters, set = 'Booster' },
            colours = { 
            HEX('E67E22'),
     }
            }
    }
end,
    apply = function(self)
		stop_use()
		local lock = self.key
		G.CONTROLLER.locks[lock] = true
		G.E_MANAGER:add_event(Event({
			func = function()
				G.E_MANAGER:add_event(Event({
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								local key = "p_sp_ultrashufflepack_1"
								local card = Card(
									G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
									G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
									G.CARD_W * 1.27,
									G.CARD_H * 1.27,
									G.P_CARDS.empty,
									G.P_CENTERS["p_sp_ultrashufflepack_1"],
									{ bypass_discovery_center = true, bypass_discovery_ui = true }
								)
								card.cost = 0
								card.from_tag = true
								delay(0.2)
								G.FUNCS.use_card({ config = { ref_table = card } })
								card:start_materialize()
								G.CONTROLLER.locks[lock] = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return true
			end,
		}))
	end,
}

SMODS.Back {
    key = 'dingbat',
    atlas = 'dingbatdeck',
    pos = {
        x = 0,
        y = 0
    }, 
    config = { extra = { boosters = 'p_sp_megawingdingspack_1' }, joker_slot = 1 },
    loc_vars = function(self, info_queue, back)
        return {
            vars = { localize { type = 'name_text', key = self.config.extra.boosters, set = 'Booster' },
            colours = { 
            HEX('000000'),
     }
            }
    }
end,
    apply = function(self)
		stop_use()
		local lock = self.key
		G.CONTROLLER.locks[lock] = true
		G.E_MANAGER:add_event(Event({
			func = function()
				G.E_MANAGER:add_event(Event({
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								local key = "p_sp_megawingdingspack_1"
								local card = Card(
									G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
									G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
									G.CARD_W * 1.27,
									G.CARD_H * 1.27,
									G.P_CARDS.empty,
									G.P_CENTERS["p_sp_megawingdingspack_1"],
									{ bypass_discovery_center = true, bypass_discovery_ui = true }
								)
								card.cost = 0
								card.from_tag = true
								delay(0.2)
								G.FUNCS.use_card({ config = { ref_table = card } })
								card:start_materialize()
								G.CONTROLLER.locks[lock] = nil
								return true
							end,
						}))
						return true
					end,
				}))
				return true
			end,
		}))
	end,
}

SMODS.Back {
    key = 'decimal',
    atlas = 'decimaldeck',
    pos = {
        x = 0,
        y = 0
    },  
    config = { ante_scaling = 0.75, hands = -1, discards = -1, joker_slot = -1, consumable_slot = -1  },
}

SMODS.Back {
    key = 'hard',
    --atlas = 'harddeck',
    pos = {
        x = 0,
        y = 0
    },  
    config = { ante_scaling = 1.2, hands = -1, discards = -2, joker_slot = -1, consumable_slot = -1  },
}
