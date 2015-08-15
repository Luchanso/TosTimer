package com.luschanso.tos.timer.controls;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.PixelSnapping;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class BackButton extends Sprite
{
	var leftArrow : Bitmap;

	public function new()
	{
		super();
		
		this.drawIcon();
		
		this.mouseEnabled = true;
		this.buttonMode = true;
	}
	
	function drawIcon()
	{
		var iconSize = 24;
		var leftArrowData = Assets.getBitmapData("icons/arrow-left.png");
		leftArrow = new Bitmap(leftArrowData, PixelSnapping.AUTO, true);
		leftArrow.width = iconSize;
		leftArrow.height = iconSize;
		
		addChild(leftArrow);
	}
}