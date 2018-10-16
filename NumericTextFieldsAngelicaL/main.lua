-----------------------------------------------------------------------------------------
-- Title: Numeric Textfield
-- Name: Angelica L
-- Course: ICS2O
-- This program displays and uses numeric text fields to receive input to the displayed
-- subtraction, addition, or multiplication question displayed and tell the user if they
-- got the answer correct or incorrect
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background image/colour


----------------------------------------------------------------------------------------
-- Local variables

local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-- Local functions

local function AskQuestion()
	-- Generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0,10)
	randomNumber2 = math.random(0,10)

	correctAnswer = randomNumber1 + randomNumber2

	-- Create the question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- Clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- When the answer is submitted (enter key is pressed) set user input to user's 
		-- answer
		userAnswer = tonumber(event.target.text)

		-- If the users answer and the correct amswer are the same
		if ( userAnswer == correctAnswer ) then
			correctObject.isVisible = true
			timer.performWithDelay(2000, HideCorrect)
		end
	end
end

-------------------------------------------------------------------------------------

-- Object creation

-- Displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, 50)
questionObject:setTextColor(1)

-- Create the correct text object and make it invisible
correctObject = display.newText("Correct", display.contentWidth/2, display.contentHeight/2, 150, 80)
correctObject:setTextColor(1)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newText