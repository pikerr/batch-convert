#!/bin/bash

wav_dir=$1 
out_dir="/var/www/pub/sound/"

for f in `find "${wav_dir}" -mindepth 1 -maxdepth 1 -type f -name "*.wav" -print0 |
  xargs -0 -I {} basename {} .wav` #| xargs -I {} avconv -i "{}.wav" "{}.mp3" && rm "{}.wav"
do
  avconv -i "$1/$f.wav" "$1/$f.mp3" && rm "$1/$f.wav"
done

#for i in $wav_dir/*
#do
#  echo "$i"
#done

