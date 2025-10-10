local function count_face_cards()
    local count = 0
    for _, v in ipairs(G.playing_cards or {}) do
        if v:is_face() then count = count + 1 end
    end
    return count
end

SMODS.Joker{
    name = "Tamerlane",
    key = "tamerlane",
    config = {
        extra = {
            emult = 1.0 -- Initial base
        }
    },
    loc_txt = {
        name = "Tamerlane",
        text = {
            [1] = "This Joker grants {C:purple}+^0.025{} Mult",
            [2] = "for each {C:attention}face card{} in your full deck",
            [3] = "{C:inactive}(Currently ^#1# Mult){}"
        }
    },
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "tamerlane", -- your layered Joker sprite base name

    loc_vars = function(self, info_queue, card)
        local face_count = count_face_cards()
        local emult = 1.0 + (0.025 * face_count)
        card.ability.extra.emult = emult -- update it here too!
        return {
            vars = {
                string.format("%.3f", emult)
            }
        }
    end,



    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local face_count = count_face_cards()
            local emult = 1.0 + (0.025 * face_count)
            card.ability.extra.emult = emult
            return {
                    e_mult = card.ability.extra.emult
                }

        end
    end
}

SMODS.Joker{ --LeBron James
    key = "lebronjames",
    config = {
        extra = {
            Xmult = 23,
            Xmult2 = 6
        }
    },
    loc_txt = {
        ['name'] = 'LeBron James',
        ['text'] = {
            [1] = '{X:red,C:white}X23{} Mult,',
            [2] = 'Every scored {C:attention}King{}',
            [3] = 'gives {X:red,C:white}X6{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'lebronjames',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 13 then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            end
        end
    end
}