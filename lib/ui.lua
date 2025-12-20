SMODS.current_mod.ui_config = {
    colour = {0.1, 0.1, 0.1, 1}, -- Main UI box (coal black)
    outline_colour = {0.9, 0.49, 0.13, 1}, -- Main UI box outline (orange)
    back_colour = {0.9, 0.49, 0.13, 1}, -- Back button
    tab_button_colour = {0.9, 0.49, 0.13, 1}, -- Tab buttons
}


SMODS.current_mod.custom_ui = function (mod_nodes)
    mod_nodes = EMPTY(mod_nodes)
    local tg = G.ROOM
    local node1 = {
        n = G.UIT.C,
        config = {align = "cm", padding = 0.3, r = 0.1, colour = {0.15, 0.15, 0.15, 1}, emboss = 0.05},
        nodes = {
            {
                n = G.UIT.R,
                config = {align = "cm", padding = 0.05},
                nodes = {
                    {n = G.UIT.T, config = {text = "This Balatro mod is", scale = 0.6, colour = G.C.WHITE}}
                }
            },
            {
                n = G.UIT.R,
                config = {align = "tm"},
                nodes = {
                    {
                        n = G.UIT.O,
                        config = {
                            object = DynaText{
                                string = "shuffle-puffle",
                                scale = 1,
                                colours = {G.C.SP_SHUFFYORANGE},
                                pop_in = 0.1,
                                float = 1,
                                bump_rate = 10,
                                bump_amount = 5,
                            }
                        }
                    }
                }
            },
            {
                n = G.UIT.R,
                config = {align = "cm", padding = 0.05},
                nodes = {
                    {n = G.UIT.T, config = {text = "- - - - - - - - - - - - - - - - - - -", scale = 0.4, colour = G.C.WHITE}}
                }
            },
            {
                n = G.UIT.R,
                config = {align = "cm", padding = 0.1},
                nodes = {
                    {n = G.UIT.T, config = {text = "the most ruffled, puffled", scale = 0.4, colour = G.C.WHITE}}
                }
            },
            {
                n = G.UIT.R,
                config = {align = "cm", padding = -2.5},
                nodes = {
                    {n = G.UIT.T, config = {text = "and shuffled mod there is.", scale = 0.4, colour = G.C.WHITE}}
                }
            },
            {
                n = G.UIT.R,
                config = {align = "cm"},
                nodes = {
                    {
                        n = G.UIT.C,
                        config = {padding = 0.3},
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "created by mariopuff and subminimal team", scale = 0.3, colour = G.C.WHITE}}
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = {padding = 0.05, align = "cm"},
                                nodes = {
                                    {n = G.UIT.T, config = {text = "(c) 2025", scale = 0.2, colour = G.C.WHITE}}
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    table.insert(mod_nodes, node1)
end

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = "Credits",
            tab_definition_function = function()
                return {
                    n = G.UIT.ROOT,
                    config = {
                        r = 0.5,
                        padding = 0.5,
                        colour = {0.15, 0.15, 0.15, 1},
                        align = "cm",
                    },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = {align = "cm"},
                            nodes = {
                                {
                                    n = G.UIT.C,
                                    config = {padding = 0.2},
                                    nodes = {
                                        {
                                            n = G.UIT.R,
                                            config = {align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Project Lead &", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = 0, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Programming", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = 0, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "mariopuff", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = 0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Main Artist", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = -0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "UN4YA", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = 0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Secondary Artists", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = -0.1, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "mariopuff, interseer", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                    }
                                },
                                {
                                    n = G.UIT.C,
                                    config = {padding = 0.25},
                                    nodes = {
                                        {
                                            n = G.UIT.R,
                                            config = {align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Writers", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = -0.1, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "mariopuff, UN4YA, interseer", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = -0.1, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "CzarIsActual, beepybunny!", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = 0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Sound Designer", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = -0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "UN4YA", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = 0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "Playtesters", scale = 0.5, colour = G.C.SP_SHUFFYORANGE}}
                                            }
                                        },
                                        {
                                            n = G.UIT.R,
                                            config = {padding = -0.2, align = "lm"},
                                            nodes = {
                                                {n = G.UIT.T, config = {text = "mariopuff, UN4YA", scale = 0.4, colour = G.C.WHITE}}
                                            }
                                        },
                                    }
                                },
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = {padding = 0.15, align = "cm"},
                            nodes = {
                                {n = G.UIT.T, config = {text = "Thank you for playing!", scale = 0.35, colour = G.C.WHITE}}
                        }
                        },
                        {
                            n = G.UIT.R,
                            config = {padding = -2, align = "cm"},
                            nodes = {
                                {n = G.UIT.T, config = {text = "This mod is non-commercial and unaffiliated with LocalThunk, do not redistribute.", scale = 0.25, colour = G.C.SP_SHUFFYORANGE}}
                        }
                        },
                    }
                }
            end
        }
    }
end