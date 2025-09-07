SMODS.Sound {
    key = 'shufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_shufflepack') then
        return 1e11
      end
    end
  }