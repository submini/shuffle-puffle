ShufflePuffle = {}

ShufflePuffle.ENABLED_JOKERS = {
    -- Common
    "deckhugger",
    "cowboyfromhell",
    -- Uncommon
    "landlord",
    "woodenruler",
    -- Rare
    "skyline",
    -- Legendary
}

-- Load globals (if you have shared helper functions here)
assert(SMODS.load_file("globals.lua"))()

-- Load all Joker files in the "jokers" folder
local joker_src = NFS.getDirectoryItems(SMODS.current_mod.path .. "/jokers")
for _, file in ipairs(joker_src) do
    if file:match("%.lua$") then -- Only load .lua files
        assert(SMODS.load_file("jokers/" .. file))()
    end
end
