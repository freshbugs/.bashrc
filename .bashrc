# use vim as the default editor, and to edit in-line bash commands
# escape-v (emacs CTRL-XE) to enter editor while typing a long command
export EDITOR=/usr/bin/vim
alias vi="vim"
set -o vi

alias hrule='printf %"$COLUMNS"s |tr " " "-"'
alias beep="play -qn synth 0.2 sin 440"
alias dupes="find . -type f -not -path '*/\.*' -exec md5sum {} \; | uniq -D -w32"
alias pass="gpg -d ~/secret/pass.gpg | grep"
alias pdfnup="pdfnup --letterpaper"
# convert csv to sc with: psc < in.csv > out.sc
alias psc="psc -k -d,"

# convert a4 to letter page size with: a4letter in.pdf out.pdf
a4letter() { gs -o "$1" -sDEVICE=pdfwrite -sPAPERSIZE=letter -dFIXEDMEDIA "$2"; }

# disable the keyboard for 10 seconds with: disable 10
disable() { echo "disable keyboard"; xinput float 8; sleep "$1"; echo "back in a second"; beep; sleep 1; xinput reattach 8 3; }

# histogram numbers.txt buckets.txt
histogram() { (sed 's/$/x/' $1; cat $2) | sort -n | sed ':a; /x$/{N; s/\n//; ba}; s/[^x]//g'; }
