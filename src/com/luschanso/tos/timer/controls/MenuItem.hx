package com.luschanso.tos.timer.controls;

import com.luschanso.tos.timer.ScreenEvent;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.PixelSnapping;
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
	public var realHeight(get, null):Float;
	public var text(get, set):String;
	
	static inline var itemHeightPercent	:Float 	= 0.1;
	static inline var itemWidthPercent	:Float 	= 1;
	
	var lable 		:TextField;
	var itemWidth 	:Float;
	var itemHeight	:Float;
	var rightArrow	:Bitmap;

	public function new(text:String = "")
	{
		super();
		
		// 4c9c10c2-678b-424f-9351-9092171e78f9 TODO: Сделать анимацию нажатия
		
		this.itemHeight = MenuItem.itemHeightPercent * Settings.height;
		this.itemWidth = MenuItem.itemWidthPercent * Settings.width;
		
		this.addBackground();
		this.addLable(text);
		this.addSplitter();
		this.addRightArrow();
		
		this.mouseEnabled = true;
		this.buttonMode = true;
	}
	
	function addBackground()
	{
		var backgroundColor = 0xFFFFFF;
		
		graphics.beginFill(backgroundColor);
		graphics.drawRect(0, 0, itemWidth, itemHeight);
		graphics.endFill();
	}
	
	function addLable(text:String):Void
	{
		#if !mobile
		
		var lableFontSize = 21;
		
		#else
		
		var lableFontSize = 34;
		
		#end
		
		var lableFontColor = 0x333333;
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
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
	
	function addRightArrow() 
	{
		var iconMarginRight = 10;
		var iconSize = 25;
		
		var rightArrowData = Assets.getBitmapData("icons/arrow-right.png");
		
		var iconY = itemHeight / 2 - iconSize / 2;
		var iconX = itemWidth - iconSize - iconMarginRight;
		
		rightArrow = new Bitmap(rightArrowData, PixelSnapping.AUTO, true);
		rightArrow.width = iconSize;
		rightArrow.height = iconSize;
		rightArrow.x = iconX;
		rightArrow.y = iconY;
		
		addChild(rightArrow);
	}
	
	function get_text():String 
	{
		return this.lable.text;
	}
	
	function set_text(value:String):String 
	{
		return this.lable.text = value;
	}
	
	function get_realHeight():Float
	{
		return this.itemHeight;
	}
}