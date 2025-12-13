SMODS._MOD_SAVE_FACE_CARD_COUNT = "face_cards_played"

function SMODS.on_load()
    if not SMODS.SAVE[SMODS._MOD_SAVE_FACE_CARD_COUNT] then
        SMODS.SAVE[SMODS._MOD_SAVE_FACE_CARD_COUNT] = 0
    end
end

local files = {
    --"config",
    "lib/atlas",
    "lib/init",
    "lib/music",
    "lib/shaderatlas",
    -- ight bro
    "items/jokers/miscjokers",
    "items/jokers/legendaries",
    "items/jokers/hjokers",
    "items/jokers/mathjokers",
    "items/jokers/wingdingsjokers",
    "items/jokers/eateotjokers",
    "items/consumables/lenormand",
    "items/consumables/catarot",
    "items/consumables/exoplanet",
    "items/consumables/spectaclaw",
    "items/consumables/routes",
    "items/enhancements",
    "items/editions",
    "items/tags",
    "items/stakes",
    "items/blinds",
    "items/seals",
    "items/packs",
    "items/decks",
    "items/pokerhands",
    "items/rarities",
    "items/suits",
    "items/vouchers",
    "lib/colors",
    "lib/misc",
    "lib/ui"
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end