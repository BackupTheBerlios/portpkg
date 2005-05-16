if [ -x usr/bin/python ]; then
  usr/bin/python -E usr/lib/python?.?/compileall.py -q usr/lib/python?.?/site-packages >/dev/null 2>&1
fi
