SMODS.Atlas({
    key = 'francaise',
    path = 'francaise.png',
    px = 71,
    py = 95
})

SMODS.Enhancement {
    key = 'francaise',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 70,
        mult = 7
    },
    loc_txt = {
        name = 'Carte Française',
        text = {
        [1] = '{C:blue}+70{} extra chips, {C:red}+7{} Mult'
    }
    },
    atlas = 'francaise',
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false
}