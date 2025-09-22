SMODS.Suit {
  key = 'Slopes',
  card_key = 'SLOPES',

  lc_atlas = 'slopeslc',
  lc_ui_atlas = 'slopesuilc',
  lc_colour = HEX("F0343D"),

  hc_atlas = 'slopeshc',
  hc_ui_atlas = 'slopesuihc',
  hc_colour = HEX("FD5E2C"),

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
