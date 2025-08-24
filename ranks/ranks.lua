SMODS.Atlas({
    key = "fractionranks",
    path = "fractionranks.png",
    px = 71,
    py = 95,
})

SMODS.Rank {
    hc_atlas = "fractionranks",
	
	
	hidden = false,

    key = 'one_quarter',
    card_key = 'one_quarter',
    pos = { x = 2 },
    nominal = 0.25,

    --next = {'unstb_1', 'unstb_r2', '2', 'unstb_e' },
	
	--unstb_prev= { 'unstb_0' },

    shorthand = '1/4',
	
	is_decimal = true,
	--rank_act = {'0', '0.25', '1'},

}