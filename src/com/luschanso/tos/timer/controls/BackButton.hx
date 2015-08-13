package com.luschanso.tos.timer.controls;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class BackButton extends Sprite
{
	var leftArrow : Bitmap;

	// 4de88c1d-1dce-42c2-a22e-9bfb974ca764 Реализовать BackButton
	public function new() 
	{
		super();
		
		var leftArrowBitmapData = Assets.getBitmapData("icons/left-arrow.svg");
		leftArrow = new Bitmap(leftArrowBitmapData);
		
		addChild(leftArrow);
		
		this.mouseEnabled = true;
		this.buttonMode = true;
	}
	
}