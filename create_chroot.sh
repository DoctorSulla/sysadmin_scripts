#!/usr/bin/bash
#useradd -m $1
user=$1
dir=/home/$user
libdir=$dir/usr/lib
bindir=$dir/usr/bin
sharedir=$dir/usr/share
etcdir=$dir/usr/etc
devdir=$dir/dev

# Create bin and lib directories
mkdir -p $libdir && mkdir -p $bindir && mkdir -p $sharedir && mkdir -p $etcdir && mkdir -p $devdir

# Copy bins
cp /usr/bin/bash $bindir
cp /usr/bin/ls $bindir
cp /usr/bin/mkdir $bindir
cp /usr/bin/vim $bindir
cp /usr/bin/mv $bindir
cp /usr/bin/rm $bindir
cp /usr/bin/cp $bindir
cp /usr/bin/find $bindir
cp /usr/bin/grep $bindir

# Copy libs
cp /usr/lib/libreadline.so.8 $libdir
cp /usr/lib/libc.so.6 $libdir
cp /usr/lib/libncursesw.so.6 $libdir
cp /usr/lib/libreadline.so.8 $libdir
cp /usr/lib/ld-linux-x86-64.so.2 $libdir
cp /usr/lib/libcap.so.2 $libdir
cp /usr/lib/libm.so.6 $libdir
cp /usr/lib/libacl.so.1 $libdir
cp /usr/lib/libgpm.so.2 $libdir
cp /usr/lib/libpcre2-8.so.0 $libdir
cp /usr/lib/libattr.so.1 $libdir

# Link
ln -rs $libdir /home/$user/lib
ln -rs $libdir /home/$user/lib64

# Basic Config
cp /etc/{group,passwd,shadow,hosts} $etcdir
cp -r /usr/share/terminfo $sharedir

mknod $devdir/null c 1 3
mknod $devdir/zero c 1 5
mknod $devdir/tty c 5 0
mknod $devdir/random c 1 8
mknod $devdir/urandom c 1 9
chmod 0666 $devdir/{null,tty,zero}
chown root:tty $devdir/tty
