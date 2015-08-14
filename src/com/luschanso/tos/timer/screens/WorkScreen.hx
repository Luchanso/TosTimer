package com.luschanso.tos.timer.screens;

import com.luschanso.tos.timer.controls.BackButton;
import com.luschanso.tos.timer.Screen;
import com.luschanso.tos.timer.ScreenEvent;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class WorkScreen extends Screen
{
	var backButton : BackButton;
	
	// 4c9adfb8-5828-4cd7-b760-60643b9a4222 TODO: Реализовать класс WorkScreen
	public function new() 
	{
		super();
		
		this.addHeader();
	}
	
	function addHeader() 
	{
		addBackButton();
	}
	
	function addBackButton()
	{
		var marginLeftBackButton = 10;
		var marginTopBackButton = 10;
		
		backButton = new BackButton();
		backButton.x = marginLeftBackButton;
		backButton.y = marginTopBackButton;
		backButton.addEventListener(MouseEvent.CLICK, backButton_click);
		
		addChild(backButton);
	}
	
	function backButton_click(e:MouseEvent):Void 
	{
		dispatchEvent(new ScreenEvent(ScreenEvent.CALL_SCREEN_BY_NAME, this, "MainMenu"));
	}
	
}