SMODS.Booster {
    key = "minishufflepack_1",
    name = "Mini Shuffle Pack",

    atlas = 'minishufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1},
    kind = 'Buffoon',
    weight = 1,
    cost = 3,
    loc_txt = { 
        name = "Mini Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Mini Shuffle Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('e67e22'),
            HEX('000000')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["Shuffle"]
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Shuffle"] then
            table.insert(shuffle_pool, key)
        end
    end

    -- safety: if empty, fallback to normal jokers_pool
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty, falling back to jokers_pool")
        shuffle_pool = jokers_pool
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    -- extra safety
    if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback
    end


    
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "shufflepack_1",
    name = "Shuffle Pack",

    atlas = 'shufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Buffoon',
    weight = 0.6,
    cost = 4,
    loc_txt = { 
        name = "Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Shuffle Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('e67e22'),
            HEX('000000')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["Shuffle"]
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Shuffle"] then
            table.insert(shuffle_pool, key)
        end
    end

    -- safety: if empty, fallback to normal jokers_pool
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty, falling back to jokers_pool")
        shuffle_pool = jokers_pool
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    -- extra safety
    if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback
    end

    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumboshufflepack_1",
    name = "Jumbo Shuffle Pack",

    atlas = 'jumboshufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 4, choose = 1},
    kind = 'Buffoon',
    weight = 0.6,
    cost = 6,
    loc_txt = { 
        name = "Jumbo Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Jumbo Shuffle Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('e67e22'),
            HEX('000000')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["Shuffle"]
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Shuffle"] then
            table.insert(shuffle_pool, key)
        end
    end

    -- safety: if empty, fallback to normal jokers_pool
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty, falling back to jokers_pool")
        shuffle_pool = jokers_pool
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    -- extra safety
    if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback
    end

    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "megashufflepack_1",
    name = "Mega Shuffle Pack",

    atlas = 'megashufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 4, choose = 2},
    kind = 'Buffoon',
    weight = 0.15,
    cost = 8,
    loc_txt = { 
        name = "Mega Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Mega Shuffle Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('e67e22'),
            HEX('000000')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["Shuffle"]
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Shuffle"] then
            table.insert(shuffle_pool, key)
        end
    end

    -- safety: if empty, fallback to normal jokers_pool
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty, falling back to jokers_pool")
        shuffle_pool = jokers_pool
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    -- extra safety
    if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback
    end

    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "ultrashufflepack_1",
    name = "Ultra Shuffle Pack",

    atlas = 'ultrashufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 6, choose = 2},
    kind = 'Buffoon',
    weight = 0.05,
    cost = 10,
    loc_txt = { 
        name = "Ultra Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Ultra Shuffle Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('e67e22'),
            HEX('000000')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["Shuffle"]
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Shuffle"] then
            table.insert(shuffle_pool, key)
        end
    end

    -- safety: if empty, fallback to normal jokers_pool
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty, falling back to jokers_pool")
        shuffle_pool = jokers_pool
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    -- extra safety
    if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback
    end

    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "toomuchshufflepack_1",
    name = "Too-much Shuffle Pack",

    atlas = 'minishufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 9, choose = 3},
    kind = 'Buffoon',
    weight = 0.02,
    cost = 12,
    loc_txt = { 
        name = "Too-much Shuffle Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Too-much Shuffle Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('e67e22'),
            HEX('000000')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["Shuffle"]
    local shuffle_pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Shuffle"] then
            table.insert(shuffle_pool, key)
        end
    end

    -- safety: if empty, fallback to normal jokers_pool
    if #shuffle_pool == 0 then
        print("WARNING: Shuffle pool empty, falling back to jokers_pool")
        shuffle_pool = jokers_pool
    end

    local chosen_key = pseudorandom_element(shuffle_pool)

    -- extra safety
    if not G.P_CENTERS[chosen_key] then
        print("WARNING: Missing Joker center for", chosen_key)
        chosen_key = "j_joker" -- fallback
    end

    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("E67E22"))
        ease_background_colour{new_colour = HEX("E67E22"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "hpack_1",
    name = "H Pack",

    atlas = 'hpack1',
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1},
    kind = 'Buffoon',
    weight = 0.25,
    cost = 6,
    loc_txt = { 
        name = "H Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'H Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('bc002d'),
            HEX('ffffff')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    local pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["H"] then
            table.insert(pool, key)
        end
    end

    -- safety: fallback
    if #pool == 0 then
        pool = { "j_blueprint" }
    end

    -- persistent pool for this booster (prevents duplicates)
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose index safely
    local chosen_idx = math.floor(pseudorandom(pseudoseed("h")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove chosen one so it can’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn joker
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BC002D"))
        ease_background_colour{new_colour = HEX("BC002D"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "wingdingspack_1",
    name = "Wingdings Pack",

    atlas = 'wingdingspack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Buffoon',
    weight = 0.6,
    cost = 4,
    loc_txt = { 
        name = "Wingdings Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Wingdings Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('000000'),
            HEX('ffffff')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["EATEOT"]
    local pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Wingdings"] then
            table.insert(pool, key)
        end
    end

    -- safety: fallback
    if #pool == 0 then
        pool = { "j_joker" }
    end

    -- persistent pool for this booster (prevents duplicates)
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose index safely
    local chosen_idx = math.floor(pseudorandom(pseudoseed("wingdings")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove chosen one so it can’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn joker
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("FFFFFF"))
        ease_background_colour{new_colour = HEX("000000"), special_colour = HEX("FFFFFF"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbowingdingspack_1",
    name = "Jumbo Wingdings Pack",

    atlas = 'jumbowingdingspack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 1},
    kind = 'Buffoon',
    weight = 0.6,
    cost = 6,
    loc_txt = { 
        name = "Jumbo Wingdings Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Jumbo Wingdings Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('000000'),
            HEX('ffffff')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["EATEOT"]
    local pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Wingdings"] then
            table.insert(pool, key)
        end
    end

    -- safety: fallback
    if #pool == 0 then
        pool = { "j_joker" }
    end

    -- persistent pool for this booster (prevents duplicates)
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose index safely
    local chosen_idx = math.floor(pseudorandom(pseudoseed("wingdings")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove chosen one so it can’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn joker
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("FFFFFF"))
        ease_background_colour{new_colour = HEX("000000"), special_colour = HEX("FFFFFF"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "megawingdingspack_1",
    name = "Mega Wingdings Pack",

    atlas = 'megawingdingspack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 2},
    kind = 'Buffoon',
    weight = 0.15,
    cost = 8,
    loc_txt = { 
        name = "Mega Wingdings Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Mega Wingdings Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('000000'),
            HEX('ffffff')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["EATEOT"]
    local pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["Wingdings"] then
            table.insert(pool, key)
        end
    end

    -- safety: fallback
    if #pool == 0 then
        pool = { "j_joker" }
    end

    -- persistent pool for this booster (prevents duplicates)
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose index safely
    local chosen_idx = math.floor(pseudorandom(pseudoseed("wingdings")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove chosen one so it can’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn joker
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("FFFFFF"))
        ease_background_colour{new_colour = HEX("000000"), special_colour = HEX("FFFFFF"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "caretakerpack_1",
    name = "Caretaker Pack",

    atlas = 'caretakerpack1',
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1},
    kind = 'Buffoon',
    weight = 0.1,
    cost = 7,
    loc_txt = { 
        name = "Caretaker Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Caretaker Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('245570'),
            HEX('ffffff')
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = false,
    unlocked = true,
    discovered = false,

    create_card = function(self, booster_card)
    -- Build a filtered pool of only jokers with pools["EATEOT"]
    local pool = {}
    for key, center in pairs(G.P_CENTERS) do
        if center.set == "Joker" and center.pools and center.pools["EATEOT"] then
            table.insert(pool, key)
        end
    end

    -- safety: fallback
    if #pool == 0 then
        pool = { "j_blueprint" }
    end

    -- persistent pool for this booster (prevents duplicates)
    booster_card.local_pool = booster_card.local_pool or {unpack(pool)}

    -- choose index safely
    local chosen_idx = math.floor(pseudorandom(pseudoseed("caretaker")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove chosen one so it can’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn joker
    local target_area = G.pack_cards or G.jokers
    return create_card("Joker", target_area, nil, nil, true, true, chosen_key, nil)
end,

    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("245570"))
        ease_background_colour{new_colour = HEX("245570"), special_colour = G.C.BLACK, contrast = 2}
    end,
}

SMODS.Booster {
    key = "lenormanapack_1",
    name = "Lenormana Pack",

    atlas = 'lenormanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Arcana',
    weight = 1,
    cost = 4,
    loc_txt = { 
        name = "Lenormana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Lenormana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('b10202'), 0.4), lighten(HEX('b10202'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Lenormand' then
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("lenormana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("b10202"))
        ease_background_colour{new_colour = HEX("b10202"), special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "jumbolenormanapack_1",
    name = "Jumbo Lenormana Pack",

    atlas = 'jumbolenormanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 1},
    kind = 'Arcana',
    weight = 1,
    cost = 6,
    loc_txt = { 
        name = "Jumbo Lenormana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Jumbo Lenormana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('b10202'), 0.4), lighten(HEX('b10202'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Lenormand' then
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("lenormana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("b10202"))
        ease_background_colour{new_colour = HEX("b10202"), special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "megalenormanapack_1",
    name = "Mega Lenormana Pack",

    atlas = 'megalenormanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 2},
    kind = 'Arcana',
    weight = 0.25,
    cost = 8,
    loc_txt = { 
        name = "Mega Lenormana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Mega Lenormana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('b10202'), 0.4), lighten(HEX('b10202'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Lenormand' then
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("lenormana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("b10202"))
        ease_background_colour{new_colour = HEX("b10202"), special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "ultralenormanapack_1",
    name = "Ultra Lenormana Pack",

    atlas = 'ultralenormanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 7, choose = 2},
    kind = 'Arcana',
    weight = 0.15,
    cost = 10,
    loc_txt = { 
        name = "Ultra Lenormana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Ultra Lenormana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('b10202'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('b10202'), 0.4), lighten(HEX('b10202'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Lenormand' then
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("lenormana")) * #booster_card.local_pool) + 1
    local chosen_key = booster_card.local_pool[chosen_idx]

    -- remove so it won’t repeat
    table.remove(booster_card.local_pool, chosen_idx)

    -- spawn
    local chosen_rarity = (G.P_CENTERS[chosen_key] and G.P_CENTERS[chosen_key].rarity) or "c"
    local target_area = G.pack_cards or G.consumeables
    return create_card("Consumable", target_area, chosen_rarity, nil, true, true, chosen_key, nil)
end,


    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("b10202"))
        ease_background_colour{new_colour = HEX("b10202"), special_colour = HEX("000000"), contrast = 2}
    end,
}

SMODS.Booster {
    key = "carcanapack_1",
    name = "Carcana Pack",

    atlas = 'carcanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Arcana',
    weight = 1,
    cost = 4,
    loc_txt = { 
        name = "Carcana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Carcana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('E8A6BD'), 0.4), lighten(HEX('E8A6BD'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
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
    key = "jumbocarcanapack_1",
    name = "Jumbo Carcana Pack",

    atlas = 'jumbocarcanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 1},
    kind = 'Arcana',
    weight = 1,
    cost = 6,
    loc_txt = { 
        name = "Carcana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Jumbo Carcana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('E8A6BD'), 0.4), lighten(HEX('E8A6BD'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
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
    key = "megacarcanapack_1",
    name = "Mega Carcana Pack",

    atlas = 'megacarcanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 2},
    kind = 'Arcana',
    weight = 0.25,
    cost = 8,
    loc_txt = { 
        name = "Carcana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Mega Carcana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('E8A6BD'), 0.4), lighten(HEX('E8A6BD'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
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
    key = "ultracarcanapack_1",
    name = "Ultra Carcana Pack",

    atlas = 'ultracarcanapack1',
    pos = { x = 0, y = 0 },
    config = { extra = 7, choose = 2},
    kind = 'Arcana',
    weight = 0.15,
    cost = 10,
    loc_txt = { 
        name = "Carcana Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Ultra Carcana Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('E8A6BD'),
     }
        }
    }
    end,
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
            colours = { G.C.WHITE, lighten(HEX('E8A6BD'), 0.4), lighten(HEX('E8A6BD'), 0.2), lighten(HEX('FFFFFF'), 0.2) },
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
    key = "exocelestialpack_1",
    name = "Exocelestial Pack",

    atlas = 'exocelestialpack1',
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    kind = 'Celestial',
    weight = 1,
    cost = 4,
    loc_txt = { 
        name = "Exocelestial Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Exocelestial Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("exocelestial")) * #booster_card.local_pool) + 1
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

SMODS.Booster {
    key = "jumboexocelestialpack_1",
    name = "Jumbo Exocelestial Pack",

    atlas = 'jumboexocelestialpack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 1},
    kind = 'Celestial',
    weight = 1,
    cost = 6,
    loc_txt = { 
        name = "Exocelestial Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Jumbo Exocelestial Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("exocelestial")) * #booster_card.local_pool) + 1
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

SMODS.Booster {
    key = "megaexocelestialpack_1",
    name = "Mega Exocelestial Pack",

    atlas = 'megaexocelestialpack1',
    pos = { x = 0, y = 0 },
    config = { extra = 5, choose = 2},
    kind = 'Celestial',
    weight = 0.25,
    cost = 8,
    loc_txt = { 
        name = "Exocelestial Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Mega Exocelestial Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('0A53A8'),
     }
        }
    }
    end,
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
    local chosen_idx = math.floor(pseudorandom(pseudoseed("exocelestial")) * #booster_card.local_pool) + 1
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

SMODS.Booster {
    key = "crystalpack_1",
    name = "Crystal Pack",

    atlas = 'minishufflepack1',
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1},
    kind = 'Tarot',
    weight = 0.5,
    cost = 4,
    loc_txt = { 
        name = "Crystal Pack",
        text = {
            "Choose some jokers",
        },
        group_name = 'Crystal Pack', 
    },
    loc_vars = function(self, info_queue, card)
        return {
        vars =  {
        colours = { 
            HEX('11734b'),
     }
        }
    }
    end,
    --group_key = "k_sp_shuffle_pack",
    draw_hand = true,
    unlocked = true,
    discovered = false,

create_card = function(self, booster_card)
    -- build Catarot pool fresh
    local pool = {}
    for k, v in pairs(G.P_CENTERS) do
        if v.set == 'Gem' then
            table.insert(pool, k)
        end
    end

    -- fall back if empty
    if #pool == 0 then
        return create_card("Consumable", G.consumeables, "c", nil, true, true, "j_sp_blackcat", nil)
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
        ease_colour(G.C.DYN_UI.MAIN, HEX("11734b"))
        ease_background_colour{new_colour = HEX("11734b"), special_colour = HEX("000000"), contrast = 2}
    end,
}