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
            "A three-rank Straight, but hand has 3",
            "cards of the highest rank, with cards from",
            "two or more suits"
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
    chips = 120,
    mult = 7.5,
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
            "A Plateau but all cards are the same suit",
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
            "Four face cards and one numbered card"
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
            "Four numbered cards and one face card"
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

SMODS.PokerHand{
  key = 'two_three',
  mult = 3, chips = 40,
  l_mult = 3, l_chips = 25,
  visible = false,

  loc_txt = {
    name = 'Two Three',
    description = {
      "Three cards of the same suit",
      "and three cards of the same rank"
    }
  },

  example = {
    { 'S_J', true }, { 'D_J', true }, { 'S_J', true }, { 'S_9', true }, { 'S_2', false },
  },

  evaluate = function(parts, hand)
    local rank_map, suit_map = {}, {}

    for _, c in ipairs(hand) do
      local rank = c.base.value
      local suit = c.base.suit

      rank_map[rank] = rank_map[rank] or {}
      suit_map[suit] = suit_map[suit] or {}

      table.insert(rank_map[rank], c)
      table.insert(suit_map[suit], c)
    end

    local rank_cards, suit_cards = {}, {}

    for _, cards in pairs(rank_map) do
      if #cards >= 3 then
        for _, v in ipairs(cards) do table.insert(rank_cards, v) end
      end
    end

    for _, cards in pairs(suit_map) do
      if #cards >= 3 then
        for _, v in ipairs(cards) do table.insert(suit_cards, v) end
      end
    end

    if #rank_cards == 0 or #suit_cards == 0 then return {} end

    -- merge_unique helper: flatten + dedupe
    local merged, seen = {}, {}
    for _, pile in ipairs({rank_cards, suit_cards}) do
      for _, v in ipairs(pile) do
        if not seen[v] then
          table.insert(merged, v)
          seen[v] = true
        end
      end
    end

    return { merged }
  end
}

-- helper: check if sum is triangular
local function is_triangular(n)
  local k = 1
  while (k * (k + 1) / 2) <= n do
    if (k * (k + 1) / 2) == n then return true end
    k = k + 1
  end
  return false
end

-- helper: convert card rank to numeric
local function card_value(c)
  local raw = c.base and c.base.value or nil
  local v

  if type(raw) == "number" then
    v = raw
  elseif type(raw) == "string" then
    if raw == "Ace" or raw == "A" then v = 14
    elseif raw == "Jack" or raw == "J" then v = 11
    elseif raw == "Queen" or raw == "Q" then v = 12
    elseif raw == "King" or raw == "K" then v = 13
    else
      v = tonumber(raw) or 0
    end
  else
    v = 0
  end

  -- apply Triangle’s rules
  if v == 14 then return 1 end            -- Ace = 1
  if v >= 11 and v <= 13 then return 10 end -- J/Q/K = 10
  return v
end

SMODS.PokerHand{
  key = 'triangle',
  mult = 4.5, chips = 30,
  l_mult = 2.5, l_chips = 15.5,
  visible = false,

  loc_txt = {
    name = 'Triangle',
    description = {
      '3+ cards where the sum of all card ranks',
      'is a triangular number greater than 10.',
      '(Aces count as 1, face cards count as 10)'
    }
  },

  example = {
    { 'D_A', true }, { 'C_A', true }, { 'C_K', true }, { 'H_9', true }
  },

  evaluate = function(parts, hand)
    local sum = 0
    for _, c in ipairs(hand) do
      sum = sum + card_value(c)
    end
    if #hand >= 3 and is_triangular(sum) and sum > 10 then
      return { hand }
    else
      return {}
    end
  end
}

-- helper: convert card rank to numeric
local function card_value_decagon(c)
  local raw = c.base and c.base.value or nil
  local v

  if type(raw) == "number" then
    v = raw
  elseif type(raw) == "string" then
    if raw == "Ace" or raw == "A" then v = 14
    elseif raw == "Jack" or raw == "J" then v = 11
    elseif raw == "Queen" or raw == "Q" then v = 12
    elseif raw == "King" or raw == "K" then v = 13
    else
      v = tonumber(raw) or 0
    end
  else
    v = 0
  end

  -- apply Decagon’s rules
  if v == 14 then return 1 end            -- Ace = 1
  if v >= 11 and v <= 13 then return 10 end -- J/Q/K = 10
  return v
