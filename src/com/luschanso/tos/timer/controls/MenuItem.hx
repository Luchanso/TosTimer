package com.luschanso.tos.timer.controls;

import com.luschanso.tos.timer.ScreenEvent;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class MenuItem extends Sprite
{
	static inline var itemHeightPercent	:Float 	= 0.1;
	static inline var itemWidthPercent	:Float 	= 1;
	
	var lable 		:TextField;
	var itemWidth 	:Float;
	var itemHeight	:Float;
	
	public var text(get, set):String;

	public function new(text:String = "")
	{
		super();
		
		this.itemHeight = MenuItem.itemHeightPercent * Lib.application.window.height;
		this.itemWidth = MenuItem.itemWidthPercent * Lib.application.window.width;
		
		this.addLable(text);
		this.addSplitter();
	}
	
	function addLable(text:String):Void
	{
		var lableFontSize = 21; // (427e30d9-817a-4b7a-a129-ef3380aa1ac6) TODO: Переделать на зависимость от размера дисплея
		var lableFontColor = 0x333333;
		var lableFormat = new TextFormat(Settings.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.CENTER;
		var lablePosition = { x: this.itemWidth / 2, y: this.itemHeight / 2 };
		
		lable = new TextField();
		lable.defaultTextFormat = lableFormat;
		lable.text = text;
		lable.autoSize = TextFieldAutoSize.LEFT;
		lable.x = lablePosition.x - lable.width / 2;
		lable.y = lablePosition.y - lable.height / 2;	
		lable.selectable = false;
		
		this.addChild(lable);		
	}
	
	/**
	 * Добавляет разделительную линию
	 */
	function addSplitter():Void
	{
		var splitterColor = 0xC9C9C9;
		
		this.graphics.lineStyle(1, splitterColor);
		this.graphics.moveTo(0, itemHeight);
		this.graphics.lineTo(itemWidth, itemHeight);
	}
	
	function get_text():String 
	{
		return this.lable.text;
	}
	
	function set_text(value:String):String 
	{
		return this.lable.text = value;
	}
	
}