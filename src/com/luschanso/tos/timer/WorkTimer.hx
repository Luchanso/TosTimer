package com.luschanso.tos.timer;

import com.luschanso.tos.timer.controls.TimeViewItem;
import com.luschanso.tos.timer.controls.TimeViewItemEvent;
import openfl.events.TimerEvent;
import openfl.utils.Timer;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class WorkTimer
{
	static inline var second = 1000;
	var _name		: String;
	/**
	 * Время в секундах
	 */
	var _time		: Float;
	var _linkUI		: TimeViewItem;	
	var _timer		: Timer;
	
	public var UI(get, set) 	: TimeViewItem;

	public function new(name:String = "", time:Float = 0, linkUI:TimeViewItem = null)
	{
		this._name = name;
		this._time = time;
		this._linkUI = linkUI;
		
		if (_linkUI != null)
		{
			_linkUI.addEventListener(TimeViewItemEvent.START, start);
			_linkUI.addEventListener(TimeViewItemEvent.PAUSE, stop);
		}
		
		this._timer = new Timer(second);
		this._timer.addEventListener(TimerEvent.TIMER, tick);
	}
	
	function start():Void
	{
		this._timer.start();
	}
	
	function stop():Void
	{
		this._timer.stope();
	}
		
	function tick(e:TimerEvent):Void 
	{
		this._time++;
		
		if (_linkUI != null)
		{
			_linkUI.time = this._time;
		}
	}
	
	function get_UI():TimeViewItem 
	{
		return UI;
	}
	
	function set_UI(value:TimeViewItem):TimeViewItem 
	{
		if (_linkUI != null) 
		{
			_linkUI.removeEventListener(TimeViewItemEvent.START, start);
			_linkUI.removeEventListener(TimeViewItemEvent.PAUSE, stop);
		}
		
		_linkUI = value;
		_linkUI.addEventListener(TimeViewItemEvent.START, start);
		_linkUI.addEventListener(TimeViewItemEvent.PAUSE, stop);
		
		return _linkUI;
	}
}