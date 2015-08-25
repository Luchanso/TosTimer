package com.luschanso.tos.timer.controls;

import com.luschanso.tos.timer.WorkTimer;
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
	public var nameTimer(get, set):String;
	/**
	 * Time in seconds
	 */
	public var time(get, set)			:Float;
	public var realHeight(get, null)	:Float;
	public var isPause(get, set)		:Bool;
	public var controller(get, set)		:WorkTimer;
	
	static inline var itemHeightPercent	:Float 	= 0.1;
	static inline var itemWidthPercent	:Float 	= 1;
	
	var itemWidth 		:Float;
	var itemHeight		:Float;
	var buttonStart 	:Sprite;
	var buttonStop	 	:Sprite;
	var _timeName		:String;
	var _time			:Float;
	var _lable			:TextField;
	var _timerIsPause	:Bool;
	var _controller		:WorkTimer;

	public function new(name:String = "", time:Float = 0)
	{
		super();
		
		this.itemHeight = itemHeightPercent * Settings.height;
		this.itemWidth = itemWidthPercent * Settings.width;
		
		this.fillBackground();
		this.addSplitter();
		this.addTextField(name, secondsToTimeString(time));
		this.addButton();
	}
	
	public function setState(stateIsPause:Bool)
	{
		if (stateIsPause) 
		{
			buttonStart.visible = true;
			buttonStop.visible = false;
		}
		else
		{
			buttonStart.visible = false;
			buttonStop.visible = true;
		}
	}
	
	function toggleState(e:MouseEvent = null)
	{
		if (buttonStart.visible) 
		{
			buttonStart.visible = false;
			buttonStop.visible = true;
		}
		else
		{
			buttonStart.visible = true;
			buttonStop.visible = false;
		}
	}
	
	function addButton() 
	{
		var iconMarginRight = 10;
		var iconSize = 50;
		var buttonPosition = { x: itemWidth - iconMarginRight - iconSize, y: itemHeight / 2 - iconSize / 2};
		
		var playData = Assets.getBitmapData("icons/play.png");
		buttonStart = new Sprite();
		buttonStart.addChild(new Bitmap(playData, PixelSnapping.AUTO, true));
		buttonStart.width = iconSize;
		buttonStart.height = iconSize;
		buttonStart.x = buttonPosition.x;
		buttonStart.y = buttonPosition.y;
		buttonStart.addEventListener(MouseEvent.CLICK, toggleState);
		
		addChild(buttonStart);
		
		var pauseData = Assets.getBitmapData("icons/pause.png");		
		buttonStop = new Sprite();
		buttonStop.addChild(new Bitmap(pauseData, PixelSnapping.AUTO, true));
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
		var lableFontSize = 25;
		var lableFontColor = 0x333333;
		var marginLeft = 10;
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.CENTER;
		var lablePosition = { x: marginLeft, y: itemHeight / 2 };
		
		_lable = new TextField();
		_lable.defaultTextFormat = lableFormat;
		_lable.autoSize = TextFieldAutoSize.LEFT;
		_lable.selectable = false;
		_lable.text = formattingLable(name, time);
		_lable.x = lablePosition.x;
		_lable.y = lablePosition.y - _lable.height / 2;
		
		this.addChild(_lable);
	}
	
	function formattingLable(name:String, time:String):String
	{
		return name + " (" + time + ")";
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

	function get_isPause():Bool
	{
		return _timerIsPause;
	}
	
	function set_isPause(value:Bool):Bool 
	{
		if (value) 
		{
			buttonStart.visible = true;
			buttonStop.visible = false;
			dispatchEvent(new TimeViewItemEvent(TimeViewItemEvent.PAUSE));
		}
		else 
		{
			buttonStart.visible = false;
			buttonStop.visible = true;
			dispatchEvent(new TimeViewItemEvent(TimeViewItemEvent.START));
		}
		
		return _timerIsPause = value;
	}	
	
	function get_nameTimer():String 
	{
		return _timeName;
	}
	
	function set_nameTimer(value:String):String 
	{
		_lable.text = formattingLable(value, secondsToTimeString(_time));
		return _timeName = value;
	}
	
	function get_time():Float 
	{
		return _time;
	}
	
	function set_time(seconds:Float):Float 
	{
		_lable.text = formattingLable(_timeName, secondsToTimeString(seconds));
		return _time = seconds;
	}
	
	function get_controller():WorkTimer 
	{
		return _controller;
	}
	
	function set_controller(value:WorkTimer):WorkTimer 
	{
		return _controller = value;
	}
}