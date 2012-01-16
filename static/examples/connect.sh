#!/bin/sh
wget http://localhost:9001/p/collexistra-score-pad -o score.abc
abc2mid score.abc -o score.mid

chuck midi-mando.ck

aplaymidi -p 14:0 score.mid

