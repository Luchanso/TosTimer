package com.luschanso.tos.timer.controls;

import format.SVG;
import openfl.Assets;
import openfl.display.Sprite;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class BackButton extends Sprite
{
	var leftArrow : SVG;

	public function new()
	{
		super();
		
		this.drawIcon();
		
		this.mouseEnabled = true;
		this.buttonMode = true;
	}
	
	function drawIcon()
	{
		var iconSize = 75;
		var leftArrowData = Assets.getText("icons/arrow-left.svg");
		leftArrow = new SVG(leftArrowData);
		
		//graphics.lineStyle(1, Settings.style.uiColor);
		//graphics.beginFill(Settings.style.uiColor);
		
		leftArrow.render(this.graphics, 0, 0, iconSize, iconSize);
		
		//graphics.endFill();
	}
}