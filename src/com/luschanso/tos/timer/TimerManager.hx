package com.luschanso.tos.timer;

import com.luschanso.tos.timer.WorkTimer;
import haxe.Serializer;
import haxe.Unserializer;
import sys.io.File;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class TimerManager
{
	static inline var 	saveFilePath	= "timers.bin";
	static var 			_instance		:TimerManager = new TimerManager();	
	static private var 	fileOutput;
	
	public static var instance(get, null):TimerManager;
	
	public var timerList	:List<WorkTimer>;
	public var activeTimer	:WorkTimer;
	
	public function play(timerName:String):Void
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
	
	public function loadFromStorage()
	{
		var dataTimer = File.getContent(saveFilePath);
		var unserializer = new Unserializer(dataTimer);
		
		var listStrings:List<String> = unserializer.unserialize();
		var dataStrings:Array<String> = Lambda.array(listStrings);
		
		var i = dataStrings.length;
		while (--i >= 0) 
		{
			this.timerList.push(WorkTimer.unserialize(dataStrings[i]));
		}
	}
	
	public function saveToStorage()
	{
		var fileOutput = File.write(saveFilePath);
		var serializer = new Serializer();
		var dataStrings = new List<String>();
		
		for (item in timerList)
		{
			dataStrings.push(WorkTimer.serialize(item));
		}
		
		serializer.serialize(dataStrings);
		
		fileOutput.writeString(serializer.toString());
		
		fileOutput.close();
	}
	
	private static function get_instance():TimerManager 
	{
		return _instance;
	}

	private function new() 
	{
		timerList = new List<WorkTimer>();
		
	}
	
	
	
}