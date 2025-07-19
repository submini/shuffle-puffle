return {
    descriptions = {
        Joker = {
            j_sp_deckhugger = {
                name = "Deckhugger",
                text = {
                    'Earn {C:money}$3{} when hand does not',
                    'contain any {C:attention}face cards{}'
                }
            },

            j_sp_landlord = {
                name = "Landlord",
                text = {
                    'Gains {C:money}$6{} sell value',
                    'when playing a {C:attention}Full House{},',
                    'Selling removes {C:attention}2{} Full House levels',
                    '{C:inactive}(cannot go below 1){}'
                },
                unlock = {
                    "Upgrade Full House to level three"
                }
            },

            j_sp_cowboyfromhell = {
                name = "Cowboy From Hell",
                text = {
                    'If the amount of {C:blue}hands{}',
                    'left is {C:attention}3{}, {C:red}+5{} Mult and {C:blue}+25{} Chips'
                }
            },

            j_sp_woodenruler = {
            name = "Wooden Ruler",
            text = {
                'This joker gains {X:red,C:white}X0.5{} Mult if',
                'played hand is a {C:attention}Straight{}, loses {X:red,C:white}-X0.5{}',
                'Mult if played hand is not a {C:attention}Straight{}',
                '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} Mult){}{}'
                }
            },

            j_sp_skyline = {
            name = "Skyline",
            text = {
                'This Joker gains {X:blue,C:white}+X0.35{} Chips',
                'for each played {C:attention}#3#{} when scored,',
                'rank changes at end of round',
                '{C:inactive}(Currently {X:blue,C:white}X#1#{}{C:inactive} Chips){}{}'
            }
        }

    },

        misc = {
            dictionary = {
                a_chips = "+#1#",
                a_chips_minus = "-#1#",
                a_hands = "+#1# Hands",
                a_handsize = "+#1# Hand Size",
                a_handsize_minus = "-#1# Hand Size",
                a_mult = "+#1# Mult",
                a_mult_minus = "-#1# Mult",
                a_remaining = "#1# Remaining",
                a_sold_tally = "#1#/#2# Sold",
                a_xmult = "X#1# Mult",
                a_xmult_minus = "-X#1# Mult",
                a_dollars = "$#1#",
                a_sellboost = "+$#1# Sell"
            }
        }
    }
}
