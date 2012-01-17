#!/bin/sh
while true
do

	wget http://localhost:9001/p/collexistra-score-pad/export/txt -O score.abc
	abc2midi score.abc -o score.mid
	wget http://localhost:9001/p/collexistra-chuck-pad/export/txt -O pad.ck

	chuck --srate44100 pad.ck &

	aplaymidi -p 14:0 score.mid

	killall chuck

done

