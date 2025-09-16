SMODS.Tag{
    key = "megashuffler",
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

    --[[
    apply = function(self, tag, context)
        if context.type == "new_blind_choice" then
            tag:yep("Mega Shuffle!", G.C.PURPLE, function()
                -- create the pack
                local center = G.P_CENTERS["p_sp_megashufflepack"]
                if center then
                    local booster = create_card("Booster", G.pack_cards, nil, nil, nil, center)
                    if booster then
                        booster:add_to_deck()
                        G.deck:emplace(booster)
                        booster:start_materialize() -- visual pop-in
                        booster:set_cost(0)         -- make it free
                        booster:open()              -- open instantly
                    end
                end
                return true
            end)
            tag.triggered = true
        end
    end
}

]]--

}