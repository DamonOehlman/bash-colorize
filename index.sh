#!/usr/bin/env bash

require indexof

# colors
DEFAULT_FGCOLOR=white
DEFAULT_BGCOLOR=none

colorize() {
	local colors=( black red green yellow blue magenta cyan white none )
	local fgidx=$(indexof ${1-$DEFAULT_FGCOLOR} ${colors[@]})
	local bgidx=$(indexof ${2-$DEFAULT_BGCOLOR} ${colors[@]})

	if [ $fgidx -lt 0 ]; then
		fgidx=$(indexof $DEFAULT_FGCOLOR ${colors[@]})
	fi

	if [ $bgidx -lt 0 ]; then
		bgidx=$(indexof $DEFAULT_BGCOLOR ${colors[@]})
	fi

	# rebase the fg index and bg index correctly
	((fgidx += 30)); ((bgidx += 40))

	echo "\E[$fgidx;${bgidx}m"
}
