# ok this is a hot-fix for 0.35cvs-7tom/8tom:
if ! [ -c dev/stdout ] && ! [ -L dev/stdout ]; then
  # stdout is not a character device file or a symlink to one
  # move what's left to root
  mv dev/stdout root/
  # symlink to fd/1
  ln -s fd/1 dev/stdout
  echo "FIXED /DEV/STDOUT, PLEASE CHECK IT:" >&2
  ls -l dev/stdout >&2
fi
