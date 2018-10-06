-----------------------------------------------------------------------------------------
-- Title: TouchReact
-- Name: Angelica L
-- Course: ICS2O/3C
-- This program displays a button that the user can activate
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- dets the background colour
display.setDefault ("background", 204/255, 153/255, 255/255)

-- The image thats shown when button is inactive
local bongoCatNon = display.newImageRect("Images/bongoCatun.png", 598, 596)
bongoCatNon.x = display.contentWidth *8/10
bongoCatNon.y = display.contentHeight *8/10
bongoCatNon.isVisible = true

-- the image thats shown when the button is activated
local bongoCatAct = display.newImageRect("Images/bongoCatAct.png", 598, 596)
bongoCatAct.x = display.contentWidth *8/10
bongoCatAct.y = display.contentHeight *8/10
bongoCatAct.isVisible = false

local bongoSlam = display.newImageRect("Images/bongoSlam.png", 598, 596)
bongoSlam.x = display.contentWidth *20/25
bongoSlam.y = display.contentHeight *18/23
bongoSlam.isVisible = false

-- Blue button
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- Red button
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- Creates text object
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentHeight/3
textObject.y = display.contentWidth/2
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- create local functions

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue blutton is clicked, the text will appear with the red button,  
-- make the image change and make the blue button dissapear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		bongoCatNon.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		bongoCatAct.isVisible = true
		bongoSlam.isVisible = true
	end

	if (touch.phase == "ended") then
	   blueButton.isVisible = true
	   bongoCatNon.isVisible = true
	   redButton.isVisible = false
	   textObject.isVisible = false
	   bongoCatAct.isVisible = false
	   bongoSlam.isVisible = false
	end
end


-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: 
local function RedButtonListener(touch)
	if (touch.phase == "ended") then
		blueButton.isVisible = true
		bongoCatNon.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		bongoCatAct.isVisible = false
		bongoSlam.isVisible = false
	end

	if (touch.phase == "began") then
		blueButton.isVisible = false
		bongoCatNon.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		bongoCatAct.isVisible = true
		bongoSlam.isVisible = true
	end
end



blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)