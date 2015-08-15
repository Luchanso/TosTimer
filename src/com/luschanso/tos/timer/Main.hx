package com.luschanso.tos.timer;

import com.luschanso.tos.timer.screens.MainMenu;
import com.luschanso.tos.timer.screens.WorkScreen;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * Enter point
 * @author Luchanso
 */
class Main extends Sprite 
{
	var screenList:List<Screen>;
	
	public function new() 
	{
		super();
		
		addEventListener(Event.ADDED_TO_STAGE, initialization);
	}
	
	function initialization(e:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, initialization);
		
		this.fillScreenList();
		this.addScreenList();
	}
	
	function fillScreenList():Void
	{
		this.screenList = new List<Screen>();
		
		var mainMenu = new MainMenu();
		mainMenu.addEventListener(ScreenEvent.CALL_SCREEN_BY_NAME, changeScreen);
		mainMenu.setName("MainMenu");
		mainMenu.show();
		
		var workScreen = new WorkScreen();
		workScreen.addEventListener(ScreenEvent.CALL_SCREEN_BY_NAME, changeScreen);
		workScreen.setName("WorkScreen");
		
		this.screenList.add(mainMenu);
		this.screenList.add(workScreen);
		
		// 41253e87-9c82-4499-a504-a0f58ce803fe TODO: Добавить все экраны
		/*
		 * EditScreen
		 * ExportScreen
		 * Instruction
		 */
	}
	
	function addScreenList()
	{
		for (screen in screenList) 
		{
			this.addChild(screen);			
		}
	}
	
	function changeScreen(e:ScreenEvent):Void
	{
		e.eventOwner.hide();
		
		for (screen in screenList) 
		{
			if (screen.screenName == e.calledScreenName) 
			{
				screen.show();
				break;
			}
		}
	}

	function addVerticalCenterLine():Void
	{
		var halfWidthWindow = Lib.application.window.width / 2;
		var heightWindow 	= Lib.application.window.height;
		
		this.graphics.beginFill(0xF90006);
		this.graphics.drawRect(halfWidthWindow, 0, 2, heightWindow);
		this.graphics.endFill();
	}
	
}
