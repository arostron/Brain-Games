BrickBreaker
============

Brick Breaker game in Processing where the platform is controlled by brainwaves from a mindflex. If your attention brainwave is strong enough, the platform will move underneath the ball, if it is not strong enough, the platform stays still!

Currently lives are disabled.
Difficulty can be adjusted with the difficulty variable at the top of BrickBreaker.pde 


Instructions
============

First, ensure the basic BrainGrapher works, locate it in the previous directory.

Run this game open the BrickBreaker.pde and click the top left-hand play arrow. This will pull up the game window.

Observe the output window of processing to see which ports are available, likely ports 0, 1, or, 2. Next find the line of code 'serial = new Serial(this, Serial.list()[0], 9600);' and change the zero between the brackets to whichever port the mindflex is connected to.   

Once the serial port has been selected the game will need to be restarted. Once connected, 'Received string over serial: 0,0,0,0,0,0' should be printed out many times. This indicated that the mindflex data is being streamed to the computer! The first number indicated connection strength, 200 is not connected, 0 is perfect. To fix connection strength adjust the headband of the mindflex accordingly.

NOTE: I did not create all of this code. I used code as a baseplate from:  https://github.com/jakewilson/brickbreaker

I also implemented serial communications by referencing:
https://github.com/kitschpatrol/BrainGrapher

------------------------------

If the ball is not moving it means the connection is not strong enough.
If the ball is moving but the platform is not, your 'concentration' brain wave isn't strong enough! (try reading numbers)
If the ball and the platform are moving everything is working and your brain waves are focused enough!

------------------------------
Commands:

[p] pause game

[c] continue game (while paused)

[q] quit game     (while paused)

[enter] restart game after game over

[Increasing concentration] move the platform under the ball
