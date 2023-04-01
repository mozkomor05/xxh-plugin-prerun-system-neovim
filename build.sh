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

cp $(which nvim) $build_dir/nvim.appimage
cp -r ~/.config/nvim $build_dir/nvim_config
cp $CDDIR/prerun.sh $build_dir/
