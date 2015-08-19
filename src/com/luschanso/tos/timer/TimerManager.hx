package com.luschanso.tos.timer;
import com.luschanso.tos.timer.WorkTimer;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class TimerManager
{
	static var _instance:TimerManager = new TimerManager();	
	public static var instance(get, null):TimerManager;
	
	public var timerList	:List<WorkTimer>;
	public var activeTimer	:WorkTimer;
	
	public var play(timerName:String):Void
	{
		for (var timer in timerList) 
		{
			
		}
	}

	private function new() 
	{		
	}
	
	static function get_instance():TimerManager 
	{
		return _instance;
	}
	
}