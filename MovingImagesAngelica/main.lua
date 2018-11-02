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
scrollSpeed1 = 5
scrollSpeed2 = 10
--  Girl5 Image
local Girl = display.newImageRect("Images/girl5.png", 400, 400)
--
local Star = display.newImageRect("Images/star.png", 200, 200)

local music = audio.loadSound("Sound/MovingImagesMusic.mp3")
local musicChannel
local musicChannel = audio.play(music)
-----------------------------------------------------------------------------------------
-- Create function 

-- Function: MoveCheese
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the sandwich
local function MoveCheese( event )
	-- Add the scroll speed to the x-value of the sandwich
	GrilledCheese.x = GrilledCheese.x + scrollSpeed1
	-- Change the transparency of the sandwich every time it moves so that it fades out
	GrilledCheese.alpha = GrilledCheese.alpha + 0.01
end

-- Function: MoveGirl
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the girl
local function MoveGirl( event )
	-- Add the scroll speed to the x-value of the girl
	Girl.x = Girl.x - scrollSpeed2
	--
	Star.alpha = Star.alpha - 0.01
end

-- Function: MoveStar
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x and y value of the star
local function MoveStar( event )
	-- Add the scroll speed to the x and y value of the Star
	Star.x = Star.x + scrollSpeed1
	Star.y = Star.y - scrollSpeed1
end
---------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Changes the direction the sandwich is facing
GrilledCheese:scale(-1,1)

-- Set the sandwich image to be transparent
GrilledCheese.alpha = 0

-- Set the initial x and y position of sandwich
GrilledCheese.x = display.contentWidth /20
GrilledCheese.y = display.contentHeight *2/6

-- Girl's initial coordinates
Girl.x = display.contentWidth *8/10
Girl.y = display.contentHeight *8/10

-- Changes tthe transparency of the star
Star.alpha = 1

-- Star's initial coordinates
Star.x = display.contentWidth *2/10
Star.y = display.contentHeight *8/10

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveCheese)
Runtime:addEventListener("enterFrame", MoveGirl)
Runtime:addEventListener("enterFrame", MoveStar)
