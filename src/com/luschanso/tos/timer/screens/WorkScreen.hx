package com.luschanso.tos.timer.screens;

import com.luschanso.tos.timer.controls.BackButton;
import com.luschanso.tos.timer.Screen;

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
		backButton = new BackButton();
		backButton.x = 0;
		backButton.y = 0;
		
		addChild(backButton);
	}
	
}