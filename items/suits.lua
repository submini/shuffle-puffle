SMODS.Suit {
  key = 'Slopes',
  card_key = 'SLOPES',

  lc_atlas = 'slopes',
  lc_ui_atlas = 'slopesui',
  lc_colour = HEX("E67E22"),

  hc_atlas = 'slopes',
  hc_ui_atlas = 'slopesui',
  hc_colour = HEX("E67E22"),

  pos = { y = 0 },
  ui_pos = { x = 0, y = 0 },

  loc_txt = {
    singular = "Slope",
    plural = "Slopes",
  },

  in_pool = function(self, args)
    -- Example rules for when this suit is available:
    if args and args.initial_deck then
      -- Allow suit to spawn in starting decks
      return true
    else
      -- Allow suit to spawn everywhere else too
      return true
    end
  end
}
