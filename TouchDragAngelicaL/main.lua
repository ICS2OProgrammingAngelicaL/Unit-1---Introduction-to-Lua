-----------------------------------------------------------------------------------------
-- Title : TouchDrag
-- Name : Angelica L
-- Course : ICS20/3C
-- This programn displays images that the user can interact with
-----------------------------------------------------------------------------------------

-- Local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

local heart = display.newImageRect("Images/healthheart.png", 150, 150)
local heartWidth = heart.width
local heartHeight = heart.height

local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width 
local starHeight = star.height

-- boolean variables
local alreadyTouchedHeart = false
local alreadyTouchedStar = false
-----------------------------------------------------------------------------------------

-- local functions

-- Function: Heartlistener
-- Input: touch listener
-- Output: none
-- Description: moves heart when touched by user
local function HeartListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedStar == false) then
			alreadyTouchedHeart = true
		end
	end

	if ( (touch.phase == "moved") and(alreadyTouchedHeart == true) ) then
		heart.x = touch.x
		heart.y = touch.y
	end

	if (touch.phase == "ended") then
	   alreadyTouchedHeart = false
	   alreadyTouchedStar = false
	end
end

-- Function: Starlistener
-- Input: touch listener
-- Output: none
-- Description: moves star when touched by user
local function StarListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedHeart == false) then
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved") and(alreadyTouchedStar == true) ) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "ended") then
	   alreadyTouchedStar = false
	   alreadyTouchedHeart = false
	end
end

-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the initial x and y positions of the heart and star
heart.x = 400
heart.y = 500

star.x = 300
star.y = 200

-- adds the respective listeners per each object
heart:addEventListener("touch", HeartListener)
star:addEventListener("touch",  StarListener)