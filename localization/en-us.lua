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
                    'left is {C:attention}3{}, {X:red,C:white}X1.9{} Mult and {C:blue}+25{} Chips'
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
        },

            j_sp_tamerlane = {
            name = "Tamerlane",
            text = {
                "Gains {C:purple}+^0.025{} Mult for each",
                "{C:attention}face card{} in your full deck.",
                "{C:inactive}(Currently {C:purple}^#1#{}{C:inactive} Mult){}{}"
            }
        },

            j_sp_moodring = {
            name = "Mood Ring",
            text = {
                'When a poker hand is played,',
                'this Joker gives a random effect',
                'from the following:',
                '{C:red}+10{} Mult, {C:money}+$5{}, or {C:blue}+100{} Chips'
            }
        },

            j_sp_juler = {
            name = "Juler",
            text = {
                "Retriggers every {C:attention}2{}, {C:attention}7{}, {C:attention}Ace{} and {C:attention}8{}"
            }
        },

            j_sp_ragazzo = {
            name = "Ragazzo",
            text = {
                'Gains {C:blue}+50{} Chips for each {C:attention}face card{}',
                'scored if at least one of them was a',
                '{C:hearts}Heart{} or {C:diamonds}Diamond{}. If all 5 cards are',
                'scoring face cards, gain {X:red,C:white}+X0.08{} Mult',
                '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips and{} {X:red,C:white}X#2#{} {C:inactive}Mult){}'
            }
        },

            j_sp_symmetry = {
            name = "Symmetry",
            text = {
                'Gains {X:red,C:white}+X0.3{} Mult if played hand has',
                'two {C:hearts}Heart{} cards and two {C:diamonds}Diamond{} cards',
                'or two {C:spades}Spade{} cards and two {C:clubs}Club{} cards,',
                'loses {X:red,C:white}-X0.5{} Mult if not',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },

            j_sp_finisher = {
            name = "Finisher",
            text = {
                'When played hand is the last hand',
                'of round, {X:blue,C:white}X4{} Chips and {X:red,C:white}X2{} Mult.',
                'If hand includes a scoring',
                'face card, {X:red,C:white}X3{} Mult instead'
            }
        },

            j_sp_sparechange = {
            name = "Spare Change",
            text = {
                'This joker gains {C:blue}+2{} Chips for',
                'each {C:attention}discarded card{}',
                '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
            }
        },

            j_sp_sparedollars = {
            name = "Spare Dollars",
            text = {
                'This joker gains {C:red}+2{} Mult for',
                'each {C:attention}discarded card{}',
                '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
            }
        },

            j_sp_jackboys = {
            name = "JACKBOYS",
            text = {
                'This joker gains {X:red,C:white}+X0.07{} Mult',
                'for each scored {C:attention}Jack{}',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },

            j_sp_placeholder = {
            name = "Placeholder",
            text = {
                '{C:attention}Copies{} the {C:attention}effect{} of the',
                'jokers to its left and right'
            }
        },

            j_sp_entanglement = {
            name = "Entanglement",
            text = {
                'Create a {C:planet}Planet{} card if poker hand',
                'contains an {C:attention}Ace{} and a {C:attention}Straight{}',
                '{C:inactive}(Must have room){}'
            }
        },

            j_sp_measurement = {
            name = "Measurement",
            text = {
                'Create a {C:spectral}Spectral{} card if poker hand',
                'contains an {C:attention}Ace{} and a {C:attention}Straight{}',
                '{C:inactive}(Must have room){}'
            }
        },

            j_sp_checkpoint = {
            name = "Checkpoint",
            text = {
            '{C:attention}Prevents death{} but',
            '{C:red}self destructs{}, {C:attention}-1 Ante{}'
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
