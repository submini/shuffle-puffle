-- Register the atlas (MUST match the key)
SMODS.Atlas({
    key = 'shufflepack1',
    path = 'blankpack.png',
    px = 71,
    py = 95
})

SMODS.Booster {
    key = "shufflepack1",
    atlas = 'shufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Buffoon',
    weight = 1000.0, 
    cost = 4,
    group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

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
            'j_sp_goldenglean', 'j_sp_luckylode', 'j_sp_auraamp', 'j_sp_maximumload', 'j_sp_lejokerjames', 
            'j_sp_nikolajokic','j_sp_handfulfortune', 'j_sp_handfulmultiply', 'j_sp_pacer', 'j_sp_openinggambit',
            'j_sp_twosides', 'j_sp_cosmicdust', 'j_sp_quintetreward', 'j_sp_straighttobusiness', 'j_sp_pointguard',
            'j_sp_allwild', 'j_sp_numberline', 'j_sp_lukadoncic', 'j_sp_beringstrait', 'j_sp_lemniscate', 'j_sp_toad',
            'j_sp_jimbro', 'j_sp_unfairruler', 'j_sp_jackfruit', 'j_sp_doublebongcloud', 'j_sp_freddyfazbear', 'j_sp_bonniebunny',
            'j_sp_chicachicken', 'j_sp_foxy', 'j_sp_noisyjoker', 'j_sp_speedrunner', 'j_sp_cantaloupe', 'j_sp_crazyhamburger'
        }

        local chosen_key = pseudorandom_element(jokers_pool)
        if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback to default
        end

        -- fallback if G.pack_cards is nil
        local target_area = G.pack_cards or {
            center = {x = 0, y = 0},
            T = {x = 0, y = 0, w = 1, h = 1},
            cards = {},
            config = {},
            visible = true,
            enabled = true,
        }

        local target_area = G.pack_cards or G.jokers
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
}
