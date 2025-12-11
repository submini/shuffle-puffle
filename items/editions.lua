SMODS.Shader{
    key = 'gilded',
    path = 'gilded.fs'
}

SMODS.Edition {
    key = 'gilded',
    shader = 'sp_gilded',
    config = {
        extra = {
            dollars0 = 2
        }
    },
    in_shop = false,
    weight = 0.1,
    extra_cost = 3,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Gilded',
        label = 'Gilded',
        text = {
            [1] = '{C:money}+$2{} when triggered'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
    calculate = function(self, card, context)
        -- Playing cards: trigger when card scores
        if card.playing_card and (context.pre_joker or (context.main_scoring and context.cardarea == G.play)) then
            return {
                func = function()
                    ease_dollars(2)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$2", colour = G.C.MONEY})
                    return true
                end
            }
        end
        
        -- Jokers: trigger during joker scoring
        if card.ability and card.ability.set == 'Joker' and context.cardarea == G.jokers and context.main_scoring then
            return {
                func = function()
                    ease_dollars(2)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$2", colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}