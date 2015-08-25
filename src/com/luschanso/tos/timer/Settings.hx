package com.luschanso.tos.timer;
import openfl.Assets;
import openfl.Lib;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class Settings
{
	#if !mobile
	
	public static var width = 360;
	public static var height = 640;
	
	#elseif mobile
	
	public static var width = 0;
	public static var height = 0;
	
	#end
	
	public static var style = {
		font: "Arial",
		uiColor: 0x0080F0
	}
	
	public static function init() {
		
		#if mobile
			width = Lib.current.stage.stageWidth;
			height = Lib.current.stage.stageHeight;
		#end
		
		Assets.getFont("fonts/arial.ttf");
	}
}