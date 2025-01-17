###############################################################
# Program:
#     Project 13, Asteroids
#     Brother Comeau, CS165
# Author:
#     Ben Bragg
# Summary:
#     Create a working facsimile of the classic Asteroids
#     arcade game using object-oriented C++.
# Above and Beyond
#     For my first trick, I implemented a score/level-tracking
#     system, as well as a player score and levels. (i.e. the
#     player advances to the next level whenever the current
#     level is cleared of rocks. Each level starts with level+
#     4 big rocks.)
#
#     For my next trick, I implemented a rechargeable shield
#     and invincibility frames for the player's ship. (The 
#     shield recharges after they earn a number of additional
#     points, or they clear the current level.)
###############################################################


LFLAGS = -lglut -lGLU -lGL

###############################################################
# Build the main game
###############################################################
a.out: driver.o game.o uiInteract.o uiDraw.o point.o velocity.o UFO.o ship.o bullet.o rocks.o
	g++ driver.o game.o uiInteract.o uiDraw.o point.o velocity.o UFO.o ship.o bullet.o rocks.o $(LFLAGS)

###############################################################
# Individual files
#    uiDraw.o       Draw polygons on the screen and do all OpenGL graphics
#    uiInteract.o   Handles input events
#    point.o        The position on the screen
#    game.o         Handles the game interaction
#    velocity.o     Velocity (speed and direction)
#    UFO.o          Base class for all flying objects
#    ship.o         The player's ship
#    bullet.o       The bullets fired from the ship
#    rocks.o        Contains all of the Rock classes
###############################################################
uiDraw.o: uiDraw.cpp uiDraw.h
	g++ -c uiDraw.cpp

uiInteract.o: uiInteract.cpp uiInteract.h
	g++ -c uiInteract.cpp

point.o: point.cpp point.h
	g++ -c point.cpp

driver.o: driver.cpp game.h
	g++ -c driver.cpp

game.o: game.cpp game.h uiDraw.h uiInteract.h point.h velocity.h UFO.h bullet.h rocks.h ship.h
	g++ -c game.cpp

velocity.o: velocity.cpp velocity.h point.h
	g++ -c velocity.cpp

UFO.o: UFO.cpp UFO.h point.h velocity.h uiDraw.h
	g++ -c UFO.cpp

ship.o: ship.cpp ship.h UFO.h point.h velocity.h uiDraw.h
	g++ -c ship.cpp

bullet.o: bullet.cpp bullet.h UFO.h point.h velocity.h uiDraw.h
	g++ -c bullet.cpp

rocks.o: rocks.cpp rocks.h UFO.h point.h velocity.h uiDraw.h
	g++ -c rocks.cpp


###############################################################
# General rules
###############################################################
clean:
	rm a.out *.o
