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
	
	public function load() 
	{
		
	}

	private function new() 
	{
		timerList = new List<WorkTimer>();
		
	}
	
	function loadFromStorage()
	{
		// 227e50d6-172c-4b79-b42c-13a83c950b60 TODO: Сделать сохранение и загрузку файлов
	} 
	
	static function get_instance():TimerManager 
	{
		return _instance;
	}
	
}