end

SMODS.PokerHand{
  key = 'decagon',
  mult = 3, chips = 35,
  l_mult = 2, l_chips = 15,
  visible = false,

  loc_txt = {
    name = 'Decagon',
    description = {
      '3+ cards where the sum of all the ranks',
      'is a triangular number above 10',
      '(Aces count as 1, face cards count as 10)'
    }
  },

  example = {
    { 'H_A', true }, { 'S_A', true }, { 'H_5', true }, { 'C_3', true },  -- 1+1+5+3 = 10
  },

  evaluate = function(parts, hand)
    local sum = 0
    for _, c in ipairs(hand) do
      sum = sum + card_value_decagon(c)
    end
    if #hand >= 3 and sum == 10 then
      return { hand }
    else
      return {}
    end
  end
}

SMODS.PokerHand{
  key = 'archipelago',
  mult = 2.5, chips = 30,
  l_mult = 1, l_chips = 20,
  visible = false,

  loc_txt = {
    name = 'Archipelago',
    description = {
      'A 5-card hand with two cards of the same suit,',
      'and three cards each of different suits.'
    }
  },

  example = {
    { 'H_A', true }, { 'H_K', true },  -- pair of Hearts
    { 'C_7', true }, { 'S_6', true }, { 'D_3', true }, -- all unique suits
  },

evaluate = function(parts, hand)
  if #hand ~= 5 then return {} end

  local suit_counts = {}
  for _, c in ipairs(hand) do
    local suit = c.base and c.base.suit
    if suit then
      suit_counts[suit] = (suit_counts[suit] or 0) + 1
    end
  end

  -- we need exactly one suit with 2 cards
  -- and exactly 3 suits with 1 card each
  local two_suit, one_suits = 0, 0
  for _, count in pairs(suit_counts) do
    if count == 2 then two_suit = two_suit + 1 end
    if count == 1 then one_suits = one_suits + 1 end
  end

  if two_suit == 1 and one_suits == 3 then
    return { hand }
  else
    return {}
  end
end

}

-- helper: normalize rank into number
local function to_numeric_rank(c)
  local raw = c.base and c.base.value or nil
  if type(raw) == "number" then
    return raw
  elseif type(raw) == "string" then
    if raw == "Ace" or raw == "A" then return 14 end
    if raw == "Jack" or raw == "J" then return 11 end
    if raw == "Queen" or raw == "Q" then return 12 end
    if raw == "King" or raw == "K" then return 13 end
    return tonumber(raw) or 0
  else
    return 0
  end
end

SMODS.PokerHand {
  key = 'twace',
  chips = 33,
  mult = 4.5,
  l_chips = 20,
  l_mult = 2,
  visible = false,

  loc_txt = {
    name = 'Twace',
    description = {
      'Two Aces and three numbered cards'
    }
  },

  example = {
    { 'S_A', true }, { 'C_A', true }, { 'C_T', true }, { 'S_7', true }, { 'D_6', true }
  },

  evaluate = function(parts, hand)
    if #hand ~= 5 then return {} end

    local ace_count = 0
    local number_count = 0

    for _, c in ipairs(hand) do
      local rank = to_numeric_rank(c)
      if rank == 14 then
        ace_count = ace_count + 1
      elseif rank >= 2 and rank <= 10 then
        number_count = number_count + 1
      end
    end

    if ace_count == 2 and number_count == 3 then
      return { hand }
    end

    return {}
  end
}

------ hand here ------

