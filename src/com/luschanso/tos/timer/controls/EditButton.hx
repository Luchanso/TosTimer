package com.luschanso.tos.timer.controls;
import format.SVG;
import openfl.Assets;
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
	var icon 	:SVG;

	public function new() 
	{
		super();
		
		this.addLable();
		this.addIcon();
		
		this.buttonMode = true;
	}
	
	function addIcon() 
	{
		var iconSize = 50;
		var plusIconData = Assets.getText("icons/plus.svg");
		
		icon = new SVG(plusIconData);
		icon.render(graphics, lable.width, 0, iconSize, iconSize);
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