DTColours = {
    Grey = GRAY_FONT_COLOR_CODE,
    Green = GREEN_FONT_COLOR_CODE,
    Yellow = YELLOW_FONT_COLOR_CODE,
    Orange = ORANGE_FONT_COLOR_CODE,
    Red = RED_FONT_COLOR_CODE
}

DTEmptyLevelRange = {
    levelRanges = {
        [DTColours.Grey] = 999
    }
}

DTLevelInfo = {
    [1] = 0,
    [2] = 400,
    [3] = 1300,
    [4] = 2700,
    [5] = 4800,
    [6] = 7600,
    [7] = 11200,
    [8] = 15700,
    [9] = 21100,
    [10] = 27600,
    [11] = 35200,
    [12] = 44000,
    [13] = 54100,
    [14] = 65500,
    [15] = 78400,
    [16] = 92800,
    [17] = 108800,
    [18] = 126500,
    [19] = 145900,
    [20] = 167200,
    [21] = 190400,
    [22] = 215600,
    [23] = 242900,
    [24] = 272300,
    [25] = 304000,
    [26] = 338000,
    [27] = 374400,
    [28] = 413300,
    [29] = 454700,
    [30] = 499000,
    [31] = 546400,
    [32] = 597200,
    [33] = 651700,
    [34] = 710300,
    [35] = 773100,
    [36] = 840200,
    [37] = 911800,
    [38] = 987900,
    [39] = 1068700,
    [40] = 1154400,
    [41] = 1245100,
    [42] = 1340900,
    [43] = 1441900,
    [44] = 1548200,
    [45] = 1660000,
    [46] = 1777500,
    [47] = 1900700,
    [48] = 2029800,
    [49] = 2164900,
    [50] = 2306100,
    [51] = 2453600,
    [52] = 2607500,
    [53] = 2767900,
    [54] = 2935000,
    [55] = 3108900,
    [56] = 3289700,
    [57] = 3477600,
    [58] = 3672600,
    [59] = 3874900,
    [60] = 4084700
}

