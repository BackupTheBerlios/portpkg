# ok this is a hot-fix for 0.35cvs-7tom/8tom:
if ! [ -L dev/stdout ]; then
  # ok, stdout is removed
  ln -s fd/1 dev/stdout
  echo "FIXED /DEV/STDOUT, PLEASE CHECK IT:" >&2
  ls -l dev/stdout >&2
fi
