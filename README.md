Assignment: SciFi HUD

Instructions for use:
Click the mouse in the text “Enter the HUB” to navigate to the hud. Left click and right click the health bar to change the speed of the ship. Right Click also triggers a sound for the increasing level of  energy in the bar to the left. When the user presses the space bar it uses up the energy, “supaaspeed”, and makes the planets appear to orbit much quicker. It also triggers a wav file, and sound is produced for the rotating planets.  Click the back key in the top left corner to go back to the Home screen. 

Design solution:
I began by drawing a rough prototype of the layout of the hud, which made it a lot easier to begin making it in processing. The rotating planet’s was what I started on. I tried a number of times, to create the planets in 3D but kept on getting a bug which wouldn’t allow me to view my sketch except from the taskbar. I left them in 2D are carried on with drawing the shape of the window for my ship. 
I started most of the sketches separately and then joined them together, with many translations to gain the correct position for each object. I used push and popMatrix() around most of the translations so they wouldn’t affect the rest of my code, unless I wanted them to  as a design solution. 
Getting the planets to orbit around the main star was my favourite part of the code. It took me a while to figure it out, how to use them on levels so that I could get the array to stop spawning an infinite number of moons for each one that was created. The levels variable in the show() function allowed me to select the amount of moons a planet could have.
When the space key is pressed and the planets orbit quicker, is also one my favourite parts as the sound effects make the hud a lot more interesting.

url For the yputube video.
https://youtu.be/3f4i27O-q7Y
