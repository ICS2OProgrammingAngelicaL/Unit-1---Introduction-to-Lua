-----------------------------------------------------------------------------------------
-- Title : MovingImages
-- Name : Angelica L
-- Course : ICS20/3C
-- This program....
-----------------------------------------------------------------------------------------

-- Create variables

--Background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048,1536)
-- Character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)
-- Global variables
scrollSpeed = 3
-----------------------------------------------------------------------------------------
-- Create function 

-- Function: MoveShip
-- Input: this function accepts am event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveShip( event )
	-- Add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- Change the transparency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

---------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Changes the direction the beetleship is facing
beetleship:scale(-1,1)

-- Set the image to be transparent
beetleship.alpha = 0

-- Set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)