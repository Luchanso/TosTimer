package com.luschanso.tos.timer.controls;

import openfl.events.Event;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class TimeViewItemEvent extends Event
{
	public static inline var PAUSE = "pause";
	public static inline var START = "start";

	public function new(type:String, bubbles:Bool=false, cancelable:Bool=false) 
	{
		super(type, bubbles, cancelable);
	}
	
}