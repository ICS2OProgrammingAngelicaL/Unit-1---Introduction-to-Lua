-----------------------------------------------------------------------------------------
-- Title : MovingImages
-- Name : Angelica L
-- Course : ICS20/3C
-- This program displays and moves objects on the screen
-----------------------------------------------------------------------------------------

-- Create variables

--Background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048,1536)
-- Character image with width and height
local GrilledCheese = display.newImageRect("Images/GrilledCheese.png", 300, 300)
-- Global variables
scrollSpeed = 3
--  BongoCat Image
local BongoCat = display.newImageRect("Images/BongoCat.png", 400, 400)
-----------------------------------------------------------------------------------------
-- Create function 

-- Function: MoveCheese
-- Input: this function accepts am event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the sandwich
local function MoveCheese( event )
	-- Add the scroll speed to the x-value of the sandwich
	GrilledCheese.x = GrilledCheese.x + scrollSpeed
	-- Change the transparency of the sandwich every time it moves so that it fades out
	GrilledCheese.alpha = GrilledCheese.alpha + 0.01
end

---------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Changes the direction the beetleship is facing
GrilledCheese:scale(-1,1)

-- Set the image to be transparent
GrilledCheese.alpha = 0

-- Set the initial x and y position of Ship
GrilledCheese.x = 0
GrilledCheese.y = display.contentHeight *2/6

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveCheese)

-- BongoCat's coordinates
BongoCat.x = 840
BongoCat.y = display.contentHeight *8/9