# COLLABESTRA - online collaborative score and synthesizer editing
 initial fork based on:
  [Etherpad Lite](https://github.com/Pita/etherpad-lite)

 with integrations based on:
  abc.js
  ChucK
  icecast
  darkice

 In the current setup, there are a few scripts that need to be running simultaneously:
   1) start jackd at 44.1kHz using qjackctl
   2) exec bin/run.sh to start up the node.js server
   3) exec static/examples/connect.sh (temporary!)
   4) descend into static/examples and start darkice with 'darkice -c darkice.cfg'
   5) connect to http://localhost:9001 (or whatever your machine's called) and have fun!

# License
[Apache License v2](http://www.apache.org/licenses/LICENSE-2.0.html)
