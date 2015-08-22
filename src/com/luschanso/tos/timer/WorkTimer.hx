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
	static inline var separate = ";";
	var _name		: String;
	var _time		: Float;
	var _linkUI		: TimeViewItem;	
	var _timer		: Timer;
	
	public var UI(get, set) 	: TimeViewItem;
	/**
	 * Time in seconds
	 */
	public var time(get, set) 	: Float;
	public var name(get, set) 	: String;

	public function new(name:String = "", time:Float = 0, linkUI:TimeViewItem = null)
	{
		this._name = name;
		this._time = time;
		this._linkUI = linkUI;
		
		if (_linkUI != null)
		{
			_linkUI.addEventListener(TimeViewItemEvent.START, ui_callback_start);
			_linkUI.addEventListener(TimeViewItemEvent.PAUSE, ui_callback_stop);
		}
		
		this._timer = new Timer(second);
		this._timer.addEventListener(TimerEvent.TIMER, tick);
	}
	
	public function serialize():String
	{
		var data = screenSymbolsSerialize(this._name) + separate + screenSymbolsSerialize(this._time);
		return data;
	}
	
	// 6141aab7-1d4d-451f-894e-c3ae095f9be4 TODO: Доделать сериализацию объекта WorkTimer
	/*public function deserialize():WorkTimer
	{
		var data = screenSymbolsSerialize(this._name) + separate + screenSymbolsSerialize(this._time);
		return data
	}*/
	
	public function start():Void
	{
		this._timer.start();
		this._linkUI.setState(false);
	}
	
	public function stop():Void
	{
		this._timer.stop();
		this._linkUI.setState(false);
	}
	
	function screenSymbolsSerialize(string:String):String
	{
		var r = new EReg(separate, "i");
		return r.replace(string, "\\" + separate);
	}
	
	function unscreenSymbolSerialize(string:String):String
	{
		var r = new EReg("\\" + separate, "i");
		return r.replace(string, separate);
	}
	
	function ui_callback_stop(e:TimeViewItemEvent):Void
	{
		this._timer.stop();
	}
	
	function ui_callback_start(e:TimeViewItemEvent):Void
	{
		this._timer.start();
	}
		
	function tick(e:TimerEvent):Void 
	{
		this.time++;
	}
	
	function get_UI():TimeViewItem 
	{
		return _linkUI;
	}
	
	function set_UI(value:TimeViewItem):TimeViewItem 
	{
		if (_linkUI != null) 
		{
			_linkUI.removeEventListener(TimeViewItemEvent.START, ui_callback_start);
			_linkUI.removeEventListener(TimeViewItemEvent.PAUSE, ui_callback_stop);
		}
		
		_linkUI = value;
		_linkUI.addEventListener(TimeViewItemEvent.START, ui_callback_start);
		_linkUI.addEventListener(TimeViewItemEvent.PAUSE, ui_callback_stop);
		_linkUI.name = name;
		_linkUI.time = time;
		
		return _linkUI;
	}
	
	function get_time():Float 
	{
		return _time;
	}
	
	function set_time(seconds:Float):Float 
	{
		_time = seconds;
		
		if (_linkUI != null)
		{
			_linkUI.time = _time;
		}
		
		return _time;
	}
	
	function get_name():String 
	{
		return _name;
	}
	
	function set_name(value:String):String 
	{
		_linkUI.name = value;
		return _name = value;
	}
}