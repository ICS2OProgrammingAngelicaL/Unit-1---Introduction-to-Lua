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
local background = display.newImageRect("Images/blackmarble.jpg", 3000, 2000)

----------------------------------------------------------------------------------------
-- Local variables

local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator

-- Local functions

local function AskQuestion()
	-- Generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0,10)
	randomNumber2 = math.random(0,10)
	randomOperator = math.random(1,3)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2
	-- Create the question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

	elseif (randomOperator == 2) then
		correctAnswer = randomNumber1 - randomNumber2
		if randomNumber1>randomNumber2 then
		questionObject.text = randomNumber1 .. "-" .. randomNumber2 .. "="
	else
		AskQuestion()
	end

	else 
		correctAnswer = randomNumber1 * randomNumber2
		questionObject.text = randomNumber1 .. "x" .. randomNumber2 .. "="
	end

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
	correct.isVisible = false
	incorrect.isVisible = false
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
			correct.isVisible = true
			timer.performWithDelay(1500, HideCorrect)

		else

			correctObject.isVisible = false
			incorrect.isVisible = true
			timer.performWithDelay(1500, HideCorrect)
		end
	end
end

-------------------------------------------------------------------------------------

-- Object creation

-- Displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(1)

-- Displays "Correct" or "Incorrect"
correct = display.newText("Correct :)", display.contentWidth/6, display.contentHeight/2, nil, 50)
correct.isVisible = false

incorrect = display.newText("Incorrect :(", display.contentWidth/2, display.contentHeight/6, nil, 50)
incorrect.isVisible = false

-- Create the correct text object and make it invisible
correctObject = display.newText("Correct", display.contentWidth/2, display.contentHeight/2, 150, 80)
correctObject:setTextColor(1)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- call the function to ask the question
AskQuestion()