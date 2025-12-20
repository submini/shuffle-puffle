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
  if args and args.initial_deck then
    local back = G.GAME.selected_back
    if back and back.effect and back.effect.center and back.effect.center.config then
      local config = back.effect.center.config
      return config.sp_slopes and config.sp_slopes.use_slopes == true
    end
    return false
  else
    -- Mid-game: check if Slopes exist in deck
    if G.playing_cards then
      for k, v in pairs(G.playing_cards) do
        if v.base and v.base.suit == 'sp_Slopes' then
          return true
        end
      end
    end
    return false
  end
end
}