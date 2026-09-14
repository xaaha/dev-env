#!/usr/bin/env bash
# prefix + C-j: fuzzy-jump to any window across all sessions.
# The active window in each session is bolded/greened instead of a bare
# "*", and columns are aligned so the list scans quickly.
#
# Kept as a single streaming pipe (no intermediate $(...) captures): that
# lets tmux/awk and fzf's own tty startup run concurrently instead of
# serialized, which is most of the perceived launch latency.

current="$(tmux display-message -p '#S:#I')"

reset=$'\033[0m'
green=$'\033[1;32m'
dim=$'\033[2m'

tmux list-windows -a -F '#{session_name} #{window_index} #{window_active} #{window_name} #{s|$HOME|~|:#{pane_current_path}}' |
	awk -v cur="$current" -v reset="$reset" -v green="$green" -v dim="$dim" '
		{
			target = $1 ":" $2
			if (target == cur) next

			path = $5
			for (i = 6; i <= NF; i++) path = path " " $i
			n = split(path, parts, "/")
			path = parts[n]

			label = sprintf("%-8s %2s:%-14s", $1, $2, $4)
			if ($3 == "1") {
				marker = green "●" reset
				label  = green label reset
			} else {
				marker = " "
			}
			printf "%s\t%s %s  %s%s%s\n", target, marker, label, dim, path, reset
		}
	' |
	fzf --ansi --reverse --with-nth=2.. |
	cut -f1 |
	xargs tmux switch-client -t
