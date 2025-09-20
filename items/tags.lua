SMODS.Tag{
    key = "shuffytag",
    loc_txt = {
        name = "Shuffy Tag",
        text = {
            [1] = "Opens a free",
            [2] = "{C:attention}Mega Shuffle Pack{}",
        }
    },
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
    loc_txt = {
        name = "Exo Tag",
        text = {
            [1] = "Opens a free",
            [2] = "{C:attention}Mega Exocelestial Pack{}",
        }
    },
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
    loc_txt = {
        name = "Carcana Tag",
        text = {
            [1] = "Opens a free",
            [2] = "{C:attention}Mega Carcana Pack{}",
        }
    },
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