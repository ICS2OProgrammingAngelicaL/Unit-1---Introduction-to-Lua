-----------------------------------------------------------------------------------------
-- Title: PhysicsAndColissions
-- Name: Angelica L
-- Course: ICS2O
-- This program . . .
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Background music
local oof = audio.loadSound("Sound/backgroundMusic.mp3")
local oofSoundChannel
oofSoundChannel = audio.play(oof)

-----------------------------------------------------------------------------------------
-- Local variables
local physics = require("physics")
-----------------------------------------------------------------------------------------

-- Start physics
physics.start()

-----------------------------------------------------------------------------------------
-- Object creation
-----------------------------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
	-- Set the x and y pos
ground.x = display.contentCenterX
ground.y = display.contentHeight *12/12
	-- Changes the width to be the same as the screen
ground.width = display.contentWidth
	-- Add to physics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})


-- Beam
local beam = display.newImage("Images/beam.png", 0, 0)
	-- Set the x and y pos
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65
	-- Sets beam height and width
beam.width = display.contentWidth/10
beam.height = display.contentHeight/0.5
	-- Rotates the beam -60 degrees so its on an angle
beam:rotate(-40)
	-- Sends it to the back layer
beam:toBack()
	-- Add to physics
physics.addBody( beam, "static", {friction = 0.5, bounce = 0.3})

-- Wall
local wall = display.newImage("Images/beam.png", 0, 0)
	-- Sets the x and y pos
wall.x = display.contentWidth *2/2
wall.y = display.contentHeight 
	-- Sets the height and width
wall.width = display.contentWidth/12
wall.height = display.contentHeight *2
	-- Send to back
wall:toBack()
	-- Add to physics
physics.addBody ( wall, "static", {friction = 0.5, bounce = 0.3})

-- Background
local bkg = display.newImage("Images/bkg.png", 0, 0)
	-- Sets the x and y pos
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY
	-- Sets the height and width
bkg.width = display.contentWidth
bkg.height = display.contentHeight
	-- Send to back
bkg:toBack()
-----------------------------------------------------------------------------------------
-- Functions
-----------------------------------------------------------------------------------------

	-- Create the first ball
local function firstBall()

		-- Create the first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)
		-- Add to physics
	physics.addBody( ball1, {density = 1.0, friction = 0.5, bounce = 0.9, radius = 25})
end

local function secondBall()
		-- Create the second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)	
		-- Adding to physics
	physics.addBody ( ball2, { density = 1.0, friction = 0.2, bounce = 0.3, radius = 12.5 })
		-- Scale the ball
	ball2:scale( 0.5, 0.5 )
end

local function thirdBall()

		-- Create the third ball
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)
		-- Add to physics
	physics.addBody( ball3, {density = 9.0, friction = 0.5, bounce = 0.3, radius = 37.5})
		-- Scale the ball
	ball3:scale( 1.5 , 1.5 )
end

-----------------------------------------------------------------------------------------
-- Timer delays
-----------------------------------------------------------------------------------------
timer.performWithDelay ( 0, firstBall )
timer.performWithDelay ( 500, secondBall )
timer.performWithDelay ( 1000, thirdBall )
