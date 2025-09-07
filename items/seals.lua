SMODS.Seal {
    key = 'chartreuseseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            chips = 10,
            x_chips = 1.08,
            mult = 4,
            x_mult = 1.1,
            dollars = 1
        }
    },
    badge_colour = HEX('7FFF00'),
   loc_txt = {
        name = 'Chartreuse Seal',
        label = 'Chartreuse Seal',
        text = {
        [1] = 'Gives {C:blue}+10{} extra chips, {X:blue,C:white}X1.08{}',
        [2] = 'Chips, {C:red}+4{} Mult, {X:red,C:white}X1.1{} Mult, and',
        [3] = '{C:money}+$1{} when triggered'
    }
    },
    atlas = 'chartreuseseal',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { chips = card.ability.seal.extra.chips, x_chips = card.ability.seal.extra.x_chips, mult = card.ability.seal.extra.mult, x_mult = card.ability.seal.extra.x_mult, dollars = lenient_bignum(card.ability.seal.extra.dollars) }
        end
    end
}