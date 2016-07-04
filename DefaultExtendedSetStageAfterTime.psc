Scriptname DefaultExtendedSetStageAfterTime extends Quest Const Default
{quest script to set stage after a timer expires}

int property stageToSet const mandatory
{ 
	The stage to set when the timer expires
}

int property timerIDToUse = 1 auto const
{
	The timer ID to use. Must be unique inside quest. Re-using timerID will reset timer.
}

float property gameHoursTillExpire const mandatory
{
	The number of hours to wait. Can be partial, although anything less than 0.033 (2 minutes) will be rounded up.
}

Function StartTimer()
	StartTimerGameTime(gameHoursTillExpire, timerIDToUse)
EndFunction

Event OnTimerGameTime(int timerID)
	If (timerID == timerIDToUse)
		(Self as Quest).SetStage(stageToSet)
	EndIf
EndEvent