ShufflePuffle = {}

ShufflePuffle.ENABLED_JOKERS = {
    -- Common
    "deckhugger",
    "cowboyfromhell",
    "moodring",
    "juler",
    "sparechange",
    "entanglement",
    "topup",
    "triangular",
    "scrapheap",
    "coinflip",
    "luckybreak",
    -- Uncommon
    "landlord",
    "woodenruler",
    "symmetry",
    "sparedollars",
    "jackboys",
    "measurement",
    "alchemist",
    "resonance",
    "encore",
    "onetimeuse",
    -- Rare
    "skyline",
    "checkpoint",
    "ragazzo",
    "finisher",
    "placeholder",
    "virus",
    "frog",
    "lonewolf",
    "blackcat",
    "apex",
    "speedramp",
    -- Legendary
    "tamerlane"
}

-- Inject global dictionary line (for ^#1# Mult display in Jokers like Tamerlane)
if G and G.localization and G.localization.misc and G.localization.misc.dictionary then
    G.localization.misc.dictionary.a_exp = "^#1# Mult"
end

-- Load globals (if you have shared helper functions here)
assert(SMODS.load_file("globals.lua"))()

-- Load all Joker files in the "jokers" folder
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "/jokers")
for _, file in ipairs(joker_src) do
    if file:match("%.lua$") then -- Only load .lua files
        assert(SMODS.load_file("jokers/" .. file))()
    end
end

 local booster_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "/packs")
 for _, file in ipairs(booster_src) do
    if file:match("%.lua$") then -- Only load .lua files
        assert(SMODS.load_file("packs/" .. file))()
    end
end

 local rarity_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "/rarities")
 for _, file in ipairs(rarity_src) do
    if file:match("%.lua$") then -- Only load .lua files
        assert(SMODS.load_file("rarities/" .. file))()
    end
end


SMODS._MOD_SAVE_FACE_CARD_COUNT = "face_cards_played"

function SMODS.on_load()
    if not SMODS.SAVE[SMODS._MOD_SAVE_FACE_CARD_COUNT] then
        SMODS.SAVE[SMODS._MOD_SAVE_FACE_CARD_COUNT] = 0
    end
end

