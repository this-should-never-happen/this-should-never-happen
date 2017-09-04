#!/bin/sh

on_exit() { printf '!\n'; }
trap on_exit EXIT

grep -a -o -m 1 H < /dev/urandom | awk 'BEGIN { ORS=""; } NR == 1'

seq 1 200 |
  head -n 101 |
  tail -n 1 |
  xargs printf %02x |
  sed 's/^/\\\\x/' |
  xargs printf

l() {
  if test -z "$L_COUNT"; then
    L_COUNT=0
    l | l &
    wait $!
  elif test "$L_COUNT" = 0; then
    printf l | L_COUNT=1 l &
    cat
    wait $!
  else
    cat
  fi
}
l
unset L_COUNT

tail -n 1 "$0" | xargs printf %s

yes | head | uniq -c | cut -z -c 1

l | tr l W | cut -z -c 1
unset L_COUNT

awk '
  BEGIN { ORS=""; OFS=""; }
  NR == 3 { print substr($1, 1, 1), substr($3, 2, 1); }
  ' < "$0"

ld 2>&1 | cut -z -c -2

exit 0
o
