local jokers_pool = {
'j_sp_deckhugger', 'j_sp_landlord', 'j_sp_cowboyfromhell', 'j_sp_woodenruler',
'j_sp_skyline', 'j_sp_moodring', 'j_sp_juler', 'j_sp_ragazzo',
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
'j_sp_allwild', 'j_sp_numberline', 'j_sp_lukadoncic', 'j_sp_jackfruit', 'j_sp_freddyfazbear', 'j_sp_bonniebunny',
'j_sp_chicachicken', 'j_sp_foxy', 'j_sp_noisyjoker'
    }

SMODS.Booster {
    key = "shufflepack1",
    name = "Shuffle Pack",

    atlas = 'shufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Buffoon',
    weight = 2,
    cost = 4,
    loc_txt = { 
        name = "Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Shuffle Pack', 
    },
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
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

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "carcanapack1",
    name = "Carcana Pack",

    atlas = 'shufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Arcana',
    weight = 100000,
    cost = 4,
    loc_txt = { 
        name = "Carcana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Carcana Pack', 
    },
    --group_key = "k_sp_shuffle_pack",
    draw_hand = true,
    unlocked = true,
    discovered = false,

        particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Catarot' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_fool", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E8A6BD"))
        ease_background_colour{new_colour = HEX("E8A6BD"), special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "exocelestialpack1",
    name = "Exocelestial Pack",

    atlas = 'shufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Celestial',
    weight = 4,
    cost = 4,
    loc_txt = { 
        name = "Exocelestial Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Exocelestial Pack', 
    },
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0, 0, {
            timer = 0.07,
            scale = 0.1,
            initialize = true,
            lifespan = 15,
            speed = 0.1,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, HEX('a7d6e0'), HEX('fddca0') },
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0, 0, {
            timer = 2,
            scale = 0.05,
            lifespan = 1.5,
            speed = 4,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE },
            fill = true
        })
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Exoplanet' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "c_saturn", nil)
    end

    -- persistent pool for this booster
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose one (safe integer)
    local chosen_idx = math.floor(pseudorandom(pseudoseed("carcana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("0A53A8"))
        ease_background_colour{new_colour = HEX("0A53A8"), special_colour = HEX("000000"), contrast = 2}
    end,
}
