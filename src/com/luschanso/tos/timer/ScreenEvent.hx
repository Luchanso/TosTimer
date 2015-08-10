package com.luschanso.tos.timer;

import openfl.events.Event;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class ScreenEvent extends Event
{
	/**
	 * Вызов другого экрана по имени
	 */
	public static var CALL_SCREEN_BY_NAME = "callScreenByName";
	
	/**
	 * 
	 */
	public static var SHOW_SCREEN = "showScreen";	
	
	/**
	 * 
	 */
	public static var HIDE_SCREEN = "hideScreen";
	
	public var calledScreenName:String;
	public var eventOwner:Screen;

	public function new(type:String, eventOwner:Screen, calledScreenName = "", bubbles:Bool = false, cancelable:Bool = false)
	{
		super(type, bubbles, cancelable);
		
		this.calledScreenName = calledScreenName;
		this.eventOwner = eventOwner;
	}
	
}