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
    -- ight bro
    "items/jokers",
    "items/consumables/catarot",
    "items/consumables/exoplanet",
    "items/enhancements",
    "items/seals",
    "items/packs",
    "items/planets",
    "items/ranks",
    "items/rarities",
    "lib/misc",
}
for i, v in pairs(files) do
	assert(SMODS.load_file(v..".lua"))()
end