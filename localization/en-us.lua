return {
    descriptions = {
        Blind = {
        bl_sp_day = {
        name = "The Day",
        text = {
            "All Hearts and Diamonds",
            "are drawn face down"
        }
    },
    bl_sp_night = {
        name = "The Night",
        text = {
            "All Clubs and Spades",
            "are drawn face down"
        }
    },
    bl_sp_tetrad = {
        name = "The Tetrad",
        text = {
            "Must play 4 cards"
        }
    },
    bl_sp_down = {
        name = "The Down",
        text = {
            "Enhanced cards",
            "are debuffed",
        }
    },
    bl_sp_anti = {
        name = "The Anti",
        text = {
            "The opposite of",
            "a Boss Blind,",
            "enjoy your time"
        }
    },
    bl_sp_67 = {
        name = "The 67",
        text = {
            "Debuffs all cards",
            "with rank 6 or 7",
        }
    },
    bl_sp_face = {
        name = "The Face",
        text = {
            "Debuffs all",
            "numbered cards"
        }
    },
    bl_sp_derivative = {
        name = "The Derivative",
        text = {
            "Hands that contain",
            "Straights are not",
            "allowed to be played"
        }
    },
    bl_sp_integral = {
        name = "The Integral",
        text = {
            "Hands that do not",
            "contain Straights are",
            "not allowed to be played"
        }
    },
    bl_sp_sine = {
        name = "The Sine",
        text = {
            "Odd-ranked cards",
            "are debuffed"
        }
    },
    bl_sp_cosine = {
        name = "The Cosine",
        text = {
            "Even-ranked cards",
            "are debuffed"
        }
    },
    bl_sp_distance = {
        name = "The Distance",
        text = {
            "Score requirement increases",
            "by x#1# per hand"
        }
    },
    bl_sp_euler = {
        name = "The Euler",
        text = {
            "Only the first and last card",
            "score when a hand is played"
        }
    },
   


        },
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
                '{C:inactive}(Currently gives {X:blue,C:white}X#1#{}{C:inactive} Chips{}',
                '{C:inactive}for each #3#){}'
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
                'Gains {C:blue}+5{} Chips if scored card',
                'is a {C:spades}Spade{} or {C:clubs}Club{} suit,',
                'gains {C:red}+5{} Mult if scored card',
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
        },

        j_sp_lemniscate = {
            name = "Lemniscate",
            text = {
                'This joker gains {X:red,C:white}XX2.622{}',
                'Mult for every scored',
                '{C:attention}8{}, {C:attention}3{}, {C:attention}4{}, and {C:attention}6{}',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_toad = {
            name = "Toad",
            text = {
                '{X:edition,C:white}+^^^1{} Mult for each Blind',
                '{C:attention}skipped{} this run',
                '{C:inactive}(Currently{} {X:edition,C:white}^^^#1#{} {C:inactive}Mult){}',
                '{X:edition,C:white,s:0.8}^^^{} {s:0.8}is pentation, the fifth hyperoperation{}'
            }
        },

        j_sp_jimbro = {
            name = "Jimbro",
            text = {
                '{C:red}+7625597484987{} Mult'
            }
        },

        j_sp_unfairruler = {
            name = "Unfair Ruler",
            text = {
                'This Joker gains {C:purple}+^2{} Mult',
                'if played hand contains',
                'a {C:attention}Straight{}',
                '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_jackfruit = {
            name = "Jackfruit",
            text = {
                '{C:attention}Retriggers{} the next',
                '{C:attention}#1#{} scored Jacks'
            }
        },

        j_sp_doublebongcloud = {
            name = "Double Bongcloud",
            text = {
                'This Joker gains {C:edition}+^^4{} Mult',
                'if the {C:blue}first hand{} of round',
                'has {C:attention}only two scoring Kings{}',
                '{C:inactive}(Currently{} {C:edition}^^#1#{}{C:edition}{} {C:inactive}Mult){}',
                '{C:edition,s:0.8}^^{} {s:0.8}is tetration, the fourth hyperoperation{}'
            }
        },        

        j_sp_freddyfazbear = {
            name = "Freddy Fazbear",
            text = {
                'Retriggers {C:attention}Aces{}, {C:attention}9{}s, {C:attention}8{}s,',
                'and {C:attention}7{}s five times'
            }
        },

        j_sp_bonniebunny = {
            name = "Bonnie the Bunny",
            text = {
                'This joker gains {X:blue,C:white}+X0.5{} Chips',
                'every time a {C:attention}leftmost card{}',
                'is triggered in a {C:attention}five-card',
                'hand{}',
                '{C:inactive}(Currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips){}'
            }
        },

        j_sp_chicachicken = {
            name = "Chica the Chicken",
            text = {
                'This joker gains {X:red,C:white}+X0.5{} Mult',
                'every time a {C:attention}rightmost card{}',
                'is triggered in a {C:attention}five-card',
                'hand{}',
                '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_foxy = {
            name = "Foxy the Pirate Fox",
            text = {
                'This joker gains {C:money}+$5{}',
                'if played hand contains',
                'a {C:attention}Straight{}, total money',
                'will be given at {C:attention}payout{}',
                '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}'
            }
        },

        j_sp_noisyjoker = {
            name = "Noisy Joker",
            text = {
                '{C:green}1 in 2{} chance to gain {C:red}+2{} Mult for',
                'every scored card, {C:green}1 in 4{} chance to',
                'lose {C:red}-1{} Mult for every scored card,',
                '{C:green}1 in 10{} chance to gain {C:red}+10{} Mult for',
                'every scored card',
                '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_speedrunner = {
            name = "Speedrunner",
            text = {
                'This Joker gains {C:purple}^(^12){} Mult',
                'if played hand contains a {C:attention}Straight{}.',
                '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_cantaloupe = {
            name = "Cantaloupe",
            text = {
                'This joker gains {C:purple}^(+7){}',
                'Mult if played hand',
                'contains a {C:attention}Full House{}',
                '{C:inactive}(Currently {}{C:purple}^#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_crazyhamburger = {
            name = "Crazy Hamburger",
            text = {
                'This burger gains {C:purple}^+12{}',
                'Mult every round if {C:attention}Crazy{}',
                '{C:attention}Joker{} is present',
                '{C:inactive}(Currently{} {C:purple}^#1#{} {C:inactive}Mult){}'
            }
        },

        j_sp_bigh = {
            name = "H",
            text = {
                '{X:red,C:white}X12{} Mult if played hand',
                'contains a {C:attention}Straight{}'
            }
        },

        j_sp_smallh = {
            name = "h",
            text = {
                '{X:blue,C:white}X4.5{} Chips if played hand',
                'contains a {C:attention}Straight{}'
            }
        },

        j_sp_hbuilding = {
            name = "H Building",
            text = {
                'This Joker gains {C:blue}+#1#{} Chips',
                'if played hand contains a',
                '{C:attention}Straight{}, chip gain increases',
                'by {C:blue}+35{} Chips every time the',
                '{C:attention}Saturn{} {C:planet}planet card{} is used',
                '{C:inactive}(Currently{} {C:blue}+#2#{} {C:inactive}Chips){}'
            }
        },

        j_sp_dancingh = {
            name = "Dancing H",
            text = {
                '{C:green}#1# in #2#{} chance{} to',
                '{C:attention}level up played poker',
                'hand{}, probability increases',
                'by {C:attention}1{} for every other Joker',
                'owned'
            }
        },

        j_sp_gordonramsayh = {
            name = "Gordon Ramsay H",
            text = {
                'This Joker gains {C:red}+#1#{}',
                 'Mult when round starts,',
                'mult gain increases by',
                '{C:red}+24{} Mult for every card',
                'eaten',
                '{C:inactive}(Currently{} {C:red}+#2#{} {C:inactive}Mult){}',
                '{C:inactive,s:0.8}(eaten = destroyed){}'
            }
        },

        j_sp_lavalamph = {
            name = "Lava Lamp H",
            text = {
                '{C:green}1 in 2{} chance for {X:red,C:white}X1.6{} Mult,',
                '{C:green}1 in 4{} chance for {X:red,C:white}X0.8{} Mult,',
                '{C:green}1 in 6{} chance to give {C:money}$12{}',
                'if played hand contains a {C:attention}Straight{}'
            }
        },

        j_sp_hoftheh = {
            name = "H of the H",
            text = {
                'Creates a {C:dark_edition}Negative{}',
                '{C:attention}Crazy Joker{}',
                'when {C:attention}Blind{} is selected'
            }
        },

        j_sp_hegative = {
            name = "Hegative",
            text = {
                'Creates a random {C:dark_edition}Negative{}',
                '{C:attention}Joker{} when Boss Blind is',
                'defeated',
                '{C:inactive}(only{} {C:common}Common{} {C:inactive}and {}{C:uncommon}Uncommon{}{C:inactive}){}'
            }
        },

        j_sp_hhhhh = {
            name = "HHHHH",
            text = {
                'Creates a {C:dark_edition}Negative{} {C:attention}Crazy',
                'Joker{} every time a {C:planet}Saturn{}',
                'is used, creates 3 if a',
                'J1407b is used'
            }
        },
     j_sp_lebronjames = {
        name = 'LeBron James',
        text = {
                '{X:red,C:white}X23{} Mult,',
                'Every scored {C:attention}King{}',
                'gives {X:red,C:white}X6{} Mult'
        }
    },
    j_sp_hedge = {
        name = "Hedge",
        text = {
            'Adds a permanent random',
            'card with a {C:attention}Red Seal{} to',
            'hand if played hand',
            'contains a {C:attention}Straight{}'
        }
    },
    j_sp_thecrazyofjoker = {
        name = "The Crazy of Joker",
        text = {
            '{X:edition,C:white}^^^12{} Mult if played',
            'hand contains a {C:attention}Straight{}'
        }
    },
    j_sp_thejokeof87 = {
        name = "The Joke of 87",
        text = {
            'If played hand contains an',
            '{C:attention}8{} and a {C:attention}7{}, create #1#',
            '{C:dark_edition}Negative{} {C:attention}Freddy Fazbears{}',
            'and increase number by {C:attention}5{}',
            '{C:inactive,s:0.6}yes we know this is the bite of \'83 shut up{}'
        }
    },
    j_sp_sealedpackage = {
        name = "Sealed Package",
        text = {
            'When {C:attention}Boss Blind{} is selected,',
            'creates {C:attention}5{} random playing',
            'cards with a {C:attention}random seal{}',
            'and draws it to hand'
    }
},
    j_sp_pencil = {
        name = 'Pencil',
        text = {
            'If played hand contains',
            'a {C:attention}Straight{}, give each',
            'scored card a',
            'permanent {C:blue}+20{} Chips',
            'bonus'
        },
    },
    j_sp_scissors1 = {
        name = 'Scissors 1',
        text = {
            '{C:attention}X0.75{} Blind size'
        },
    },
    j_sp_scissors2 = {
        name = 'Scissors 2',
        text = {
            'If {C:blue}first hand{} of round',
            'has only {C:attention}2{} scoring cards,',
            '{C:red}destroy{} both of them and',
            'gain {X:red,C:white}+X0.5{} Mult',
            '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
    },
    j_sp_glasses = {
        name = 'Glasses',
        text = {
            'If at least {C:attention}3{} cards of',
            '{C:spades}Spade{} or {C:clubs}Club{} suit are',
            'discarded, this joker',
            'gains {C:red}+8{} Mult',
            '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        },
    },
    j_sp_bell = {
        name = 'Bell',
        text = {
            'If played {C:blue}hand{} is the',
            '{C:attention}first hand{} of round,',
            'retrigger every card',
            '{C:attention}2{} times'
        },
    },
    j_sp_book = {
    name = "Book",
    text = {
        "Lets you look at the",
        "top {C:attention}5 cards{} of your deck",
        "during the round"
    }
},
j_sp_book_alt = {
    name = "Book",
    text = {
        "{s:0.8}#1##6#{}",
        "{s:0.8}#2##7#{}",
        "{s:0.8}#3##8#{}",
        "{s:0.8}#4##9#{}",
        "{s:0.8}#5##10#{}",
    }
},
    j_sp_candle = {
        name = 'Candle',
        text = {
            '{C:green}1 in 2{} chance to',
            '{C:attention}retrigger{} scored card',
            'from {C:attention}1{} to {C:attention}3{} times'
        },
    },
    j_sp_touchtonetelephone = {
        name = 'Touchtone Telephone',
        text = {
            'This joker gains {C:red}+2{} Mult',
            'if scored card is {C:attention}not{} an',
            '{C:attention}Ace{} or a {C:attention}face card{}',
            '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}{C:inactive}{}'
        },
    },
    j_sp_envelope = {
        name = 'Envelope',
        text = {
            'When {C:attention}Blind{} is selected,',
             'add {C:attention}1{} to {C:attention}3{} enhanced',
            'cards to deck'
        },
    },
    j_sp_stampedenvelope = {
        name = 'Stamped Envelope',
        text = {
            'When {C:attention}Blind{} is selected,',
            'add {C:attention}1{} to {C:attention}3{} cards with',
            'a random seal to deck'
        },
    },
    j_sp_mailbox1 = {
        name = 'Mailbox 1',
        text = {
            'This joker gives a',
            'permanent {C:red}Mult{} {C:attention}bonus{}',
            'to every scored card',
            'if hand contains a {C:attention}Straight{},',
            'bonus is random'
        },
    },
    j_sp_mailbox2 = {
        name = 'Mailbox 2',
        text = {
            'When this joker is sold,',
            'create {C:attention}2{} jokers',
            '{C:inactive}(Irrespective of room){}'
        },
    },
    j_sp_closedfolder = {
        name = 'Closed Folder',
        text = {
            'Gains {X:blue,C:white}+X0.5{} Chips when',
            '{C:attention}Blind{} is selected but',
            'only gives the chips in',
            '{C:attention}Boss Blinds{}',
            '{C:inactive}(Currently{} {X:blue,C:white}X#1#{} {C:inactive}Chips){}'
        },
    },
    j_sp_openfolder = {
        name = 'Open Folder',
        text = {
            'Gains {X:red,C:white}+X0.3{} Mult when',
            '{C:attention}Blind{} is selected but',
            'only gives the Mult in',
            '{C:attention}Boss Blinds{}',
            '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
    },
    j_sp_document = {
        name = 'Document',
        text = {
            '{C:blue}+#1#{} Chips,',
            '{C:blue}-25{} Chips for every',
            '{C:attention}reroll{} in shop'
        },
    },
    j_sp_filecabinet = {
        name = 'File Cabinet',
        text = {
            'When {C:attention}Blind{} is selected,',
            'add {C:attention}1{} to {C:attention}4{} {C:dark_edition}Negative{}',
            'playing cards to deck'
        },
    },
    j_sp_hourglass = {
        name = 'Hourglass',
        text = {
           'If played hand contains',
            'a {C:attention}Straight{}, give the first',
            '{C:attention}3{} cards a permanent',
            '{X:red,C:white}X2{} Mult bonus'
        },
    },
    j_sp_keyboard = {
        name = 'Keyboard',
        text = {
            'Retriggers {C:attention}Aces{} and',
            '{C:attention}face cards{} from {C:attention}1{} to',
            '{C:attention}6{} times'
        }
    },
    j_sp_et = {
        name = 'Ampersand 1',
        text = {
            '{C:attention}Copies{} the effect of',
            'the first {C:attention}2{} jokers',
            'in the jokers slot'
        },
    },
    j_sp_ampersand2 = {
        name = 'Ampersand 2',
        text = {
            'Copies the {C:attention}second{} joker\'s',
            'effect in the jokers',
            'slot {C:attention}2{} times'
        },
    },
    j_sp_beatenfrownsafter = {
        name = "beaten frowns after",
        text = {
            'Every {C:attention}number card{} gives {X:blue,C:white}X2{} Chips',
            'Every {C:attention}face card{} gives {X:red,C:white}X1.5{} Mult',
            'Every {C:attention}Ace{} gives {C:gold}+$20{}'
        }
    },
    j_sp_ppik = {
        name = {
            "pittor pickgown",
            "in khatheinstersper",
        },
        text = {
            '{X:red,C:white}X#1#{} Mult,',
            '{C:green}1 in 5{} chance to lose',
            '{X:red,C:white}-X0.5{} Mult and {C:green}1 in{}',
            '{C:green}3{} chance to gain {X:red,C:white}+X0.5{}',
            'Mult when {C:attention}Blind{} is selected'
        }
    },
    j_sp_hag = {
        name = "hag",
        text = {""}
    },
    j_sp_giltsholder = {
        name = "giltsholder",
        text = {
            'Every {C:attention}face card{} gives',
            '{C:red}+50{} Mult when {C:attention}scored{}',
            'or {C:attention}held in hand{}'
        }
    },
    j_sp_stage5 = {
        name = {
            "eptitranxisticemestionscers",
            "descending"
        },
        text = {
            'If {C:attention}five cards{} are scored, give every',
            'card except for the {C:attention}first{} one a',
            '{X:blue,C:white}X2{} Chips bonus'
        }
    },
    j_sp_necrotomigaud = {
        name = "necrotomigaud",
        text = {
            '{C:attention}+2{} {C:blue}Hands{},{C:attention} +2{} {C:red}Discards{},',
            '{C:attention}+2{} Hand size'
        }
    },
    j_sp_randomwalk = {
        name = "Random Walk",
        text = {
            '{C:red}Decreases{} hand level by {C:attention}1{},',
            "{C:green}#1# in 40{} chance to level",
            "up hand by {C:attention}1{} instead.",
            "Chance goes up by {C:attention}1{}",
            "for each {C:blue}hand{} or {C:red}discard{}",
            "{C:green}1 in 4{} chance to drop by {C:red}1{}"
        }
    }
},

    Enhanced = {
    m_sp_francaise={
        name="Carte Française",
        text={
            '{C:blue}+70{} extra chips, {C:red}+7{} Mult'
        },
    },
    m_sp_trading={
        name="Trading Card",
        text={
            '{X:red,C:white}X3{} Mult, {C:green}1 in 5{} chance',
            'this card is {C:red}destroyed{}'
        },
    },
    m_sp_corner={
        name="Corner Card",
        text={
            '{C:blue}+75{} extra chips, {C:green}1 in 4{}',
            'chance {X:blue,C:white}X2{} Chips'
        },
    },
    m_sp_striped = {
        name = 'Striped Card',
        text = {
            'This card either gives',
            '{C:blue}+10{} extra chips or',
            '{C:red}+10{} Mult when scored'
        }
    },
    m_sp_random = {
        name = 'Random Card',
        text = {
            '{C:red}+0-28{} Mult, {C:green}1 in 5{}',
            'chance {X:red,C:white}X1.5-X3{} Mult'
        }
    },
    m_sp_nature = {
        name = 'Nature Card',
        text = {
            '{C:blue}+50{} extra chips,',
            '{C:red}+20{} Mult, {C:money}+$5{}, {C:green}1 in 10{}',
            'chance {X:blue,C:white}X3{} Chips, {C:green}1 in',
            '20{} chance {X:red,C:white}X2.5{} Mult'
    }
    },
    m_sp_patriotic = {
        name = 'Patriotic Card',
        text = {
            '{C:red}+17{} Mult, {C:blue}+76{} extra',
            'chips, {C:green}1 in 2{} chance',
            '{X:red,C:white}X1.5{} Mult'
    }
    },
    m_sp_baudelaire = {
        name = "Baudelaire Card",
        text = {
            '{C:blue}+100{} extra chips'
        }
    },
    m_sp_tuxedo = {
        name = 'Tuxedo Card',
        text = {
            '{C:red}+25{} Mult, {C:green}1 in 10{}',
            'chance {X:red,C:white}X3{} Mult'
    }
    },
    m_sp_upward = {
        name = 'Upward Card',
        text = {
            '{C:purple}^1.2{} Mult'
    }
    },
    m_sp_igorcard = {
        name = 'IGOR Card',
        text = {
            '{C:gold}+$4{}, {C:red}+4{} Mult, {C:green}1 in 7{}',
            'chance {X:red,C:white}X4{} Mult'
        }
    }
    },

    Lenormand = {
        c_sp_theclover = {
                name = "The Clover",
                text = {
                    "Enhances up to {C:attention}4{}",
                    "selected cards to",
                    "{C:attention}Lucky Cards",
                },
            },
        c_sp_theship = {
                name = "The Ship",
                text = {
                    "Gives {C:gold}$3{} for",
                    "each Joker owned {C:inactive}",
                    "(Max of {C:gold}$#2#{C:inactive})",
                    "{C:inactive}(Currently {C:gold}$#1#{C:inactive})"
                },
            },
        c_sp_thehouse = {
                name = "The House",
                text = {
                    "Creates up to {C:attention}#1#{}",
                    "random {V:1}Exoplanet{} cards",
                    "{C:inactive}(Must have room)",
                },
            },
        c_sp_clouds = {
                name = "Clouds",
                text = {
                    "Select at least",
                    "{C:attention}3{} cards,",
                    "applies a {C:attention}White Seal{}",
                    "to {C:attention}1{} random card",
                },
            },
        c_sp_thesnake = {
                name = "The Snake",
                text = {
                    "Decreases the rank",
                    "of up to {C:attention}4{}",
                    "selected cards by {C:attention}1{}",
                },
            },
        c_sp_thecoffin = {
                name = "The Coffin",
                text = {
                    "Creates a {C:dark_edition}Negative{}",
                    "{V:1}Catarot{} or",
                    "{V:2}Exoplanet{} card",
                },
        },
        c_sp_thebouquet = {
                name = "The Bouquet",
                text = {
                    "Creates {C:attention}2{} copies",
                    "of {C:attention}1{} selected",
                    "card, each copy",
                    "having a random suit"
                },
            },
        c_sp_thewhip = {
                name = "The Whip",
                text = {
                    "Destroys up to",
                    "{C:attention}#1#{} selected cards",
                },
            },
        c_sp_birds = {
                name = "Birds",
                text = {
                    "Select {C:attention}3{} cards,",
                    "the {C:attention}2{} rightmost",
                    "cards copy the",
                    "leftmost\'s rank"
                }, 
        },
        c_sp_thechild = {
                name = "The Child",
                text = {
                    "Creates a random",
                    "{C:uncommon}Uncommon{} Joker at",
                    "the cost of {C:gold}$6{}",
                    "{C:inactive}(Must have room){}"
                },
        },
        c_sp_thefox = {
                name = "The Fox",
                text = {
                    "Applies a",
                    "permanent {C:red}+2{} Mult",
                    "bonus on up to",
                    "{C:attention}2{} selected cards"
                },
        },
        c_sp_thebear = {
                name = "The Bear",
                text = {
                    "Applies a",
                    "{C:attention}Fazbear Seal{} on",
                    "{C:attention}1{} selected card"
                },
        },
        c_sp_thetower = {
                name = "The Tower",
                text = {
                    "Applies {C:dark_edition}Foil{} to",
                    "a maximum of",
                    "{C:attention}5{} Jokers without",
                    "an edition"
                },
            },
        c_sp_thetree = {
                name = "The Tree",
                text = {
                    "Applies a",
                    "{C:attention}Tree Seal{} on",
                    "{C:attention}2{} selected cards"
                },
        },
        c_sp_themountain = {
                name = "The Mountain",
                text = {
                    "Enhances {C:attention}1{} selected",
                    "card into an {C:attention}Upward Card{}",
                    "and {C:red}destroys{} {C:attention}5{} random",
                    "cards in hand"
                },
            },
        c_sp_mice = {
                name = "Mice",
                text = {
                    "Destroys {C:attention}3{}",
                    "selected cards,",
                    "earn {C:gold}$8{}"
                },
            },
        c_sp_theheart = {
                name = "The Heart",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                },
            },
        c_sp_theletter = {
                name = "The Letter",
                text = {
                    "Creates {C:attention}2{} of the last",
                    "{C:tarot}Tarot{} or {C:planet}Planet{} card",
                    "used during this run",
                    "{s:0.8,C:tarot}The Fool{s:0.8} excluded",
                },
            },
        c_sp_thekey = {
                name = "The Key",
                text = {
                    "Creates the last",
                    "{V:1}Lenormand{} card",
                    "used during this run",
                    "{s:0.8,V:1}The Key{s:0.8} excluded",
                },
            },
        c_sp_thecross = {
                name = "The Cross",
                text = {
                    "Destroy a random",
                    "Joker, earn {C:gold}$25{}"
                }
        }
},

    Catarot = {
        c_sp_birman = {
            name = "Birman",
            text = {
                'Enhances up to 2', 
                'selected cards',
                'to {C:attention}Cartes Françaises{}'
            }
        },
        c_sp_ragdoll = {
            name = "Ragdoll",
            text = {
                'Enhances 1',
                'selected card',
                'to a {C:attention}Trading Card{}'
            }
        },
        c_sp_siamese = {
            name = "Siamese",
            text = {
                'Enhances up to 2',
                'selected cards',
                'to {C:attention}Corner Cards{}'
            }
        },
        c_sp_bengal = {
            name = "Bengal",
            text = {
                'Enhances up to 7',
                'selected cards into',
                'either {C:diamonds}Diamonds{} or',
                '{C:spades}Spades{}',
                '{C:inactive,s:0.75}(randomly selected for each card){}'
            }
        },
        c_sp_russianblue = {
            name = "Russian Blue",
            text = {
                'Enhances up to 7',
                'selected cards into',
                'either {C:hearts}Hearts{} or',
                '{C:clubs}Clubs{}',
                '{C:inactive,s:0.75}(randomly selected for each card){}'
            }
        },
        c_sp_abyssinian = {
            name = "Abyssinian",
            text = {
            'Sets money to the',
            'next multiple of {C:money}$26{}'
            }
        },
        c_sp_chartreux = {
            name = "Chartreux",
            text = {
                'Adds a {C:attention}Chartreuse Seal{}',
                'to 1 selected card'
            }
        },
        c_sp_devonrex = {
            name = "Devon Rex",
            text = {
                'Enhances up to',
                '2 selected cards to',
                '{C:attention}Striped Cards{}'
            }
        },
        c_sp_norwegianforest = {
            name = "Norwegian Forest Cat",
            text = {
            'Enhances 1 selected',
            'card into a {C:attention}Random Card{}'
            }
        },
        c_sp_mainecoon = {
            name = "Maine Coon",
            text = {
            'Enhances 1 selected',
            'card into a {C:attention}LeBronned Card{}'
            }
        },
        c_sp_rustyspotted = {
            name = "Rusty-spotted",
            text = {
            'Enhances 1 selected',
            'card into a {C:attention}Nature Card{}'
            }
        },
        c_sp_americanshorthair = {
            name = "American Shorthair",
            text = {
            'Enhances 1 selected',
            'card into a {C:attention}Patriotic Card{}'
            }
        },
        c_sp_grumpy = {
            name = "Grumpy Cat",
            text = {
            'Enhances 1 selected',
            'card into a {C:attention}Baudelaire Card{}'
            }
        },
    },

    Exoplanet = {
c_sp_j1407b = {
    name = "J1407b",
    text = {
        '({V:1}lvl.#1#{}) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_toi5573_b = {
    name = "TOI-5573 b",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_noifasui = {
    name = "Noifasui",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_sweeps4b = {
    name = "SWEEPS-4 b",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_awasis = {
    name = "Awasis",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_kepler120c = {
    name = "Kepler-120 c",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_kereru = {
    name = "Kererū",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_pcd = {
    name = "Proxima Centauri d",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_dagon = {
    name = "Dagon",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_cuptor = {
    name = "Cuptor",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_toge = {
    name = "Toge",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},
c_sp_xolotlan = {
    name = "Xolotlan",
    text = {
        '(lvl.#1#) Levels up {C:attention}#2#{}',
        '{C:blue}+#4#{} Chips and',
        '{C:red}+#3#{} Mult'
    }
},

    },

    Spectaclaw = {
    c_sp_bombay = {
        name = 'Bombay',
        text = {
                'Enhances all cards in',
                'hand to {C:attention}Glass Cards{},',
                '{C:green}1 in 7{} chance card has',
                'a {C:attention}Red{} or {C:attention}Blue Seal{}'
        }
    },
    c_sp_tuxedo = {
        name = 'Tuxedo',
        text = {
                'Enhances up to 3',
                'selected cards to',
                '{C:attention}Tuxedo Cards{}',
        }
    },
    c_sp_britishshorthair = {
        name = 'British Shorthair',
        text = {
                'Enhances up to 2',
                'selected cards to',
                '{C:attention}Upward Cards{}',
        }
    },
    },
    Gem = {
        c_sp_obsidian = {
            name = "Obsidian",
            text = {
                'Turns all cards in hand',
                'into {C:spades}Spades{} and makes',
                'them {C:attention}obsidized{}'
            }
        },
        c_sp_ruby = {
            name = "Ruby",
            text = {
                'Turns all cards in hand',
                'into {C:hearts}Hearts{} and makes',
                'them {C:attention}rubified{}'
            }
        },
        c_sp_onyx = {
            name = "Onyx",
            text = {
                'Turns all cards in hand',
                'into {C:clubs}Clubs{} and makes',
                'them {C:attention}onyxxified{}'
            }
        },
        c_sp_topaz = {
            name = "Topaz",
            text = {
                'Turns all cards in hand',
                'into {C:diamonds}Diamonds{} and makes',
                'them {C:attention}topazzified{}'
            }
        },
    },

    Other = {
        p_sp_minishufflepack_1 = {
            name = "Mini Shuffle Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}2{} {B:1,V:2}shuffle-puffle{} Jokers',
                }
        },
        p_sp_shufflepack_1 = {
            name = "Shuffle Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}3{} {B:1,V:2}shuffle-puffle{} Jokers',
                }
        },
        p_sp_jumboshufflepack_1 = {
            name = "Jumbo Shuffle Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}4{} {B:1,V:2}shuffle-puffle{} Jokers',
                }
        },
        p_sp_megashufflepack_1 = {
            name = "Mega Shuffle Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}4{} {B:1,V:2}shuffle-puffle{} Jokers',
                }
        },
        p_sp_ultrashufflepack_1 = {
            name = "Ultra Shuffle Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}6{} {B:1,V:2}shuffle-puffle{} Jokers',
                }
        },
        p_sp_toomuchshufflepack_1 = {
            name = "Too-much Shuffle Pack",
            text = {
                'Choose {C:attention}3{} of up to',
                '{C:attention}9{} {B:1,V:2}shuffle-puffle{} Jokers',
                }
        },
        p_sp_hpack_1 = {
            name = "H Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}2{} {B:1,V:2}H{} Jokers',
                }
        },
        p_sp_carcanapack_1 = {
            name = "Carcana Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}3{} {V:1}Catarots{} to be',
                'used immediately'
                }
        },
        p_sp_jumbocarcanapack_1 = {
            name = "Jumbo Carcana Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}5{} {V:1}Catarots{} to be',
                'used immediately'
                }
        },
        p_sp_megacarcanapack_1 = {
            name = "Mega Carcana Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}5{} {V:1}Catarots{} to be',
                'used immediately'
                }
        },
        p_sp_ultracarcanapack_1 = {
            name = "Ultra Carcana Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}7{} {V:1}Catarots{} to be',
                'used immediately'
                }
        },
        p_sp_exocelestialpack_1 = {
            name = "Exocelestial Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}3{} {V:1}Exoplanets{} to be',
                'used immediately'
                }
        },
        p_sp_jumboexocelestialpack_1 = {
            name = "Jumbo Exocelestial Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}5{} {V:1}Exoplanets{} to be',
                'used immediately'
                }
        },
        p_sp_megaexocelestialpack_1 = {
            name = "Mega Exocelestial Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}5{} {V:1}Exoplanets{} to be',
                'used immediately'
                }
        },
        p_sp_crystalpack_1 = {
            name = "Crystal Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}2{} {V:1}Gems{} to be',
                'used immediately'
                }
        },
        p_sp_wingdingspack_1 = {
            name = "Wingdings Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}3{} {B:1,V:2}Wingdings{} Jokers',
                }
        },
        p_sp_jumbowingdingspack_1 = {
            name = "Jumbo Wingdings Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}5{} {B:1,V:2}Wingdings{} Jokers',
                }
        },
        p_sp_megawingdingspack_1 = {
            name = "Mega Wingdings Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}5{} {B:1,V:2}Wingdings{} Jokers',
                }
        },
        p_sp_caretakerpack_1 = {
            name = "Caretaker Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}2{} {B:1,V:2}EATEOT{} Jokers',
                }
        },
        p_sp_jumbocaretakerpack_1 = {
            name = "Jumbo Caretaker Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}4{} {B:1,V:2}EATEOT{} Jokers',
                }
        },
        p_sp_megacaretakerpack_1 = {
            name = "Mega Caretaker Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}4{} {B:1,V:2}EATEOT{} Jokers',
                }
        },
        p_sp_lenormanapack_1 = {
            name = "Lenormana Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}3{} {V:1}Lenormands{} to be',
                'used immediately'
                }
        },
        p_sp_jumbolenormanapack_1 = {
            name = "Lenormana Pack",
            text = {
                'Choose {C:attention}1{} of up to',
                '{C:attention}5{} {V:1}Lenormands{} to be',
                'used immediately'
                }
        },
        p_sp_megalenormanapack_1 = {
            name = "Lenormana Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}5{} {V:1}Lenormands{} to be',
                'used immediately'
                }
        },
        p_sp_ultralenormanapack_1 = {
            name = "Ultra Lenormana Pack",
            text = {
                'Choose {C:attention}2{} of up to',
                '{C:attention}7{} {V:1}Lenormands{} to be',
                'used immediately'
                }
        },

    },


    misc = {
        dictionary = {
                sp_saved_checkpoint = "Saved by Checkpoint",

                k_sp_unfair = "Unfair",

                k_catarot = "Catarot",
                b_catarot_cards = "Catarot Cards",

                sp_of = " of ",
			    sp_Spades = "Spades",
			    sp_Hearts = "Hearts",
			    sp_Clubs = "Clubs",
			    sp_Diamonds = "Diamonds",
                sp_Ace = "Ace",
			    sp_Jack = "Jack",
			    sp_Queen = "Queen",
			    sp_King = "King",
            },
        labels = {
                catarot = "Catarot",
            },
        v_dictionary = {
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
            },
        poker_hands = {
                sp_plateau = "Plateau",
            }
        }
    }

}