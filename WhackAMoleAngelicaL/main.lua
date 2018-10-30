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
local bkg = display.newImageRect( "Images/stars.jpeg", display.contentWidth, display.contentHeight)

	--Setting position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

	-- Creating mole
local duck = display.newImage( "Images/duck.png", 0, 0)
	-- Setting position
duck.x = display.contentCenterX
duck.y = display.contentCenterY
	-- Scale the mole
duck:scale(1/4,1/4)
	-- Make the mole invisible
duck.isVisible = false

-- Tally
local tally = 0

-- Sound effect
local quack = audio.loadSound("Sound/quack.mp3")
local quackSoundChannel 

-- Background music
local bkgMusic = audio.loadSound("Sound/sexy.mp3")
local sexySoundChannel
sexySoundChannel = audio.play(bkgMusic)
-----------------------------------------------------------------------------------------
-- Functions
-----------------------------------------------------------------------------------------

-- Calls the popUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(1850, PopUp)
end

function Hide()
		-- Make mole transparent
	duck.isVisible = false
	PopUpDelay()
end

function PopUp()

		--Random numbers to use as coordinates
	duck.x = math.random(0, display.contentWidth)
	duck.y = math.random(0, display.contentHeight)
	
		-- Makes the duck visible
	duck.isVisible = true
		-- Call the hide function
	timer.performWithDelay(800, Hide)
end

function GameStart()
	PopUpDelay()
end

function Whack( event )
	
		-- If touch phase starts
	if (event.phase == "began") then
		tally = tally + 1
		correctTally.text = ("Correct: "..tally)
		quackSoundChannel = audio.play(quack)
	end
end

-----------------------------------------------------------------------------------------
-- Event listeners
-----------------------------------------------------------------------------------------

duck:addEventListener( "touch", Whack)
-----------------------------------------------------------------------------------------
-- Object Creation
-----------------------------------------------------------------------------------------

-- Tally text
correctTally = display.newText("", display.contentWidth/6, display.contentHeight/6, nil, 35) 
correctTally:setTextColor( 153/255, 51/255, 255/255)

-----------------------------------------------------------------------------------------
-- Start the game
-----------------------------------------------------------------------------------------
GameStart()