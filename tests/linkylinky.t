echo "embedded links"

rc=0
MARKDOWN_FLAGS=

echo -n '  url contains & ................... '

if echo '[hehehe](u&rl)' | ./markdown | grep -i '&amp;' >/dev/null; then
    echo "ok"
else
    echo "FAILED"
    rc=1
fi

echo -n '  url contains " ................... '

if echo '[hehehe](u"rl)' | ./markdown | grep -i '%22' >/dev/null; then
    echo "ok"
else
    echo "FAILED"
    rc=1
fi

echo -n '  url contains < ................... '

if echo '[hehehe](u<rl)' | ./markdown | grep -i '&lt;' >/dev/null; then
    echo "ok"
else
    echo "FAILED"
    rc=1
fi

echo -n '  label contains < ................. '

if echo '![he<he<he](url)' | ./markdown | grep -i '&lt;' >/dev/null; then
    echo "ok"
else
    echo "FAILED"
    rc=1
fi

echo -n '  label contains < ................. '

if echo '![he<he<he](url)' | ./markdown | grep -i '&lt;' >/dev/null; then
    echo "ok"
else
    echo "FAILED"
    rc=1
fi

echo -n '  sloppy context link .............. '

if echo '[heh]( url "how about it?" )' | ./markdown | grep -i '</a>' >/dev/null; then
    echo "ok"
else
    echo "FAILED"
    rc=1
fi

echo -n '  footnote urls formed properly .... '

TEST='[hehehe]: hohoho "ha ha"

[hehehe][]
'

if echo "$TEST" | ./markdown | grep -i '&#00;' >/dev/null; then
    echo "FAILED"
    rc=1
else
    echo "ok"
fi

exit $rc