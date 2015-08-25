package com.luschanso.tos.timer;

import com.luschanso.tos.timer.screens.MainMenu;
import com.luschanso.tos.timer.tests.MainTest;
import com.luschanso.tos.timer.screens.WorkScreen;
import haxe.unit.TestRunner;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
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
	var lastScreen 		:Screen;
	var currentScreen	:Screen;
	var screenList		:List<Screen>;
	var timerManager	:TimerManager;
	
	public function new() 
	{
		super();
		
		Settings.init();
		
		testRun();
		
		timerManager = TimerManager.instance;
		timerManager.loadFromStorage();
		
		addEventListener(Event.ADDED_TO_STAGE, initialization);
	}
	
	function testRun()
	{
		var testRunner = new TestRunner();
		testRunner.add(new MainTest());
		testRunner.run();
	}
	
	function initialization(e:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, initialization);
		
		this.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		
		this.fillScreenList();
		this.addScreenList();
	}
	
	function fillScreenList():Void
	{
		this.screenList = new List<Screen>();
		
		var mainMenu = new MainMenu();
		mainMenu.addEventListener(ScreenEvent.CALL_SCREEN_BY_NAME, changeScreen);
		mainMenu.setName("MainMenu");
		//mainMenu.show();
		
		var workScreen = new WorkScreen();
		workScreen.addEventListener(ScreenEvent.CALL_SCREEN_BY_NAME, changeScreen);
		workScreen.setName("WorkScreen");
		
		workScreen.show();
		currentScreen = workScreen;
		
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
		lastScreen = e.eventOwner;
		e.eventOwner.hide();
		
		for (screen in screenList) 
		{
			if (screen.screenName == e.calledScreenName) 
			{
				currentScreen = screen;
				screen.show();
				break;
			}
		}
	}

	function addVerticalCenterLine():Void
	{
		var halfWidthWindow = Settings.width / 2;
		var heightWindow 	= Settings.height;
		
		this.graphics.beginFill(0xF90006);
		this.graphics.drawRect(halfWidthWindow, 0, 2, heightWindow);
		this.graphics.endFill();
	}
	
	/**
	 * Back button realization
	 * @param	e
	 */
	function keyUp(e:KeyboardEvent):Void 
	{
		if (e.keyCode == 27) 
		{
			if (lastScreen != null)
			{				
				changeScreen(new ScreenEvent(ScreenEvent.CALL_SCREEN_BY_NAME, currentScreen, lastScreen.screenName));
			}
			else
			{				
				Sys.exit(0);
			}
			e.stopImmediatePropagation();
		}
	}
	
}
