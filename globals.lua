--- GLOBALS

G.C.SJ = {
    RED = HEX("FF0000"),
    BLACK = HEX("000000"),
    BLUE = HEX("0000FF"),
    GREEN = HEX("00FF00"),
    WHITE = HEX("FFFFFF"),
    TRANSPARENT = HEX("00000000"),
    ORANGE = HEX("E67E22"),
    PURPLE = HEX("AA5BB5"),
    PINK = HEX("F7BCDA")
}

-- Hooks

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.sj_red = G.C.SJ.RED
    G.ARGS.LOC_COLOURS.sj_black = G.C.SJ.BLACK
    G.ARGS.LOC_COLOURS.sj_blue = G.C.SJ.BLUE
    G.ARGS.LOC_COLOURS.sj_green = G.C.SJ.GREEN
    G.ARGS.LOC_COLOURS.sj_white = G.C.SJ.WHITE
    G.ARGS.LOC_COLOURS.sj_transparent = G.C.SJ.TRANSPARENT
    G.ARGS.LOC_COLOURS.sj_orange = G.C.SJ.ORANGE
    G.ARGS.LOC_COLOURS.sj_purple = G.C.SJ.PURPLE
    G.ARGS.LOC_COLOURS.sj_pink = G.C.SJ.PINK
    return loc_colour_ref(_c, _default)
end

-- somewhere central, like in your SMODS.lua or jokers.lua
SMODS.JOKER_POOL = {
    'j_sp_deckhugger', 'j_sp_landlord', 'j_sp_cowboyfromhell', 'j_sp_woodenruler',
    'j_sp_skyline', 'j_sp_moodring', 'j_sp_juler', 'j_sp_ragazzo',
    'j_sp_symmetry', 'j_sp_finisher', 'j_sp_sparechange', 'j_sp_sparedollars',
    'j_sp_jackboys', 'j_sp_placeholder', 'j_sp_entanglement', 'j_sp_measurement',
    'j_sp_checkpoint', 'j_sp_alchemist', 'j_sp_topup', 'j_sp_virus', 'j_sp_triangular',
    'j_sp_resonance', 'j_sp_frog', 'j_sp_encore', 'j_sp_scrapheap', 'j_sp_lonewolf',
    'j_sp_coinflip', 'j_sp_blackcat', 'j_sp_luckybreak', 'j_sp_apex', 'j_sp_onetimeuse',
    'j_sp_speedramp', 'j_sp_sacrifice', 'j_sp_sirbaudelaire', 'j_sp_igor', 'j_sp_ritualist',
    'j_sp_straightbroidery', 'j_sp_stonesentinel', 'j_sp_glassglimmer', 'j_sp_steelspark',
    'j_sp_goldenglean', 'j_sp_luckylode', 'j_sp_auraamp', 'j_sp_maximumload', 'j_sp_lejokerjames', 
    'j_sp_nikolajokic','j_sp_handfulfortune', 'j_sp_handfulmultiply', 'j_sp_pacer', 'j_sp_openinggambit',
    'j_sp_twosides', 'j_sp_cosmicdust', 'j_sp_quintetreward', 'j_sp_straighttobusiness', 'j_sp_pointguard',
    'j_sp_allwild', 'j_sp_numberline', 'j_sp_lukadoncic', 'j_sp_jackfruit', 'j_sp_freddyfazbear', 'j_sp_bonniebunny',
    'j_sp_chicachicken', 'j_sp_foxy', 'j_sp_noisyjoker'
}
