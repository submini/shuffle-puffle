SMODS.Stake {
    name = "Chroma Stake",
    key = 'chroma',
    applied_stakes = { 'purple' },
    prefix_config = { applied_stakes = { mod = false } },
    pos = { x = 4, y = 1 },
    sticker_pos = { x = 4, y = 1 },
    modifiers = function()
        G.GAME.edition_rate = G.GAME.edition_rate * 0.1
        return true
    end,
    colour = HEX('0c914d'),

}