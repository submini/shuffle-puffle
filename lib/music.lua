SMODS.Sound {
    key = 'shufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_shufflepack_1') then
        return 1e11
      end
    end
  }

SMODS.Sound {
    key = 'minishufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_minishufflepack_1') then
        return 1e11
      end
    end
  }

SMODS.Sound {
    key = 'jumboshufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_jumboshufflepack_1') then
        return 1e11
      end
    end
  }

SMODS.Sound {
    key = 'megashufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_megashufflepack_1') then
        return 1e11
      end
    end
  }

SMODS.Sound {
    key = 'ultrashufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_ultrashufflepack_1') then
        return 1e11
      end
    end
  }

SMODS.Sound {
    key = 'toomuchshufflepack_music',
    path = 'shufflepackv2.ogg',
    select_music_track = function(self)
      -- We only check the booster once there are cards in the pack_cards area
      local booster = G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER

      -- If it's a 
      if booster and booster.config.center_key:find('p_sp_toomuchshufflepack_1') then
        return 1e11
      end
    end
  }