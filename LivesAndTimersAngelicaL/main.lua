-----------------------------------------------------------------------------------------
-- Title: Lives And Timers
-- Name: Angelica L
-- Course: ICS2O
-- This program displays a countdown timer and 4 hearts(lives).
-- If the user enters a wrong answer they lose a life, if they run out of time they lose 
-- a life, if they answer correctly they get a point.
-----------------------------------------------------------------------------------------

-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the Background colour/image
local background = display.newImageRect("Images/blackmarble.jpg", 3500, 2000)

-- Local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local tally = 0
local totalSeconds = 5
local secondsLeft = 5
local clockText
local countDownTimer
local lives = 3
local heart1
local heart2
local heart3


-- Object creation

-- Displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/2, display.contentHeight/2, nil, 100)
questionObject:setTextColor(1)


incorrect = display.newText("Incorrect :(", display.contentWidth/2, display.contentHeight *2.5/7, nil, 75)
incorrect:setTextColor(1,0,0)
incorrect.isVisible = false

-- Create the correct text object and make it invisible
correctObject = display.newText("Correct :)", display.contentWidth/2, display.contentHeight *2/7, nil, 75)
correctObject:setTextColor(0,1,0)
correctObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight *2.5/3, 800, 80 )
numericField.inputType = "number"

correctTally = display.newText("", display.contentWidth/6, display.contentHeight/6, nil, 50) 

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth *7/8
heart1.y = display.contentHeight *1/7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth *6/8
heart2.y = display.contentHeight *1/7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth *5/8
heart3.y = display.contentHeight *1/7

-----------------------------------------------------------------------------------------

-- Local functions

local function UpdateTime()
	-- Decrement the number of seconds
	secondsLeft = secondsLeft - 1

	--Display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- Reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1

		-- If there are no lives left, play a lose sound, show you a lose image and 
		-- Cancel the timer and remove the third heart by making it invisible
		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end

			-- Call the function to ask a new question
			AskQuestion()

	end
end

-- Function that calls the timer
local function StartTimer()
	-- Create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

local function AskQuestion()
	-- Generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10,20)
	randomNumber2 = math.random(0,10)
	randomOperator = math.random(1,3)

	if (randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2
	-- Create the question in text object
		questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

	elseif (randomOperator == 2) then
		if (randomNumber2 < randomNumber1) then
			correctAnswer = randomNumber1 - randomNumber2
		else
			correctAnswer = randomNumber2 - randomNumber1
		end
		questionObject.text = randomNumber1 .. "-" .. randomNumber2 .. "="
	else -- (randomOperator == 3)
		correctAnswer = randomNumber1 * randomNumber2
		questionObject.text = randomNumber1 .. "x" .. randomNumber2 .. "="
	end

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
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
			timer.performWithDelay(1500, HideCorrect)
			correctSoundChannel = audio.play(correctSound)
			tally = tally + 1
			correctTally.text = ("Correct: "..tally)

		else

			correctObject.isVisible = false
			incorrect.isVisible = true
			timer.performWithDelay(1500, HideCorrect)
			incorrectSoundChannel = audio.play(incorrectSound)
			lives = lives - 1
		end

		-- Clear text field
		event.target.text = ""
	end
end


-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- call the function to ask the question
AskQuestion()