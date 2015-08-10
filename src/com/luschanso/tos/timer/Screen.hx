package com.luschanso.tos.timer;
import openfl.display.Sprite;

/**
 * @author Luchanso
 */
class Screen extends Sprite
{
	public function new() 
	{
		super();
		this.visible = false;
	}
	
	public var screenName:String;
	
	public function show():Void
	{
		this.visible = true;
	}
	
	public function hide():Void
	{
		this.visible = false;
	}
}