SMODS.PokerHand {
    key = 'labyrinth',
    chips = 25,
    mult = 3.5,
    l_chips = 15,
    l_mult = 2,
    visible = false,

    loc_txt = {
        name = 'Labyrinth',
        description = {
            'A hand where the ranks alternate',
            'between odd and even values'
        }
    },

    example = {
        { 'S_T', true },{ 'D_7', true },{ 'C_6', true },{ 'H_3', true }, { 'H_2', true }
    },

    evaluate = function(parts, hand)
        if #hand ~= 5 then return {} end  

        local last_parity = nil
        for _, c in ipairs(hand) do
            local rank = to_numeric_rank(c)
            if rank == 0 then return {} end  -- invalid card somehow

            local parity = rank % 2
            if last_parity ~= nil then
                if parity == last_parity then
                    return {}  -- two odds or two evens in a row → fail
                end
            end
            last_parity = parity
        end

        return { hand }
    end
}

local function is_consecutive(a, b)
  return math.abs(a - b) == 1
end

-- core check
local function check_driftwood(hand)
  if #hand ~= 5 then return false end

  -- collect ranks (with ace as both 14 and 1 if present)
  local ranks = {}
  for _, c in ipairs(hand) do
    local r = to_numeric_rank(c)
    table.insert(ranks, r)
  end
  table.sort(ranks)

  -- try every 3-card window for a straight run
  for i = 1, 3 do
    local a, b, c = ranks[i], ranks[i+1], ranks[i+2]

    -- check normal straight
    if b == a + 1 and c == b + 1 then
      -- collect loners
      local loners = {}
      for j = 1, 5 do
        if j < i or j > i+2 then table.insert(loners, ranks[j]) end
      end
      -- loners must NOT be consecutive with each other OR with the run
      local valid = true
      if is_consecutive(loners[1], loners[2]) then valid = false end
      for _, l in ipairs(loners) do
        if is_consecutive(l, a) or is_consecutive(l, b) or is_consecutive(l, c) then
          valid = false
        end
      end
      if valid then return true end
    end
  end

  -- special ace-low check (A=1)
  if ranks[1] == 2 and ranks[2] == 3 and ranks[5] == 14 then
    -- treat Ace as 1, check 1-2-3 run
    local run = {1, 2, 3}
    local others = {ranks[3], ranks[4], ranks[5]}
    local loners = {others[2], others[3]} -- only 2 should be outside
    -- same loner checks
    local valid = true
    if is_consecutive(loners[1], loners[2]) then valid = false end
    for _, l in ipairs(loners) do
      for _, r in ipairs(run) do
        if is_consecutive(l, r) then valid = false end
      end
    end
    if valid then return true end
  end

  return false
end

SMODS.PokerHand {
  key = 'driftwood',
  chips = 32,
  mult = 4,
  l_chips = 30,
  l_mult = 3,
  visible = false,

  loc_txt = {
    name = 'Driftwood',
    description = {
      'A three-rank Straight with two',
      'other cards not consecutive',
      'with each other or the other three'
    }
  },

  example = {
    { 'H_T', true }, { 'S_9', true }, { 'H_8', true },
    { 'D_5', true }, { 'S_3', true }
  },

  evaluate = function(parts, hand)
    if check_driftwood(hand) then
      return { hand }
    end
    return {}
  end
}

SMODS.PokerHand{
    key = 'euler',
    chips = 27,
    mult = 8,
    l_chips = 14,
    l_mult = 3,
    visible = false,

    loc_txt = {
        name = 'Euler',
        description = {
            'A five-card hand with the ranks containing',
            'the first five digits of Euler\'s number'
        }
    },

    example = {
        { 'D_2', true }, { 'D_7', true }, { 'H_A', true },
        { 'C_8', true }, { 'C_2', true }
    },

    evaluate = function(parts, hand)
        if #hand ~= 5 then return {} end

        -- helper to normalize rank to string
        local function rank_str(c)
            if type(c.base.value) == "number" then
                if c.base.value == 14 then return "A" end  -- numeric Ace
                return tostring(c.base.value)
            elseif type(c.base.value) == "string" then
                if c.base.value:lower() == "ace" then return "A" end
                return c.base.value
            end
            return tostring(c.base.value)
        end

        local counts = {}
        for _, c in ipairs(hand) do
            local r = rank_str(c)
            counts[r] = (counts[r] or 0) + 1
        end

        if counts["2"] == 2 and counts["7"] == 1 and counts["8"] == 1 and counts["A"] == 1 then
            return { hand } -- hand matches
        end

        return {} -- hand doesn't match
    end
}