DTInstanceInfo = {
    ["Ragefire Chasm"] = {
        shortName = "RFC",
        instanceId = 389,
        encounters = {
            [1443] = {
                name = "Oggleflint",
                bosses = {
                    [11517] = "Oggleflint"
                }
            },
            [1444] = {
                name = "Jergosh",
                bosses = {
                    [11518] = "Jergosh"
                }
            },
            [1445] = {
                name = "Bazzalan",
                bosses = {
                    [11519] = "Bazzalan"
                }
            },
            [1446] = {
                name = "Taragaman",
                bosses = {
                    [11520] = "Taragaman"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 10,
            [DTColours.Yellow] = 13,
            [DTColours.Green] = 18,
            [DTColours.Grey] = 23
        }
    },
    ["Wailing Caverns"] = {
        shortName = "WC",
        instanceId = 43,
        encounters = {
            [586] = {
                name = "Lord Cobrahn",
                bosses = {
                    [3669] = "Lord Cobrahn"
                }
            },
            [585] = {
                name = "Lady Anacondra",
                bosses = {
                    [3671] = "Lady Anacondra"
                }
            },
            [587] = {
                name = "Kresh",
                bosses = {
                    [3653] = "Kresh"
                }
            },
            [588] = {
                name = "Lord Pythas",
                bosses = {
                    [3670] = "Lord Pythas"
                }
            },
            [589] = {
                name = "Skum",
                bosses = {
                    [3674] = "Skum"
                }
            },
            [590] = {
                name = "Lord Serpentis",
                bosses = {
                    [3673] = "Lord Serpentis"
                }
            },
            [591] = {
                name = "Verdan the Everliving",
                bosses = {
                    [5775] = "Verdan the Everliving"
                }
            },
            [592] = {
                name = "Mutanus the Devourer",
                bosses = {
                    [3654] = "Mutanus the Devourer"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 10,
            [DTColours.Yellow] = 17,
            [DTColours.Green] = 24,
            [DTColours.Grey] = 29
        }
    },
    ["The Deadmines"] = {
        shortName = "VC",
        instanceId = 36,
        encounters = {
            [0] = {
                name = "Rhahk'Zor",
                bosses = {
                    [644] = "Rhahk'Zor"
                }
            },
            [0] = {
                name = "Sneed",
                bosses = {
                    [643] = "Sneed",
                    [642] = "Sneed's Shredder"
                }
            },
            [0] = {
                name = "Gilnid",
                bosses = {
                    [1763] = "Gilnid"
                }
            },
            [0] = {
                name = "Mr. Smite",
                bosses = {
                    [646] = "Mr. Smite"
                }
            },
            [0] = {
                name = "Captain Greenskin",
                bosses = {
                    [647] = "Captain Greenskin"
                }
            },
            [1144] = {
                name = "Edwin VanCleef",
                bosses = {
                    [639] = "Edwin VanCleef",
                    [645] = "Cookie"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 10,
            [DTColours.Yellow] = 17,
            [DTColours.Green] = 23,
            [DTColours.Grey] = 28
        }
    },
    ["Shadowfang Keep"] = {
        shortName = "SFK",
        instanceId = 33,
        encounters = {
            [0] = {
                name = "Rethilgore",
                bosses = {
                    [0] = "Rethilgore"
                }
            },
            [0] = {
                name = "Fel Steed / Shadow Charger",
                bosses = {
                    [0] = "Fel Steed / Shadow Charger"
                }
            },
            [0] = {
                name = "Razorclaw the Butcher",
                bosses = {
                    [0] = "Razorclaw the Butcher"
                }
            },
            [0] = {
                name = "Baron Silverlaine",
                bosses = {
                    [0] = "Baron Silverlaine"
                }
            },
            [0] = {
                name = "Commander Springvale",
                bosses = {
                    [0] = "Commander Springvale"
                }
            },
            [0] = {
                name = "Sever",
                bosses = {
                    [0] = "Sever"
                }
            },
            [0] = {
                name = "Odo the Blindwatcher",
                bosses = {
                    [0] = "Odo the Blindwatcher"
                }
            },
            [0] = {
                name = "Arugal's Voidwalker",
                bosses = {
                    [0] = "Arugal's Voidwalker"
                }
            },
            [0] = {
                name = "Fenrus the Devourer",
                bosses = {
                    [0] = "Fenrus the Devourer"
                }
            },
            [0] = {
                name = "Wolf Master Nandos",
                bosses = {
                    [0] = "Wolf Master Nandos"
                }
            },
            [0] = {
                name = "Archmage Arugal",
                bosses = {
                    [0] = "Archmage Arugal"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 11,
            [DTColours.Yellow] = 22,
            [DTColours.Green] = 30,
            [DTColours.Grey] = 33
        }
    },
    ["Blackfathom Deeps"] = {
        shortName = "BFD",
        instanceId = 48,
        encounters = {
            [0] = {
                name = "Ghamoo-ra",
                bosses = {
                    [0] = "Ghamoo-ra"
                }
            },
            [0] = {
                name = "Lady Sarevess",
                bosses = {
                    [0] = "Lady Sarevess"
                }
            },
            [0] = {
                name = "Gelihast",
                bosses = {
                    [0] = "Gelihast"
                }
            },
            [0] = {
                name = "Baron Aquanis",
                bosses = {
                    [0] = "Baron Aquanis"
                }
            },
            [0] = {
                name = "Twilight Lord Kelris",
                bosses = {
                    [0] = "Twilight Lord Kelris"
                }
            },
            [0] = {
                name = "Old Serra'kis",
                bosses = {
                    [0] = "Old Serra'kis"
                }
            },
            [0] = {
                name = "Aku'mai",
                bosses = {
                    [0] = "Aku'mai"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 15,
            [DTColours.Yellow] = 24,
            [DTColours.Green] = 32,
            [DTColours.Grey] = 35
        }
    },
    ["The Stockade"] = {
        shortName = "Stocks",
        instanceId = 34,
        encounters = {
            [0] = {
                name = "Kam Deepfury",
                bosses = {
                    [0] = "Kam Deepfury"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 15,
            [DTColours.Yellow] = 24,
            [DTColours.Green] = 32,
            [DTColours.Grey] = 34
        }
    },
    ["Gnomeregan"] = {
        shortName = "Gnomer",
        instanceId = 90,
        encounters = {
            [0] = {
                name = "Techbot",
                bosses = {
                    [0] = "Techbot"
                }
            },
            [0] = {
                name = "Grubbis",
                bosses = {
                    [0] = "Grubbis"
                }
            },
            [0] = {
                name = "Viscous Fallout",
                bosses = {
                    [0] = "Viscous Fallout"
                }
            },
            [0] = {
                name = "Electrocutioner 6000",
                bosses = {
                    [0] = "Electrocutioner 6000"
                }
            },
            [0] = {
                name = "Crowd Pummeler 9-60",
                bosses = {
                    [0] = "Crowd Pummeler 9-60"
                }
            },
            [0] = {
                name = "Mekgineer Thermaplugg",
                bosses = {
                    [0] = "Mekgineer Thermaplugg"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 19,
            [DTColours.Yellow] = 29,
            [DTColours.Green] = 38,
            [DTColours.Grey] = 41
        }
    },
    ["Razorfen Kraul"] = {
        shortName = "RFK",
        instanceId = 47,
        encounters = {
            [0] = {
                name = "Aggem Thorncurse",
                bosses = {
                    [0] = "Aggem Thorncurse"
                }
            },
            [0] = {
                name = "Death Speaker Jargba",
                bosses = {
                    [0] = "Death Speaker Jargba"
                }
            },
            [0] = {
                name = "Overlord Ramtusk",
                bosses = {
                    [0] = "Overlord Ramtusk"
                }
            },
            [0] = {
                name = "Agathelos the Raging",
                bosses = {
                    [0] = "Agathelos the Raging"
                }
            },
            [0] = {
                name = "Charlga Razorflank",
                bosses = {
                    [0] = "Charlga Razorflank"
                }
            },
            [0] = {
                name = "Earthcaller Halmgar",
                bosses = {
                    [0] = "Earthcaller Halmgar"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 25,
            [DTColours.Yellow] = 29,
            [DTColours.Green] = 38,
            [DTColours.Grey] = 40
        }
    },
    ["Scarlet Monastery - Graveyard"] = {
        shortName = "SM",
        instanceId = 189,
        encounters = {
            [0] = {
                name = "Interrogator Vishas",
                bosses = {
                    [0] = "Interrogator Vishas"
                }
            },
            [0] = {
                name = "Bloodmage Thalnos",
                bosses = {
                    [0] = "Bloodmage Thalnos"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 20,
            [DTColours.Yellow] = 26,
            [DTColours.Green] = 36,
            [DTColours.Grey] = 41
        }
    },
    ["Scarlet Monastery - Library"] = {
        shortName = "SM",
        instanceId = 189,
        encounters = {
            [0] = {
                name = "Houndmaster Loksey",
                bosses = {
                    [0] = "Houndmaster Loksey"
                }
            },
            [0] = {
                name = "Arcanist Doan",
                bosses = {
                    [0] = "Arcanist Doan"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 20,
            [DTColours.Yellow] = 29,
            [DTColours.Green] = 39,
            [DTColours.Grey] = 44
        }
    },
    ["Scarlet Monastery - Armory"] = {
        shortName = "SM",
        instanceId = 189,
        encounters = {
            [0] = {
                name = "Herod",
                bosses = {
                    [0] = "Herod"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 20,
            [DTColours.Yellow] = 32,
            [DTColours.Green] = 42,
            [DTColours.Grey] = 47
        }
    },
    ["Scarlet Monastery - Cathedral"] = {
        shortName = "SM",
        instanceId = 189,
        encounters = {
            [0] = {
                name = "High Inquisitor Fairbanks",
                bosses = {
                    [0] = "High Inquisitor Fairbanks"
                }
            },
            [0] = {
                name = "Scarlet Commander Mograine",
                bosses = {
                    [0] = "Scarlet Commander Mograine"
                }
            },
            [0] = {
                name = "High Inquisitor Whitemane",
                bosses = {
                    [0] = "High Inquisitor Whitemane"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 20,
            [DTColours.Yellow] = 35,
            [DTColours.Green] = 45,
            [DTColours.Grey] = 49
        }
    },
    ["Razorfen Downs"] = {
        shortName = "RFD",
        instanceId = 129,
        encounters = {
            [0] = {
                name = "Tuten'kash",
                bosses = {
                    [0] = "Tuten'kash"
                }
            },
            [0] = {
                name = "Lady Falther'ess",
                bosses = {
                    [0] = "Lady Falther'ess"
                }
            },
            [0] = {
                name = "Mordresh Fire Eye",
                bosses = {
                    [0] = "Mordresh Fire Eye"
                }
            },
            [0] = {
                name = "Glutton",
                bosses = {
                    [0] = "Glutton"
                }
            },
            [0] = {
                name = "Amnennar the Coldbringer",
                bosses = {
                    [0] = "Amnennar the Coldbringer"
                }
            },
            [0] = {
                name = "Plaguemaw the Rotting",
                bosses = {
                    [0] = "Plaguemaw the Rotting"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 35,
            [DTColours.Yellow] = 37,
            [DTColours.Green] = 46,
            [DTColours.Grey] = 48
        }
    },
    ["Uldaman"] = {
        shortName = "Ulda",
        instanceId = 70,
        encounters = {
            [0] = {
                name = "Eric \"The Swift\"",
                bosses = {
                    [0] = "Eric \"The Swift\""
                }
            },
            [0] = {
                name = "Baelog",
                bosses = {
                    [0] = "Baelog"
                }
            },
            [0] = {
                name = "Olaf",
                bosses = {
                    [0] = "Olaf"
                }
            },
            [0] = {
                name = "Revelosh",
                bosses = {
                    [0] = "Revelosh"
                }
            },
            [0] = {
                name = "Ironaya",
                bosses = {
                    [0] = "Ironaya"
                }
            },
            [0] = {
                name = "Ancient Stone Keeper",
                bosses = {
                    [0] = "Ancient Stone Keeper"
                }
            },
            [0] = {
                name = "Galgann Firehammer",
                bosses = {
                    [0] = "Galgann Firehammer"
                }
            },
            [0] = {
                name = "Grimlok",
                bosses = {
                    [0] = "Grimlok"
                }
            },
            [0] = {
                name = "Archaedas",
                bosses = {
                    [0] = "Archaedas"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 30,
            [DTColours.Yellow] = 41,
            [DTColours.Green] = 51,
            [DTColours.Grey] = 54
        }
    },
    ["Zul'Farrak"] = {
        shortName = "ZF",
        instanceId = 209,
        encounters = {
            [0] = {
                name = "Antu'sul",
                bosses = {
                    [0] = "Antu'sul"
                }
            },
            [0] = {
                name = "Witch Doctor Zum'rah",
                bosses = {
                    [0] = "Witch Doctor Zum'rah"
                }
            },
            [0] = {
                name = "Nekrum Gutchewer",
                bosses = {
                    [0] = "Nekrum Gutchewer"
                }
            },
            [0] = {
                name = "Shadowpriest Sezz'ziz",
                bosses = {
                    [0] = "Shadowpriest Sezz'ziz"
                }
            },
            [0] = {
                name = "Sandury Executioner",
                bosses = {
                    [0] = "Sandury Executioner"
                }
            },
            [0] = {
                name = "Gahz'rilla",
                bosses = {
                    [0] = "Gahz'rilla"
                }
            },
            [0] = {
                name = "Chief Ukorz Sandscalp",
                bosses = {
                    [0] = "Chief Ukorz Sandscalp"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 39,
            [DTColours.Yellow] = 44,
            [DTColours.Green] = 54,
            [DTColours.Grey] = 55
        }
    },
    ["Maraudon"] = {
        shortName = "Mara",
        instanceId = 349,
        encounters = {
            [0] = {
                name = "Noxxion",
                bosses = {
                    [0] = "Noxxion"
                }
            },
            [0] = {
                name = "Razorlash",
                bosses = {
                    [0] = "Razorlash"
                }
            },
            [0] = {
                name = "Lord Vyletongue",
                bosses = {
                    [0] = "Lord Vyletongue"
                }
            },
            [0] = {
                name = "Celebras the Cursed",
                bosses = {
                    [0] = "Celebras the Cursed"
                }
            },
            [0] = {
                name = "Landslide",
                bosses = {
                    [0] = "Landslide"
                }
            },
            [0] = {
                name = "Tinkerer Gizlock",
                bosses = {
                    [0] = "Tinkerer Gizlock"
                }
            },
            [0] = {
                name = "Rotgrip",
                bosses = {
                    [0] = "Rotgrip"
                }
            },
            [0] = {
                name = "Princess Theradras",
                bosses = {
                    [0] = "Princess Theradras"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 25,
            [DTColours.Yellow] = 46,
            [DTColours.Green] = 55,
            [DTColours.Grey] = 58
        }
    },
    ["The Temple of Atal'Hakkar"] = {
        shortName = "ST",
        instanceId = 109,
        encounters = {
            [0] = {
                name = "Balcony Minibosses",
                bosses = {
                    [0] = "Balcony Minibosses"
                }
            },
            [0] = {
                name = "Atal'alarion",
                bosses = {
                    [0] = "Atal'alarion"
                }
            },
            [0] = {
                name = "Spawn of Hakkar",
                bosses = {
                    [0] = "Spawn of Hakkar"
                }
            },
            [0] = {
                name = "Avatar of Hakkar",
                bosses = {
                    [0] = "Avatar of Hakkar"
                }
            },
            [0] = {
                name = "Jammal'an the Prophet",
                bosses = {
                    [0] = "Jammal'an the Prophet"
                }
            },
            [0] = {
                name = "Ogom the Wretched",
                bosses = {
                    [0] = "Ogom the Wretched"
                }
            },
            [0] = {
                name = "Dreamscythe",
                bosses = {
                    [0] = "Dreamscythe"
                }
            },
            [0] = {
                name = "Weaver",
                bosses = {
                    [0] = "Weaver"
                }
            },
            [0] = {
                name = "Hazzas",
                bosses = {
                    [0] = "Hazzas"
                }
            },
            [0] = {
                name = "Morphaz",
                bosses = {
                    [0] = "Morphaz"
                }
            },
            [0] = {
                name = "Shade of Eranikus",
                bosses = {
                    [0] = "Shade of Eranikus"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 45,
            [DTColours.Yellow] = 50,
            [DTColours.Green] = 56,
            [DTColours.Grey] = 62
        }
    },
    ["Blackrock Depths"] = {
        shortName = "BRD",
        instanceId = 230,
        encounters = {
            [228] = {
                name = "Lord Roccor",
                bosses = {
                    [9025] = "Lord Roccor"
                }
            },
            [227] = {
                name = "High Interrogator Gerstahn",
                bosses = {
                    [9018] = "High Interrogator Gerstahn"
                }
            },
            [229] = {
                name = "Houndmaster Grebmar",
                bosses = {
                    [9319] = "Houndmaster Grebmar"
                }
            },
            [230] = {
                name = "Ring of Law",
                bosses = {
                    [9027] = "Gorosh the Dervish",
                    [9028] = "Grizzle",
                    [9029] = "Eviscerator",
                    [9030] = "Ok'thor the Breaker",
                    [9031] = "Anub'shiah",
                    [9032] = "Hedrum the Creeper"
                }
            },
            [231] = {
                name = "Pyromancer Loregrain",
                bosses = {
                    [9024] = "Pyromancer Loregrain"
                }
            },
            [0] = {
                name = "The Vault",
                bosses = {
                    [9438] = "Dark Keeper Bethek",
                    [9442] = "Dark Keeper Ofgut",
                    [9443] = "Dark Keeper Pelver",
                    [9439] = "Dark Keeper Uggel",
                    [9437] = "Dark Keeper Vorfalk",
                    [9441] = "Dark Keeper Zimrel",
                    [9476] = "Watchman Doomgrip"
                }
            },
            [233] = {
                name = "Warden Stilgiss",
                bosses = {
                    [9041] = "Warden Stilgiss",
                    [9042] = "Verek"
                }
            },
            [234] = {
                name = "Fineous Darkvire",
                bosses = {
                    [9056] = "Fineous Darkvire"
                }
            },
            [232] = {
                name = "Lord Incendius",
                bosses = {
                    [9017] = "Lord Incendius"
                }
            },
            [235] = {
                name = "Bael'Gar",
                bosses = {
                    [9016] = "Bael'Gar"
                }
            },
            [236] = {
                name = "General Angerforge",
                bosses = {
                    [9033] = "General Angerforge"
                }
            },
            [237] = {
                name = "Golem Lord Argelmach",
                bosses = {
                    [8983] = "Golem Lord Argelmach"
                }
            },
            [238] = {
                name = "Hurley Blackbreath",
                bosses = {
                    [9537] = "Hurley Blackbreath"
                }
            },
            [241] = {
                name = "Plugger Spazzring",
                bosses = {
                    [9499] = "Plugger Spazzring"
                }
            },
            [239] = {
                name = "Phalanx",
                bosses = {
                    [9502] = "Phalanx"
                }
            },
            [242] = {
                name = "Ambassador Flamelash",
                bosses = {
                    [9156] = "Ambassador Flamelash"
                }
            },
            [243] = {
                name = "Chest of The Seven",
                bosses = {
                    [0934] = "Hate'rel",
                    [9035] = "Anger'rel",
                    [9036] = "Vile'rel",
                    [9037] = "Gloom'rel",
                    [9038] = "Seeth'rel",
                    [9039] = "Doom'rel",
                    [9040] = "Dope'rel"
                }
            },
            [244] = {
                name = "Magmus",
                bosses = {
                    [9938] = "Magmus"
                }
            },
            [245] = {
                name = "Emperor Dagran Thaurissan",
                bosses = {
                    [9019] = "Emperor Dagran Thaurissan",
                    [8929] = "Princess Moira Bronzebeard"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 42,
            [DTColours.Yellow] = 52,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Lower Blackrock Spire"] = {
        shortName = "LBRS",
        instanceId = 229,
        encounters = {
            [0] = {
                name = "Highlord Omokk",
                bosses = {
                    [9196] = "Highlord Omokk"
                }
            },
            [0] = {
                name = "Shadow Hunter Vosh'gajin",
                bosses = {
                    [9236] = "Shadow Hunter Vosh'gajin"
                }
            },
            [0] = {
                name = "War Master Voone",
                bosses = {
                    [9237] = "War Master Voone"
                }
            },
            [0] = {
                name = "Mother Smolderweb",
                bosses = {
                    [10596] = "Mother Smolderweb"
                }
            },
            [0] = {
                name = "Urok Doomhowl",
                bosses = {
                    [10584] = "Urok Doomhowl"
                }
            },
            [0] = {
                name = "Quartermaster Zigris",
                bosses = {
                    [9736] = "Quartermaster Zigris"
                }
            },
            [0] = {
                name = "Halycon",
                bosses = {
                    [10220] = "Halycon"
                }
            },
            [0] = {
                name = "Gizrul the Slavener",
                bosses = {
                    [10268] = "Gizrul the Slavener"
                }
            },
            [0] = {
                name = "Overlord Wyrmthalak",
                bosses = {
                    [9568] = "Overlord Wyrmthalak"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 48,
            [DTColours.Yellow] = 55,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Upper Blackrock Spire"] = {
        shortName = "UBRS",
        instanceId = 229,
        encounters = {
            [0] = {
                name = "Pyroguard Emberseer",
                bosses = {
                    [9816] = "Pyroguard Emberseer"
                }
            },
            [0] = {
                name = "Solakar Flamewreath",
                bosses = {
                    [10264] = "Solakar Flamewreath"
                }
            },
            [0] = {
                name = "Goraluk Anvilcrack",
                bosses = {
                    [10899] = "Goraluk Anvilcrack"
                }
            },
            [0] = {
                name = "Gyth",
                bosses = {
                    [10339] = "Gyth"
                }
            },
            [0] = {
                name = "Warchief Rend Blackhand",
                bosses = {
                    [10429] = "Warchief Rend Blackhand"
                }
            },
            [0] = {
                name = "The Beast",
                bosses = {
                    [10430] = "The Beast"
                }
            },
            [0] = {
                name = "General Drakkisath",
                bosses = {
                    [10363] = "General Drakkisath"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 48,
            [DTColours.Yellow] = 55,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Dire Maul East"] = {
        shortName = "DM East",
        instanceId = 429,
        encounters = {
            [0] = {
                name = "Pusillin",
                bosses = {
                    [14354] = "Pusillin"
                }
            },
            [0] = {
                name = "Zevrim Thornhoof",
                bosses = {
                    [11490] = "Zevrim Thornhoof"
                }
            },
            [0] = {
                name = "Hydrospawn",
                bosses = {
                    [13280] = "Hydrospawn"
                }
            },
            [0] = {
                name = "Lethtendris",
                bosses = {
                    [14327] = "Lethtendris"
                }
            },
            [0] = {
                name = "Alzzin the Wildshaper",
                bosses = {
                    [11492] = "Alzzin the Wildshaper"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 31,
            [DTColours.Yellow] = 55,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Dire Maul West"] = {
        shortName = "DM West",
        instanceId = 429,
        encounters = {
            [0] = {
                name = "Tendris Warpwood",
                bosses = {
                    [11489] = "Tendris Warpwood"
                }
            },
            [0] = {
                name = "Illyanna Ravenoak",
                bosses = {
                    [11488] = "Illyanna Ravenoak"
                }
            },
            [0] = {
                name = "Magister Kalendris",
                bosses = {
                    [11487] = "Magister Kalendris"
                }
            },
            [0] = {
                name = "Immol'thar",
                bosses = {
                    [11496] = "Immol'thar"
                }
            },
            [0] = {
                name = "Prince Tortheldrin",
                bosses = {
                    [11486] = "Prince Tortheldrin"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 31,
            [DTColours.Yellow] = 58,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Dire Maul North"] = {
        shortName = "DM North",
        instanceId = 429,
        encounters = {
            [0] = {
                name = "Guard Mol'dar",
                bosses = {
                    [14326] = "Guard Mol'dar"
                }
            },
            [0] = {
                name = "Stomper Kreeg",
                bosses = {
                    [14322] = "Stomper Kreeg"
                }
            },
            [0] = {
                name = "Guard Fengus",
                bosses = {
                    [14321] = "Guard Fengus"
                }
            },
            [0] = {
                name = "Guard Slip'kik",
                bosses = {
                    [14323] = "Guard Slip'kik"
                }
            },
            [0] = {
                name = "Captain Kromcrush",
                bosses = {
                    [14325] = "Captain Kromcrush"
                }
            },
            [0] = {
                name = "Cho'Rush the Observer",
                bosses = {
                    [14324] = "Cho'Rush the Observer"
                }
            },
            [0] = {
                name = "King Gordok",
                bosses = {
                    [11501] = "King Gordok"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 31,
            [DTColours.Yellow] = 58,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Scholomance"] = {
        shortName = "Scholo",
        instanceId = 289,
        encounters = {
            [0] = {
                name = "Blood Steward of Kirtonos",
                bosses = {
                    [14861] = "Blood Steward of Kirtonos"
                }
            },
            [0] = {
                name = "Kirtonos the Herald",
                bosses = {
                    [10506] = "Kirtonos the Herald"
                }
            },
            [0] = {
                name = "Jandice Barov",
                bosses = {
                    [10503] = "Jandice Barov"
                }
            },
            [0] = {
                name = "Rattlegore",
                bosses = {
                    [11622] = "Rattlegore"
                }
            },
            [0] = {
                name = "Death Knight Darkreaver",
                bosses = {
                    [14516] = "Death Knight Darkreaver"
                }
            },
            [0] = {
                name = "Marduk Blackpool",
                bosses = {
                    [10433] = "Marduk Blackpool"
                }
            },
            [0] = {
                name = "Vectus",
                bosses = {
                    [10432] = "Vectus"
                }
            },
            [0] = {
                name = "Ras Frostwhisper",
                bosses = {
                    [10508] = "Ras Frostwhisper"
                }
            },
            [0] = {
                name = "Instructor Malicia",
                bosses = {
                    [10505] = "Instructor Malicia"
                }
            },
            [0] = {
                name = "Doctor Theolen Krastinov",
                bosses = {
                    [11261] = "Doctor Theolen Krastinov"
                }
            },
            [0] = {
                name = "Lorekeeper Polkelt",
                bosses = {
                    [10901] = "Lorekeeper Polkelt"
                }
            },
            [0] = {
                name = "The Ravenian",
                bosses = {
                    [10507] = "The Ravenian"
                }
            },
            [0] = {
                name = "Lord Alexei Barov",
                bosses = {
                    [10504] = "Lord Alexei Barov"
                }
            },
            [0] = {
                name = "Lady Illucia Barov",
                bosses = {
                    [10502] = "Lady Illucia Barov"
                }
            },
            [0] = {
                name = "Darkmaster Gandling",
                bosses = {
                    [1853] = "Darkmaster Gandling"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 33,
            [DTColours.Yellow] = 58,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Stratholme"] = {
        shortName = "Strat",
        instanceId = 329,
        encounters = {
            [0] = {
                name = "Stratholme Courier",
                bosses = {
                    [11082] = "Stratholme Courier"
                }
            },
            [0] = {
                name = "The Unforgiven",
                bosses = {
                    [10516] = "The Unforgiven"
                }
            },
            [0] = {
                name = "Timmy the Cruel",
                bosses = {
                    [10808] = "Timmy the Cruel"
                }
            },
            [0] = {
                name = "Malor the Zealous",
                bosses = {
                    [11032] = "Malor the Zealous"
                }
            },
            [0] = {
                name = "Crimson Hammersmith",
                bosses = {
                    [11120] = "Crimson Hammersmith"
                }
            },
            [0] = {
                name = "Cannon Master Willey",
                bosses = {
                    [10997] = "Cannon Master Willey"
                }
            },
            [0] = {
                name = "Archivist Galford",
                bosses = {
                    [10811] = "Archivist Galford"
                }
            },
            [0] = {
                name = "Balnazzar",
                bosses = {
                    [10812] = "Balnazzar",
                    [10813] = "Balnazzar"
                }
            },  -- END LIVE
            [0] = {
                name = "Magistrate Barthilas",
                bosses = {
                    [10435] = "Magistrate Barthilas"
                }
            },
            [0] = {
                name = "Baroness Anastari",
                bosses = {
                    [10436] = "Baroness Anastari"
                }
            },
            [0] = {
                name = "Black Guard Swordsmith",
                bosses = {
                    [11121] = "Black Guard Swordsmith"
                }
            },
            [0] = {
                name = "Nerub'renkan",
                bosses = {
                    [10437] = "Nerub'renkan"
                }
            },
            [0] = {
                name = "Maleki the Pallid",
                bosses = {
                    [10438] = "Maleki the Pallid"
                }
            },
            [0] = {
                name = "Ramstein the Gorger",
                bosses = {
                    [10439] = "Ramstein the Gorger"
                }
            },
            [0] = {
                name = "Baron Rivendare",
                bosses = {
                    [10440] = "Baron Rivendare"
                }
            },
            [0] = {
                name = "Postmaster Malown",
                bosses = {
                    [11143] = "Postmaster Malown"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 37,
            [DTColours.Yellow] = 58,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Molten Core"] = {
        shortName = "MC",
        instanceId = 409,
        encounters = {
            [663] = {
                name = "Lucifron",
                bosses = {
                    [12118] = "Lucifron"
                }
            },
            [664] = {
                name = "Magmadar",
                bosses = {
                    [11982] = "Magmadar"
                }
            },
            [665] = {
                name = "Gehennas",
                bosses = {
                    [12259] = "Gehennas"
                }
            },
            [666] = {
                name = "Garr",
                bosses = {
                    [12057] = "Garr"
                }
            },
            [667] = {
                name = "Shazzrah",
                bosses = {
                    [11264] = "Shazzrah"
                }
            },
            [668] = {
                name = "Baron Geddon",
                bosses = {
                    [12056] = "Baron Geddon"
                }
            },
            [670] = {
                name = "Golemagg the Incinerator",
                bosses = {
                    [11988] = "Golemagg the Incinerator"
                }
            },
            [669] = {
                name = "Sulfuron Harbinger",
                bosses = {
                    [12098] = "Sulfuron Harbinger"
                }
            },
            [671] = {
                name = "Majordomo Executus",
                bosses = {
                    [12018] = "Majordomo Executus"
                }
            },
            [672] = {
                name = "Ragnaros",
                bosses = {
                    [11502] = "Ragnaros"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 58,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Onyxia"] = {
        shortName = "Ony",
        instanceId = 249,
        encounters = {
            [1084] = {
                name = "Onyxia",
                bosses = {
                    [10184] = "Onyxia"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 50,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Blackwing Lair"] = {
        shortName = "BWL",
        instanceId = 469,
        encounters = {
            [0] = {
                name = "Razorgore",
                bosses = {
                    [12435] = "Razorgore"
                }
            }
        },
        levelRanges = {
            [DTColours.Orange] = 60,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Zul'Gurub"] = {
        shortName = "ZG",
        instanceId = 309,
        encounters = {
            [0] = ""
        },
        levelRanges = {
            [DTColours.Orange] = 60,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["The Ruins of AhnQiraj"] = {
        shortName = "AQ20",
        instanceId = 0,
        encounters = {
            [0] = ""
        },
        levelRanges = {
            [DTColours.Orange] = 60,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["The Temple of AhnQiraj"] = {
        shortName = "AQ40",
        instanceId = 0,
        encounters = {
            [0] = ""
        },
        levelRanges = {
            [DTColours.Orange] = 60,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    },
    ["Naxxramas"] = {
        shortName = "Naxx",
        instanceId = 0,
        encounters = {
            [0] = ""
        },
        levelRanges = {
            [DTColours.Orange] = 60,
            [DTColours.Yellow] = 60,
            [DTColours.Green] = 60,
            [DTColours.Grey] = 60
        }
    }
}