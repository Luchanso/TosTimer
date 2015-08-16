package com.luschanso.tos.timer.controls;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.PixelSnapping;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class TimeViewItem extends Sprite
{
	public var realHeight(get, null):Float;	
	
	static inline var itemHeightPercent	:Float 	= 0.1;
	static inline var itemWidthPercent	:Float 	= 1;
	
	var itemWidth 		:Float;
	var itemHeight		:Float;
	var buttonStart 	:Bitmap;
	var buttonStop	 	:Bitmap;
	var _timeName		:String;
	var _time			:Float;
	var _lable			:TextField;

	public function new(name:String = "", time:Float = 0)
	{
		super();
		
		this.itemHeight = itemHeightPercent * Settings.height;
		this.itemWidth = itemWidthPercent * Settings.width;
		
		this.fillBackground();
		this.addSplitter();
		this.addTextField();
		this.addButton();	
	}
	
	function toggleState(e:MouseEvent)
	{
		
	}
	
	function addButton() 
	{
		var iconMarginRight = 10;
		var iconSize = 50;
		var buttonPosition = { x: itemWidth - iconMarginRight - iconSize, y: itemHeight / 2 - iconSize / 2};
		
		var playData = Assets.getBitmapData("icons/play.png");
		buttonStart = new Bitmap(playData, PixelSnapping.AUTO, true);
		buttonStart.width = iconSize;
		buttonStart.height = iconSize;
		buttonStart.x = buttonPosition.x;
		buttonStart.y = buttonPosition.y;
		buttonStart.addEventListener(MouseEvent.CLICK, toggleState);
		
		addChild(buttonStart);
		
		var pauseData = Assets.getBitmapData("icons/pause.png");
		buttonStop = new Bitmap(pauseData, PixelSnapping.AUTO, true);
		buttonStop.width = iconSize;
		buttonStop.height = iconSize;
		buttonStop.x = buttonPosition.x;
		buttonStop.y = buttonPosition.y;
		buttonStop.addEventListener(MouseEvent.CLICK, toggleState);
		
		addChild(buttonStop);
		
		buttonStop.visible = false;
	}
	
	function addTextField()
	{
		var lableFontSize = 25;
		var lableFontColor = 0x333333;
		var marginLeft = 10;
		var defaultText = "00:00";
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.CENTER;
		var lablePosition = { x: marginLeft, y: 0 };
		
		_lable = new TextField();
		_lable.defaultTextFormat = lableFormat;
		_lable.autoSize = TextFieldAutoSize.LEFT;
		_lable.x = lablePosition.x;
		_lable.y = lablePosition.y;
		_lable.selectable = false;
		_lable.text = defaultText;
		
		this.addChild(_lable);
	}
	
	function addSplitter():Void
	{
		var splitterColor = 0xC9C9C9;
		
		this.graphics.lineStyle(1, splitterColor);
		this.graphics.moveTo(0, itemHeight);
		this.graphics.lineTo(itemWidth, itemHeight);
	}
	
	function fillBackground() 
	{
		var backgroundColor = 0xFFFFFF;
		
		graphics.beginFill(backgroundColor);
		graphics.drawRect(0, 0, itemWidth, itemHeight);
		graphics.endFill();
	}
	
	function get_realHeight():Float
	{
		return this.itemHeight;
	}
	
}