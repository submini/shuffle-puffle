SMODS.ConsumableType {
    key = 'Exoplanet',
    primary_colour = {0.749, 0.878, 0.965, 1},
    secondary_colour = {0.039, 0.325, 0.659, 1},
    collection_rows = { 4, 4 },
    shop_rate = 4,
    loc_txt = {
 		name = 'Exoplanet', 
 		collection = 'Exoplanet Cards', 
 		undiscovered = { 
 			name = 'Undiscovered Exoplanet Card',
 			text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does", 
            },
 		},
 	},
    default = 'c_sp_j1407b',
	can_stack = true,
	can_divide = true,
}


SMODS.Consumable {
    key = 'j1407b',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {hand_type = "Plateau",} },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_plateau"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,

    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'j1407b',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_plateau"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+4', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+25', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'toi5573_b',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Plateau Flush"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_plateau_flush"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_plateau_flush"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+5', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+35', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'noifasui',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Umbra"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_umbra"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_umbra"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+2', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+20', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'fortiduo',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Antumbra"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_antumbra"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_antumbra"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+1', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+10', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'awasis',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Two Three"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_two_three"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_two_three"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+3', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+25', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'kepler120c',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Triangle"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_triangle"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_triangle"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+2.5', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+15.5', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'kereru',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Decagon"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_decagon"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_decagon"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+2', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+15', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'pcd',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Archipelago"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_archipelago"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_archipelago"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+1', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+20', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'dagon',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Twace"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_twace"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_twace"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+2', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+20', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'cuptor',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Euler"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_euler"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_euler"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+3', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+14', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'toge',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Labyrinth"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_labyrinth"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_labyrinth"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+2', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+15', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable {
    key = 'xolotlan',
    set = 'Exoplanet',
    pos = { x = 0, y = 0 },
    config = { extra = {
        hand_type = "Driftwood"
    } },
    loc_vars = function(self, info_queue, card)
    local hand_type = card.ability and card.ability.hand_type or "sp_driftwood"
    local hand = G.GAME.hands[hand_type]
    local hand_name = hand_type
    if hand then
        hand_name = localize(hand_type, 'poker_hands') or hand_type
    end

    return {
        vars = {
            hand and hand.level or 1,
            hand_name,
            hand and hand.l_mult or 1,
            hand and hand.l_chips or 0,
            colours = { (hand and hand.level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, hand and hand.level or 1)]) }
        }
    }
end,
    cost = 3,
    unlocked = true,
    discovered = false,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'placeholder',
use = function(self, card, area, copier)
    local used_card = copier or card

    -- 1. Display hand name and original level before upgrade
    local target_hand = "sp_driftwood"
    if G.GAME.hands[target_hand] then
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    -- 2. Pulse + effect animations with +chips/+mult/+level increment
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { mult = '+3', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { chips = '+30', StatusText = true })

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.9,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true
        end
    }))
    update_hand_text({ delay = 0 }, { level = G.GAME.hands[target_hand].level, StatusText = true })

    delay(1.3)

    -- 3. Actually level up the hand
    if G.GAME.hands[target_hand] then
        level_up_hand(card, target_hand, true, 1)
        update_hand_text(
            { sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 }, 
            { handname = localize(target_hand, 'poker_hands'),
              chips = G.GAME.hands[target_hand].chips, 
              mult = G.GAME.hands[target_hand].mult, 
              level = G.GAME.hands[target_hand].level }
        )
    end

    delay(1.3)

    -- 4. Clear hand text completely
    update_hand_text({ delay = 0 }, { handname = '', chips = '0', mult = '0', level = '' })
end,
    can_use = function(self, card)
        return true
    end
}