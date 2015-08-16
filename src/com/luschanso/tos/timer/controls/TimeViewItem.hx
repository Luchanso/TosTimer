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
	// effb6300-220c-48d3-8323-36da448f8361 Добавить возможность смены имени и времени таймера
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
		this.addTextField(null, secondsToTimeString(time));
		this.addButton();
	}
	
	function toggleState(e:MouseEvent)
	{
		// f7307e53-4ab2-4ebd-aa20-86c350fa1104 доделать смену кнопок
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
	
	function addTextField(name:String = "По умолчанию", time:String = "00:00")
	{
		// 7afae270-700a-4efe-bd84-36f38e60e529 Выравнить текст по центру
		var lableFontSize = 25;
		var lableFontColor = 0x333333;
		var marginLeft = 10;
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.CENTER;
		var lablePosition = { x: marginLeft, y: itemHeight / 2 - lableFontSize / 2 };
		
		_lable = new TextField();
		_lable.defaultTextFormat = lableFormat;
		_lable.autoSize = TextFieldAutoSize.LEFT;
		_lable.x = lablePosition.x;
		_lable.y = lablePosition.y;
		_lable.selectable = false;
		_lable.text = name + " (" + time + ")";
		
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
	
	function secondsToTimeString(seconds:Float):String
	{
		var hours = Math.floor(seconds / 3600);
		var mins = Math.floor((seconds - (hours * 3600)) / 60);
		var secs = Math.floor(seconds % 60);
		
		var time = "";
		
		if (hours != 0)
		{
			if (hours < 10)
			{
				time += "0" + hours;
			}
			else
			{
				time += hours;
			}
			
			time += ":";
		}
		
		if (mins < 10)
		{
			time += "0" + mins;
		}
		else
		{
			time += mins;
		}
		
		time += ":";
		
		if (secs < 10) 
		{
			time += "0" + secs;
		}
		else
		{
			time += secs;
		}
        
        return time;
	}
	
	function get_realHeight():Float
	{
		return this.itemHeight;
	}
	
}