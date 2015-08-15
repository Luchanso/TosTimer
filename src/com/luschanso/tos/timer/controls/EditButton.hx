package com.luschanso.tos.timer.controls;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.PixelSnapping;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class EditButton extends Sprite
{
	var lable 	:TextField;
	var icon 	:Bitmap;

	public function new() 
	{
		super();
		
		this.addLable();
		this.addIcon();
		
		this.buttonMode = true;
	}
	
	function addIcon()
	{
		var iconSize = 24;
		var plusIconData = Assets.getBitmapData("icons/plus.png");
		
		icon = new Bitmap(plusIconData, PixelSnapping.AUTO, true);
		icon.width = iconSize;
		icon.height = iconSize;
		
		icon.x = lable.width;
		icon.y = lable.height / 2 - iconSize / 2;
		
		addChild(icon);
	}
	
	function addLable() 
	{
		var lableText = "Редактировать";
		var lableFontSize = 21;
		var lableFontColor = 0x333333;
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.CENTER;
		var lablePosition = { x: 0, y: 0 };
		
		lable = new TextField();
		lable.defaultTextFormat = lableFormat;
		lable.text = lableText;
		lable.autoSize = TextFieldAutoSize.LEFT;
		lable.x = lablePosition.x;
		lable.y = lablePosition.y;
		lable.selectable = false;
		
		this.addChild(lable);
	}
	
}