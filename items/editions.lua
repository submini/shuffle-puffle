--SMODS.Shader({ key = 'anaglyphic', path = 'anaglyphic.fs' })

SMODS.Edition {
    key = 'anaglyphic',
    shader = 'anaglyphic',
    in_shop = false,
    weight = 0.19,
    extra_cost = 5,
    apply_to_float = false,
    badge_colour = HEX('72c1e9'),
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Anaglyphic',
        label = 'Anaglyphic',
        text = {
        [1] = '{C:green}1 in 4{} chance to',
        [2] = '{C:attention}duplicate{} card when',
        [3] = 'triggered',
        [4] = '{C:inactive}(Must have room{}',
        [5] = '{C:inactive} if Joker or Consumable){}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
        end
    end
}