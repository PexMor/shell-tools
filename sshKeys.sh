#!/bin/bash

TDIR="$HOME/tmp/ssh-check"
[ -d "$TDIR" ] && rm -rf "$TDIR"
[ -d "$TDIR" ] || mkdir -p "$TDIR"

NO=0
cat "$HOME/.ssh/authorized_keys" | while read LINE; do
    KL=`echo "$LINE" | tr -d "\r\n\t "`
    if [ "x$KL" != "x" ]; then
        FN=`printf "key-%03d.pub" $NO`
        echo "$LINE" > "$TDIR/$FN"
        NO=$[NO+1]
    fi
done

echo "== check ssh key hash: ssh-keygen -l -E sha1 -f your-key.pub"
for F in $TDIR/*.pub; do
    BN=`basename "$F"`
    # printf "%20s:" "$BN"
    ssh-keygen -l -E sha1 -f $F
done
echo "== check ssh key hash: ssh-keygen -l -E md5 -f your-key.pub"
for F in $TDIR/*.pub; do
    BN=`basename "$F"`
    # printf "%20s:" "$BN"
    ssh-keygen -l -E md5 -f $F
done
