modprobe -q agpgart
( cd usr/src/nv; make ; make install )
modprobe nvidia
