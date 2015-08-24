package com.luschanso.tos.timer;

import com.luschanso.tos.timer.WorkTimer;
import openfl.filesystem.File;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class TimerManager
{
	static inline var 	saveFilePath	= "timers.bin";
	static var 			_instance		:TimerManager = new TimerManager();	
	static private var fileOutput;
	
	public static var instance(get, null):TimerManager;
	
	public var timerList	:List<WorkTimer>;
	public var activeTimer	:WorkTimer;
	
	public var play(timerName:String):Void
	{
		var timerIsFound = false;
		
		for (timer in timerList) 
		{
			if (timer.name == timerName)
			{
				timerIsFound = true;
				timer.start();
				
				activeTimer.stop();
				activeTimer = timer;
				
				break;
			}
		}
		
		if (!timerIsFound)
		{			
			throw("Not found timer with name: " + timerName);
		}
	}
	
	public function load()
	{
		
	}

	private function new() 
	{
		timerList = new List<WorkTimer>();
		
	}
	
	function public loadFromStorage()
	{
		
	}
	
	function public saveToStorage()
	{
		var fileOutput = File.write(saveFilePath);
		
		for (timer in timerList)
		{
			
		}
		
		fileOutput.close();
	}
	
	static function get_instance():TimerManager 
	{
		return _instance;
	}
	
}