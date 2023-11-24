-- Display the Date and Time
local toprightDisplay = true -- top right if true, top left if false

-- Parts to show
local displayTime = true -- display time
local displayDayOfWeek = true -- display day week
local displayDate = true -- disaplay date
local useMilitaryTime = false -- default is 12 hours clock you can change this to true to use the 24 hours clock



local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

local monthlist = {
    [0] = "January",
    [1] = "February",
    [2] = "March",
    [3] = "April",
    [4] = "May",
    [5] = "June",
    [6] = "July",
    [7] = "August",
    [8] = "September",
    [9] = "October",
    [10] = "November",
    [11] = "December",
}

local weeklist = {
    [0] = "Sunday",
    [1] = "Monday",
    [2] = "Tuesday",
    [3] = "Wednesday",
    [4] = "Thursday",
    [5] = "Friday",
    [6] = "Saturday",
}


-- Display Time and Date at top right of screen -- format: | 12:13 | Wednesday | January 17, 2017 |
Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = "|"
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. " " .. hour .. ":" .. minute .. " |"
		end
		if displayDayOfWeek == true then
			CalculateDayOfWeekToDisplay()
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end
		if displayDate == true then
			CalculateDateToDisplay()
			timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year .. " |"
		end
        
        if toprightDisplay then 
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.30, 0.30)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextRightJustify(true)
            SetTextWrap(0,0.95)
            SetTextEntry("STRING")
            AddTextComponentString(timeAndDateString)
            DrawText(0.5, 0.01)
            else
            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.30, 0.30)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextRightJustify(true)
            SetTextWrap(0.1,0.28)
            SetTextEntry("STRING")
            AddTextComponentString(timeAndDateString)
            DrawText(0.01, 0.01)
		end
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = weeklist[GetClockDayOfWeek()]
end

function CalculateDateToDisplay()
	month = monthlist[GetClockMonth()]
	dayOfMonth = GetClockDayOfMonth()
	year = GetClockYear()
end
