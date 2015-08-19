package com.luschanso.tos.timer;

import com.luschanso.tos.timer.controls.TimeViewItem;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class WorkTimer
{
	var _name		: String;
	var _time		: Float;
	var _linkUI		: TimeViewItem;	
	var _isStarted 	: Bool;

	public function new(name:String = "", time:Float = 0, linkUI:TimeViewItem = null)
	{
		this._name = name;
		this._time = time;
		this._linkUI = linkUI;
		this._isStarted = false;
	}
	
	public function start():Void
	{
		this._isStarted = false;
	}
	
	public function stop():Void
	{
		
	}
}