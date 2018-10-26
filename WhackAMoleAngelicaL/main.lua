-----------------------------------------------------------------------------------------
-- Title: Whack A Mole
-- Name: Angelica L
-- Course: ICS2O
-- This program displays an image of a mole on screen. If the user clicks on it in time,
-- The score increases by 1
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight)

	--Setting position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

	-- Creating mole
local mole = display.newImage( "Images/mole.png", 0, 0)
	-- Setting position
mole.x = display.contentCenterX
mole.y = display.contentCenterY
	-- Scale the mole
mole:scale(1/3,1/3)
	-- Make the mole invisible
mole.isVisible = false
-----------------------------------------------------------------------------------------
-- Functions
-----------------------------------------------------------------------------------------

function PopUp()

		--Random numbers to use as coordinates
	mole.x = math.random(0, display.contentWidth)
	mole.y = math.random(0, display.contentHeight)
		-- Makes the mole visible
	mole.isVisible = true
		-- Call the hide function
end
