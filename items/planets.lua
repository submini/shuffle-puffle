local rank_order = {
    ['Ace'] = 14,
    ['King'] = 13,
    ['Queen'] = 12,
    ['Jack'] = 11,
    ['10'] = 10,
    ['9'] = 9,
    ['8'] = 8,
    ['7'] = 7,
    ['6'] = 6,
    ['5'] = 5,
    ['4'] = 4,
    ['3'] = 3,
    ['2'] = 2,
}

SMODS.PokerHand {
    key = 'plateau',
    chips = 37,
    mult = 4.5,
    l_chips = 25,
    l_mult = 4,
    visible = false,

    example = {
        { 'S_5', true },
        { 'C_5', true },
        { 'D_5', true },
        { 'H_4', true },
        { 'D_3', true }
    },

    loc_txt = {
        name = "Plateau",
        description = {
            "Three cards of a matching rank,",
            "one card of the lower rank and",
            "another card of the rank 2 lower",
            "than the matching rank, with",
            "cards from two or more suits"
        }
    },

    evaluate = function(parts, hand)
        -- Group cards by numeric rank
        local ranks = {}
        for _, card in ipairs(hand) do
            local name = card.base and card.base.value
            local r = rank_order[name]
            if r then
                ranks[r] = ranks[r] or {}
                table.insert(ranks[r], card)
            end
        end

        -- Scan for triple + r-1 + r-2
        for r, group in pairs(ranks) do
            if #group >= 3 and ranks[r-1] and #ranks[r-1] >= 1 and ranks[r-2] and #ranks[r-2] >= 1 then
                -- Pick exact 5 cards
                local scoring = { group[1], group[2], group[3], ranks[r-1][1], ranks[r-2][1] }

                -- Suit diversity check
                local suits = {}
                for _, c in ipairs(scoring) do
                    suits[c.base.suit] = true
                end
                local suit_count = 0
                for _ in pairs(suits) do suit_count = suit_count + 1 end

                if suit_count >= 2 then
                    return { scoring }
                end
            end
        end

        return {}
    end
}

SMODS.PokerHand {
    key = 'plateau_flush',
    chips = 135,
    mult = 14,
    l_chips = 35,
    l_mult = 5,
    visible = false,

    example = {
        { 'S_7', true },
        { 'S_7', true },
        { 'S_7', true },
        { 'S_6', true },
        { 'S_5', true }
    },

    loc_txt = {
        name = "Plateau Flush",
        description = {
            "Three cards of a matching rank,",
            "one card of the lower rank and",
            "another card of the rank 2 lower",
            "than the matching rank, with all",
            "cards from the same suit"
        }
    },

    evaluate = function(parts, hand)
        -- group cards by rank
        local ranks = {}
        for _, card in ipairs(hand) do
            local name = card.base and card.base.value
            local r = rank_order[name]
            if r then
                ranks[r] = ranks[r] or {}
                table.insert(ranks[r], card)
            end
        end

        -- check for triple + r-1 + r-2
        for r, group in pairs(ranks) do
            if #group >= 3 and ranks[r-1] and #ranks[r-1] >= 1 and ranks[r-2] and #ranks[r-2] >= 1 then
                -- candidate set of cards
                local scoring = { group[1], group[2], group[3], ranks[r-1][1], ranks[r-2][1] }

                -- check if ALL suits are the same
                local suit = scoring[1].base.suit
                local all_same = true
                for _, c in ipairs(scoring) do
                    if c.base.suit ~= suit then
                        all_same = false
                        break
                    end
                end

                if all_same then
                    return { scoring }
                end
            end
        end

        return {}
    end
}

SMODS.PokerHandPart {
    key = 'umbra_base',
    func = function(hand)
        local faces, numbers, chosen = 0, 0, {}
        for i = 1, #hand do
            local card = hand[i]
            if card:is_face() then
                faces = faces + 1
                table.insert(chosen, card)
            else
                numbers = numbers + 1
                table.insert(chosen, card)
            end
        end

        -- must be exactly 4 faces + 1 number
        if faces == 4 and numbers == 1 then
            return { chosen }
        end
        return {}
    end
}

-- PokerHand: Umbra
SMODS.PokerHand {
    key = "umbra",
    loc_txt = {
        name = "Umbra",
        description = {
            "Consists of exactly four face cards",
            "and one numbered card"
        }
    },
    chips = 50,
    mult = 5,
    l_chips = 20,
    l_mult = 2,
    visible = false,

    example = {
        { 'D_K', true },
        { 'C_K', true },
        { 'H_Q', true },
        { 'H_J', true },
        { 'S_6', true },
    },
    evaluate = function(parts, hand)
        return parts.sp_umbra_base
    end
}

-- PokerHandPart: 4 numbers + 1 face
SMODS.PokerHandPart {
    key = 'antumbra_base',
    func = function(hand)
        local faces, numbers, chosen = 0, 0, {}
        for i = 1, #hand do
            local card = hand[i]
            if card:is_face() then
                faces = faces + 1
                table.insert(chosen, card)
            else
                numbers = numbers + 1
                table.insert(chosen, card)
            end
        end

        -- must be exactly 4 numbers + 1 face
        if numbers == 4 and faces == 1 then
            return { chosen }
        end
        return {}
    end
}

-- PokerHand: Antumbra
SMODS.PokerHand {
    key = "antumbra",
    loc_txt = {
        name = "Antumbra",
        description = {
            "Consists of exactly four numbered cards",
            "and one face card"
        }
    },
    visible = false,
    mult = 2.5,
    chips = 25,
    l_mult = 1,
    l_chips = 10,
    example = {
        { 'D_K', true },
        { 'C_9', true },
        { 'H_7', true },
        { 'H_5', true },
        { 'S_3', true },
    },
    evaluate = function(parts, hand)
        return parts.sp_antumbra_base
    end
}

