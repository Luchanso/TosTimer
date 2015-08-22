package com.luschanso.tos.timer;
import openfl.Assets;

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
	
	public static var width = 1080;
	public static var height = 1920;
	
	#end
	
	public static var style = {
		font: "Arial",
		uiColor: 0x0080F0
	}
	
	public static function init() {
		trace(Assets.getFont("fonts/arial.ttf").fontName);
	}
}