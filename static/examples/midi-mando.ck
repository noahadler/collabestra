adc => Mandolin m => JCRev r => dac;

0.5 => m.gain;
0.01 => r.mix;

0.125::second => dur qn;

MidiIn min;
MidiMsg msg;

//open midi receiver, exit on fail
if ( !min.open(0) )
{
	<<<"Failed to open MIDI input">>>;
	me.exit();
}

while( true )
{
	// wait on midi event
	min => now;
	
	// receive midimsg(s)
	while( min.recv( msg ) )
	{
		msg.data1 & 15 => int channel;
		msg.data1 / 16 => int command;
		
		<<< channel, command, msg.data2, msg.data3 >>>;
		
		if (command == 9)
		{
			Std.mtof(msg.data2) => m.freq;
			m.noteOn(0.9);
		}
		else if (command == 8)
		{
			m.noteOff(0.9);
		}
		else if (command == 14)
		{
			// pitch bend
		}
		else if (command == 11)
		{
			// CC
		}
	}
}
