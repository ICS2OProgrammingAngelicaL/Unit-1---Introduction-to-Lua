-----------------------------------------------------------------------------------------
-- Title : Area Rectangle/Circle
-- Name : Angelica L
-- Course : ICS20/3C
-- This program displays a rectangle and shows its area
-----------------------------------------------------------------------------------------

-- Create my local variables
local areaTextRectangle
local areaTextCircle
local textSize = 50
local myRectangle
local myCircle
local pi = 3.14
local myRadius = 75
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local areaOfCircle

-- Set the background colour of my screen
display.setDefault("background", 204/255, 255/255, 153/255)

-- To remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- Draw the rectangle that is half the width and height of the screen size
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- Draw the circle that is half the width and height of the screen size
myCircle = display.newCircle(800, 600, 75)

-- Set circle fill colour
myCircle:setFillColor (1)

-- Set width of circle border
myCircle.strokeWidth = 10

-- Set circle border colour
myCircle:setStrokeColor(1, 0, 0)

-- Anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- Set the width of the border
myRectangle.strokeWidth = 10

-- Set the colour of the rectangle
myRectangle:setFillColor(1)

-- Set the colour of the border
myRectangle:setStrokeColor(0, 0, 1)

-- Calculate the area of the circle
areaOfCircle = myRadius*myRadius*pi

-- Calculate the area of the rectangle
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- Write the area of the Rectangle on the screen
areaTextRectangle = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels²", 0, 100, Arial, textSize)

-- Write the area of the circle on the screen
areaTextCircle = display.newText("The area of this circle with a radious of\n" ..
	myRadius .. "is" ..
	areaOfCircle .. "pixels²",0, 0, Arial, textSize)

-- Anchor the text of circle and set its (x,y) position
areaTextCircle.anchorX = 0
areaTextCircle.anchorY = 0
areaTextCircle.x = 20
areaTextCircle.y = display.contentHeight/3



-- Anchor the text and set its (x,y) position
areaTextRectangle.anchorX = 0
areaTextRectangle.anchorY = 0
areaTextRectangle.x = 20
areaTextRectangle.y = display.contentHeight/2

-- Set the colour of the newTextRectangle
areaTextCircle:setTextColor(0, 0, 0)

-- set the colour of the newTextRectangle
areaTextRectangle:setTextColor(0, 0, 0)