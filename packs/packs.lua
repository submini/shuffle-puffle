-- Register the atlas (MUST match the key)
SMODS.Atlas({
    key = 'shufflepack1',
    path = 'blankpack.png',
    px = 71,
    py = 95
})

SMODS.Booster({
    object_type = "Booster",
    key = 'shufflepack1',
    atlas = 'shufflepack1',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Shuffle Pack',
        text = { 
        'Contains {C:attention}3{}',
        '{X:attention,C:black}shuffle-puffle{} Jokers,',
        'select one of three'
         }
    },
    config = { extra = 3, choose = 1 },
    weight = 1,
    cost = 4,
    order = 46,
    group_key = 'sp_shufflepack1',
    draw_hand = false,
    unlocked = true,
    discovered = true,

    create_card = function(self, booster_card)
        local jokers_pool = {
            'j_sp_deckhugger', 'j_sp_landlord', 'j_sp_cowboyfromhell', 'j_sp_woodenruler',
            'j_sp_skyline', 'j_sp_tamerlane', 'j_sp_moodring', 'j_sp_juler', 'j_sp_ragazzo',
            'j_sp_symmetry', 'j_sp_finisher', 'j_sp_sparechange', 'j_sp_sparedollars',
            'j_sp_jackboys', 'j_sp_placeholder', 'j_sp_entanglement', 'j_sp_measurement',
            'j_sp_checkpoint', 'j_sp_alchemist', 'j_sp_topup', 'j_sp_virus', 'j_sp_triangular',
            'j_sp_resonance', 'j_sp_frog', 'j_sp_encore', 'j_sp_scrapheap', 'j_sp_lonewolf',
            'j_sp_coinflip', 'j_sp_blackcat', 'j_sp_luckybreak', 'j_sp_apex', 'j_sp_onetimeuse',
            'j_sp_speedramp', 'j_sp_sacrifice', 'j_sp_sirbaudelaire', 'j_sp_igor', 'j_sp_ritualist',
            'j_sp_straightbroidery', 'j_sp_stonesentinel', 'j_sp_glassglimmer', 'j_sp_steelspark',
            'j_sp_goldenglean', 'j_sp_luckylode', 'j_sp_auraamp', 'j_sp_maximumload'
        }

        local chosen_key = pseudorandom_element(jokers_pool)

        -- fallback if G.pack_cards is nil
        local target_area = G.pack_cards or {
            center = {x = 0, y = 0},
            T = {x = 0, y = 0, w = 1, h = 1},
            cards = {},
            config = {},
            visible = true,
            enabled = true,
        }

        return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
    end,

    loc_vars = function(self, info_queue, booster_card)
        return {
            vars = {
                self.config.choose or 1,
                self.config.extra or 3
            }
        }
    end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.ORANGE)
        ease_background_colour{new_colour = G.C.ORANGE, special_colour = G.C.BLACK, contrast = 2}
    end,
})
