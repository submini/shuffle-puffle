SMODS.Joker{ --Pencil
    key = "pencil",
    config = {
        extra = {
            pb_bonus_c492cbdd = 20,
            perma_bonus = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pencil',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = 'a {C:attention}Straight{}, give each',
            [3] = 'scored card a',
            [4] = 'permanent {C:blue}+20{} Chips',
            [5] = 'bonus'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1,
        h = 66 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'pencil',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if next(context.poker_hands["Straight"]) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.pb_bonus_c492cbdd
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}

SMODS.Joker{ --Scissors
    key = "scissors1",
    config = {
        extra = {
            xmult = 1,
            blind_size = 0.75
        }
    },
    loc_txt = {
        ['name'] = 'Scissors 1',
        ['text'] = {
            [1] = 'X0.75 Blind requirement chips',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'scissors1',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
        if context.setting_blind  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Snip!"})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end }
        end
    end
}

SMODS.Joker{ --Scissors 2
    key = "scissors2",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Scissors 2',
        ['text'] = {
            [1] = 'If {C:blue}first hand{} of round',
            [2] = 'has only {C:attention}2{} played cards,',
            [3] = '{C:red}destroy{} both of them and',
            [4] = 'gain {X:red,C:white}+X0.5{} Mult',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'scissors2',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if (G.GAME.current_round.hands_played == 0 and #context.scoring_hand == 2) then
                context.other_card.should_destroy = true
                card.ability.extra.xmult = (card.ability.extra.xmult) + 0.5
                return {
                    message = "Snip!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.xmult
                }
        end
    end
}

SMODS.Joker{ --Glasses
    key = "glasses",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Glasses',
        ['text'] = {
            [1] = 'If at least {C:attention}3{} cards of',
            [2] = '{C:spades}Spade{} or {C:clubs}Club{} suit are',
            [3] = 'discarded, this joker',
            [4] = 'gains {C:red}+8{} Mult',
            [5] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'glasses',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.pre_discard  then
            if (function()
    local suitCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:is_suit("Spades") or c:is_suit("Clubs") then
            suitCount = suitCount + 1
        end
    end
    
    return suitCount >= 3
end)() then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 8
                    return true
                end,
                    message = "Upgrade!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Bell
    key = "bell",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Bell',
        ['text'] = {
            [1] = 'If played {C:blue}hand{} is the',
            [2] = '{C:attention}first hand{} of round,',
            [3] = 'retrigger every card',
            [4] = '{C:attention}2{} times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'bell',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}

SMODS.Joker {
    key = "book",
    name = "Book",
    atlas = "book", -- swap this with your Wingdings atlas
    pos = { x = 0, y = 0 },     -- adjust coords for sprite
    rarity = 3,                 -- adjust rarity if needed
    cost = 10,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = false,
    in_pool = true,
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },

    config = {
        extra = { trank = {}, tsuit = {}, scry = false },
    },

    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.scry then
            return {
                key = self.key .. "_alt",
                vars = {
                    card.ability.extra.trank[1], card.ability.extra.trank[2], card.ability.extra.trank[3],
                    card.ability.extra.trank[4], card.ability.extra.trank[5],
                    card.ability.extra.tsuit[1], card.ability.extra.tsuit[2], card.ability.extra.tsuit[3],
                    card.ability.extra.tsuit[4], card.ability.extra.tsuit[5]
                }
            }
        else
            return {}
        end
    end,

    update = function(self, card, dt)
    if G.deck and card.ability.extra.scry then
        for i = 1, 5 do
            local _card = G.deck.cards[#G.deck.cards-(i-1)]
            if _card then
                -- Suit: just take the suit key after underscore if present
                local suit_key = SMODS.Suits[_card.base.suit].key
                local underscore_pos = string.find(suit_key, "_")
                if underscore_pos then
                    suit_key = string.sub(suit_key, underscore_pos + 1)
                end
                card.ability.extra.tsuit[i] = suit_key

                -- Rank: use raw rank key
                local rank_key = SMODS.Ranks[_card.base.value].key
                card.ability.extra.trank[i] = rank_key .. " of "
            end
        end
    end
end,

    add_to_deck = function(self, card, context)
        if G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.HAND_PLAYED then
            card.ability.extra.scry = true
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.scry = true
        end
        if context.end_of_round then
            card.ability.extra.scry = false
        end
    end,
}

SMODS.Joker{ --Candle
    key = "candle",
    config = {
        extra = {
            odds = 2,
            repetitions_min = 1,
            repetitions_max = 3
        }
    },
    loc_txt = {
        ['name'] = 'Candle',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to',
            [2] = '{C:attention}retrigger{} scored card',
            [3] = 'from {C:attention}1{} to {C:attention}3{} times'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'candle',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
                if SMODS.pseudorandom_probability(card, 'group_0_b6ed7cbe', 1, card.ability.extra.odds, 'j_sp_candle', false) then
              return {repetitions = pseudorandom('repetitions_61d8574d', card.ability.extra.repetitions_min, card.ability.extra.repetitions_max)}
                        
          end
        end
    end
}

SMODS.Joker{ --Touchtone Telephone
    key = "touchtonetelephone",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Touchtone Telephone',
        ['text'] = {
            [1] = 'This joker gains {C:red}+2{} Mult',
            [2] = 'if scored card is {C:attention}not{} an',
            [3] = '{C:attention}Ace{} or a {C:attention}face card{}',
            [4] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}{C:inactive}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'touchtone',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not (context.other_card:is_face()) and not (context.other_card:get_id() == 14)) then
                card.ability.extra.mult = (card.ability.extra.mult) + 2
                return {
                    message = "Phone!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}

SMODS.Joker{ --Envelope
    key = "envelope",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Envelope',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected,',
            [2] = 'add {C:attention}1{} to {C:attention}3{} enhanced',
            [3] = 'cards to deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'envelope',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                for i = 1, pseudorandom('repetitions_41af9c6f', 1, 3) do
              local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_enhancement'))
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                        SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Envelope!", colour = G.C.RED})
          end
            end
        end
    end
}

SMODS.Joker{ --Stamped Envelope
    key = "stampedenvelope",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Stamped Envelope',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected,',
            [2] = 'add {C:attention}1{} to {C:attention}3{} cards with',
            [3] = 'a random seal to deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'stampedenvelope',
   pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                for i = 1, pseudorandom('repetitions_5f441dd0', 1, 3) do
              local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_seal(pseudorandom_element({"Gold", "Red", "Blue", "Purple"}, pseudoseed('add_card_seal')), true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                        SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Envelope!", colour = G.C.BLUE})
          end
            end
        end
    end
}

SMODS.Joker{ --Mailbox 1
    key = "mailbox1",
    config = {
        extra = {
            mult = 0,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mailbox 1',
        ['text'] = {
            [1] = 'This joker gives a',
            [2] = 'permanent {C:red}+#1#{} Mult {C:attention}bonus{}',
            [3] = 'to every scored card',
            [4] = 'if hand contains a {C:attention}Straight{},',
            [5] = 'bonus is random'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'mailbox1',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if next(context.poker_hands["Straight"]) then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
            end
        end
        if context.before and context.cardarea == G.jokers  then
                return {
                    func = function()
                    card.ability.extra.mult = pseudorandom('mult_892ad783', 0, 10)
                    return true
                end
                }
        end
    end
}

SMODS.Joker{ --Mailbox 2
    key = "mailbox2",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Mailbox 2',
        ['text'] = {
            [1] = 'When this joker is sold,',
            [2] = 'create {C:attention}2{} jokers',
            [3] = '{C:inactive}(Irrespective of room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'mailbox2',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.selling_self  then
            if true then
                for i = 1, card.ability.extra.repetitions do
              SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
          end
            end
        end
    end
}

SMODS.Joker{ --Closed Folder
    key = "closedfolder",
    config = {
        extra = {
            xchips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Closed Folder',
        ['text'] = {
            [1] = 'Gains {X:blue,C:white}+X0.5{} Chips when',
            [2] = '{C:attention}Blind{} is selected but',
            [3] = 'only gives the chips in',
            [4] = '{C:attention}Boss Blinds{}',
            [5] = '{C:inactive}(Currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'closedfolder',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xchips}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.xchips = (card.ability.extra.xchips) + 0.5
                    return true
                end,
                    message = "Folder!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind.boss then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}

SMODS.Joker{ --Open Folder
    key = "openfolder",
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Open Folder',
        ['text'] = {
            [1] = 'Gains {X:red,C:white}+X0.3{} Mult when',
            [2] = '{C:attention}Blind{} is selected but',
            [3] = 'only gives the chips in',
            [4] = '{C:attention}Boss Blinds{}',
            [5] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'openfolder',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + 0.3
                    return true
                end,
                    message = "Folder!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.blind.boss then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

SMODS.Joker{ --Document
    key = "document",
    config = {
        extra = {
            chips = 200,
            start_dissolve = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Document',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips,',
            [2] = '{C:blue}-25{} Chips for every',
            [3] = '{C:attention}reroll{} in shop'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'document',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.reroll_shop  then
            if (card.ability.extra.chips or 0) <= 25 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Shredded!"
                }
            else
                return {
                    func = function()
                    card.ability.extra.chips = math.max(0, (card.ability.extra.chips) - 25)
                    return true
                end,
                    message = "-25", colour = G.C.BLUE
                }
            end
        end
    end
}

SMODS.Joker{ --File Cabinet
    key = "filecabinet",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'File Cabinet',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected,',
            [2] = 'add {C:attention}1{} to {C:attention}4{} {C:dark_edition}Negative{}',
            [3] = 'playing cards to deck'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'filecabinet',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                for i = 1, pseudorandom('repetitions_626764d5', 1, 4) do
              local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_edition("e_negative", true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                        SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Cabinet!", colour = HEX('808080')})
          end
            end
        end
    end
}

SMODS.Joker{ --Hourglass
    key = "hourglass",
    config = {
        extra = {
            pb_x_mult_7ee02ca0 = 1,
            perma_x_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hourglass',
        ['text'] = {
            [1] = 'If played hand contains',
            [2] = 'a {C:attention}Straight{}, give the first',
            [3] = '{C:attention}3{} cards a permanent',
            [4] = '{X:red,C:white}X2{} Mult bonus'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1, 
        h = 66 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'hourglass',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[2] or context.other_card == context.scoring_hand[3]) and next(context.poker_hands["Straight"])) then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.pb_x_mult_7ee02ca0
                return {
                    extra = { message = "Hourglass!", colour = G.C.MULT }, card = card
                }
            end
        end
    end
}



SMODS.Joker{ --H
    key = "et",
    config = {
    },
    loc_txt = {
        ['name'] = 'Ampersand 1',
        ['text'] = {
            [1] = 'h',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1,
        h = 66 * 1,
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'et',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

    calculate = function(self, card, context)
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[1]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}

SMODS.Joker{ --Ampersand 2
    key = "ampersand2",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ampersand 2',
        ['text'] = {
            [1] = '{C:attention}Copies{} the effect of',
            [2] = 'the last {C:attention}2{} jokers',
            [3] = 'in the jokers slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 66 * 1,
        h = 66 * 1,
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'and2',
    pools = { ["Wingdings"] = true },

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge("Wingdings", HEX("000000"), G.C.WHITE, 1)
    end,

     calculate = function(self, card, context)
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
        
        local target_joker = nil
        
        target_joker = G.jokers.cards[2]
        if target_joker == card then
            target_joker = nil
        end
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}