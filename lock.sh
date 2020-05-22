#!
screenW=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1 | head -n 1)
screenH=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2 | head -n 1)

timeposx=100
timeposy=$((screenH-150))
dateposy=$((timeposy+60))

timefont="Monospace bold"

green=00ff99c0
red=ff5050c0
cyan=66ffffa0
transparent=00000000
littletransparent=808080e0
prettytrans=80808040
timecolor=99ffdda5

scrot -z /tmp/i3lockscr.png
convert /tmp/i3lockscr.png -spread 10 -blur 0x10 -level 0,150% /tmp/i3lockscr.png

i3lock \
    --insidecolor=$prettytrans --ringcolor=$littletransparent --line-uses-inside \
    --keyhlcolor=$green --bshlcolor=$red --separatorcolor=$transparent \
    --insidevercolor=$prettytrans --insidewrongcolor=$prettytrans \
    --ringvercolor=$cyan --ringwrongcolor=$red \
    --radius=120 --ring-width=15 \
    --veriftext="" --wrongtext="" --noinputtext="_" \
    --wrongcolor=$red \
    --force-clock \
    --timestr="%H:%M:%S" --timepos="x+$timeposx:y+$timeposy" --timecolor=$timecolor --time-align=1 --timesize=80 \
    --time-font="$timefont" \
    --datestr="%B %d, %Y" --datepos="x+$timeposx:y+$dateposy" --datecolor=$timecolor --date-align=1 --datesize=30 \
    --date-font=$timefont \
    --nofork --tiling --image /tmp/i3lockscr.png -e

rm /tmp/i3lockscr.png
