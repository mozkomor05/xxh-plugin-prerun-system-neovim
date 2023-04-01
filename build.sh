#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

url='https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'
appimage=`basename $url`

cd $build_dir

if [ -x "$(command -v wget)" ]; then
 wget $arg_q $arg_progress $portable_url -O $appimage
elif [ -x "$(command -v curl)" ]; then
 curl $arg_s -L $portable_url -o $appimage
else
 echo Install wget or curl
fi

chmod u+x $appimage

cp $(which nvim) $build_dir/nvim.appimage
cp -r ~/.config/nvim $build_dir/nvim_config
cp $CDIR/prerun.sh $build_dir/
