#!/bin/sh
while true
do

	#wget http://localhost:9001/p/collexistra-score-pad/export/txt -O score.abc
	#abc2midi score.abc -o score.mid
	wget http://localhost:9001/p/collexistra-chuck-pad/export/txt -O current_pad.ck

	# see if new pad compiles properly
	COMPILE_ERRORS=`chuck --silent current_pad.ck 2>&1 | grep "\[current_pad.ck\]:line("`
	echo "COMPILE_ERRORS=${COMPILE_ERRORS}"

	if [ -z "${COMPILE_ERRORS}" ]
	then
		echo "Compilation successful, updating pad"
		echo "Machine.add(\"pad.ck\");" >> current_pad.ck
		cp current_pad.ck pad.ck
	fi
	sleep 1

	#chuck --srate48000 pad.ck

	#aplaymidi -p 14:0 score.mid

	#killall chuck

done

