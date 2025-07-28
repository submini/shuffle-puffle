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
        },

            j_sp_alchemist = {
            name = "Alchemist",
            text = {
                'This joker gains {C:blue}+50{} Chips, {C:red}+5{} Mult,',
                'and {C:money}+$1{} sell value for each joker',
                'sold this run',
                '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips and{} {C:red}+#2#{} {C:inactive}Mult){}'
            }
        },

            j_sp_topup = {
            name = "Top-up",
            text = {
                'Earn {C:money}$2{} at the {C:attention}start{}',
                'of each round'
            }
        },

            j_sp_virus = {
            name = "Virus",
            text = {
                'If {C:blue}first hand{} of round has',
                '{C:attention}exactly{} 2 cards, {C:attention}copy{} the left',
                'card {C:attention}twice{}'
            }
        },

            j_sp_triangular = {
            name = "Triangular Joker",
            text = {
                'This Joker gains {C:red}+2{} Mult',
                'for each scoring {C:attention}Ace{}, {C:attention}3{}, {C:attention}6{} or {C:attention}10{}',
                '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
            }
        },

            j_sp_resonance = {
            name = "Resonance",
            text = {
                'When a hand is played, if {C:attention}all cards{} scored',
                'are of the {C:attention}same rank{}, this joker gains',
                '{X:red,C:white}+X0.05{} Mult for each card scored',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },

            j_sp_frog = {
            name = "Frog",
            text = {
                '{C:purple}+^0.05{} Mult for each Blind',
                '{C:attention}skipped{} this run',
                '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
            }
        },
        
            j_sp_encore = {
            name = "Encore",
            text = {
                'Creates a random {C:uncommon}Uncommon{} Joker',
                'when played poker hand is the',
                '{C:attention}most played hand{}',
                '{C:inactive}(Must have room){}'
            }
        },

            j_sp_scrapheap = {
            name = "Scrap Heap",
            text = {
                'This joker gains {C:blue}+5{} Chips',
                'for {C:attention}every card in the discard pile{},',
                '{C:attention}resets{} after round ends',
                '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
            }
        },

            j_sp_lonewolf = {
            name = "Lone Wolf",
            text = {
                '{X:red,C:white}X7{} Mult if there are',
                'no other jokers owned'
            }
        },

            j_sp_coinflip = {
            name = "Coin Flip",
            text = {
                '{C:green}1 in 2{} chance to earn',
                '{C:attention}$5{} at start of round'
            }
        },

            j_sp_blackcat = {
            name = "Black Cat",
            text = {
                'At the {C:attention}start{} of each round,',
                'this cat adds a random {C:attention}Glass{}',
                'card to deck'
            }
        },

        j_sp_luckybreak = {
            name = "Lucky Break",
            text = {
                '{C:green}1 in 10{} chance for a',
                'scoring card to be',
                'turned into a {C:attention}Lucky{} card'
            }
        },

        j_sp_apex = {
            name = "Apex Joker",
            text = {
                'When {C:attention}Boss Blind{} is defeated,',
                'this joker gains {X:red,C:white}+X1{} Mult',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{}{C:inactive} Mult){}'
            }
        },

        j_sp_onetimeuse = {
            name = "One-Time Use",
            text = {
                '{X:red,C:white}X5{} Mult and {X:blue,C:white} X5{} Chips for',
                'one hand, then {C:red}self destructs{}'
            }
        },

        j_sp_speedramp = {
            name = "Speed Ramp",
            text = {
                'This joker gains {C:blue}Chips{} at the',
                'end of {C:attention}each round{}, but {C:blue}the number{}',
                '{C:blue}of Chips gained{} keeps doubling.',
                'Chips value start at {C:blue}+1{}',
                '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips){}'
            }
        },

        j_sp_sacrifice = {
            name = "Sacrifice",
            text = {
                '{C:attention}+2{} Joker slots,',
                '{C:red}-2{} Consumable slots'
            }
        },

        j_sp_sirbaudelaire = {
            name = "Sir Baudelaire",
            text = {
                '{C:blue}+400000{} Chips,',
                '{C:red}-4{} Joker slots'
            }
        },

        j_sp_igor = {
            name = "IGOR",
            text = {
                'This joker gains {C:red}+4{} Mult',
                'for every {C:attention}4{} scored.',
                '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_ritualist = {
            name = "Ritualist",
            text = {
                'This joker gains {C:red}+5{} Mult every',
                'two {C:attention}consumables{} used',
                '{C:inactive}(Currently{} {C:red}+#2# {}{C:inactive}Mult){}'
            }
        },

        j_sp_straightbroidery = {
            name = "Straightbroidery",
            text = {
                'When played hand contains a',
                '{C:attention}Straight{}, {C:green}1 in 4{} chance to',
                'create a {C:attention}Double Tag{}'
            }
        },

        j_sp_stonesentinel = {
            name = "Stone Sentinel",
            text = {
                'Every scored {C:attention}Stone{} card gives {C:red}+5{} Mult'
            }
        },

        j_sp_glassglimmer = {
            name = "Glass Glimmer",
            text = {
                'Every scored {C:attention}Glass{} card gives {C:red}+5{} Mult'
            }
        },

        j_sp_steelspark = {
            name = "Steel Spark",
            text = {
                'Every scored {C:attention}Steel{} card gives {C:red}+5{} Mult'
            }
        },

        j_sp_goldenglean = {
            name = "Golden Glean",
            text = {
                'Every scored {C:attention}Gold{} card gives {C:red}+5{} Mult'
            }
        },

        j_sp_luckylode = {
            name = "Lucky Lode",
            text = {
                'Every scored {C:attention}Lucky{} card gives {C:red}+5{} Mult'
            }
        },

        j_sp_auraamp = {
            name = "Aura Amp",
            text = {
                'Every scored {C:attention}enhanced{}',
                'card gives {X:red,C:white}X1.5{} Mult'
            }
        },

        j_sp_maximumload = {
            name = "Maximum Load",
            text = {
                'If there are {C:red}no{} free',
                'joker slots left, {X:red,C:white}X2{} Mult'
            }
        },

        j_sp_lejokerjames = {
            name = "LeJoker James",
            text = {
                'If scored card is a {C:attention}6{},',
                '{X:red,C:white}X2.3{} Mult and {C:blue}+32 {}Chips'
            }
        },

        j_sp_nikolajokic = {
            name = "Nikola Jokić",
            text = {
                '{C:red}+15{} Mult {C:attention}most of the time{},',
                '{C:green}1 in 5{} chance to give',
                '{X:red,C:white}X1.5{} Mult also'
            }
        },

        j_sp_handfulfortune = {
            name = "Handful Fortune",
            text = {
                '{C:blue}+20{} Chips for every',
                'card in hand',
                '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
            }
        },

        j_sp_handfulmultiply = {
            name = "Handful Multiply",
            text = {
                '{C:red}+2{} Mult for every',
                'card in hand',
                '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}'
            }
        },

        j_sp_pacer = {
            name = "Pacer",
            text = {
                '{C:red}+1{} Mult per hand played',
                '{C:inactive}(Currently {}{C:red}+#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_openinggambit = {
            name = "Opening Gambit",
            text = {
                'First scored card of round gives',
                '{C:blue}+50{} Chips and {C:red}+3{} Mult'
            }
        },

        j_sp_twosides = {
            name = "Two Sides",
            text = {
                'Gains {C:blue}+1{} Chip if scored card',
                'is a {C:spades}Spade{} or {C:clubs}Club{} suit,',
                'gains {C:red}+0.5{} Mult if scored card',
                'is a {C:hearts}Heart{} or {C:diamonds}Diamond{} suit',
                '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips{} {C:inactive}and{} {C:red}+#2#{} {C:inactive}Mult){}'
            }
        },

        j_sp_cosmicdust = {
            name = "Cosmic Dust",
            text = {
                'Each time a card is',
                '{C:attention}destroyed{} or {C:attention}sold{}, this',
                'joker gains {X:red,C:white}+X0.75{} Mult',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_quintetreward = {
            name = "Quintet Reward",
            text = {
                'This joker gains {C:blue}+40{} Chips',
                'and a {C:green}1 in 6{} chance to give',
                '{X:red,C:white}X1.5{} Mult if played hand',
                'has {C:attention}5{} scoring cards',
                '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
            }
        },

        j_sp_straighttobusiness = {
            name = "Straight to Business",
            text = {
                'If hand played contains',
                'a {C:attention}Straight{}, earn {C:money}$5{}'
            }
        },

        j_sp_pointguard = {
            name = "Point Guard",
            text = {
                'If hand played is a',
                '{C:attention}High Card{}, this joker',
                'gains {C:red}+10{} Mult',
                '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_allwild = {
            name = "All Wild",
            text = {
                'Every scored card is',
                'turned into a {C:attention}Wild{} card,',
                '{C:green}1 in 4{} chance it will',
                'also have a {C:attention}Red{} Seal'
            }
        },

        j_sp_numberline = {
            name = "Number Line",
            text = {
                'This joker gives {X:red,C:white}X1.5{}',
                'Mult and {X:blue,C:white}X2{} Chips if',
                'the highest rank in hand',
                'is an {C:attention}Ace{} and the lowest',
                'rank in hand is a {C:attention}2{}'
            }
        },

        j_sp_lukadoncic = {
            name = "Luka Doncic",
            text = {
                'This joker gains {X:blue,C:white}+X0.5{} Chips',
                'if only two {C:attention}7{}s are scored',
                '{C:inactive}(Currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips){}'
            }
        },

        j_sp_beringstrait = {
            name = "Bering Strait",
            text = {
                'If played hand is a',
                '{C:attention}Straight{}, {C:attention}+1{} Hand size'
            }
        }

    },

    Enhanced = {
        m_glass={
        name="Glass Card",
        text={
        "{X:mult,C:white} X#1# {} Mult",
        "{C:green}#2# in #3#{} chance to",
        "destroy card",
        },
    },
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
                a_sellboost = "+$#1# Sell",
                shufflepuffle_saved_checkpoint = "Saved by Checkpoint",
            }
        }
    }

}