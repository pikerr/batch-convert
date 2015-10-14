#!/bin/bash

wav_dir=$1 

for f in `
  find "${wav_dir}" -mindepth 1 -maxdepth 1 -type f -name "*.wav" -print0 |
  xargs -0 -I {} basename {} .wav`
do
  avconv -i "$1/$f.wav" "$1/$f.mp3" && rm "$1/$f.wav"
done
