package com.luschanso.tos.timer.screens;

import com.luschanso.tos.timer.controls.BackButton;
import com.luschanso.tos.timer.controls.EditButton;
import com.luschanso.tos.timer.controls.TimeViewItem;
import com.luschanso.tos.timer.Screen;
import com.luschanso.tos.timer.ScreenEvent;
import openfl.events.MouseEvent;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Loutchasnky Oleg
 */
class WorkScreen extends Screen
{
	var backButton 		: BackButton;
	var editButton 		: EditButton;
	var mainViewTime   	: TextField;
	var summViewTime 	: TextField;
	var timerList 		: List<TimeViewItem>;
	
	// 4c9adfb8-5828-4cd7-b760-60643b9a4222 TODO: Реализовать класс WorkScreen
	public function new()
	{
		super();
		
		this.addHeader();
		this.addMainViewTime();
		this.addTimerList();
		this.addSummaryTimer();
	}
	
	function addHeader() 
	{
		addBackButton();
		addEditButton();
	}
	
	function addMainViewTime() 
	{
		var labelMarginTop = 50;
		var lableText = "00:00:00";
		var lableFontSize = 50;
		var lableFontColor = 0x333333;
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.LEFT;
		var lablePosition = { x: Settings.width / 2, y: labelMarginTop };
		
		mainViewTime = new TextField();
		mainViewTime.width = 0;
		mainViewTime.x = lablePosition.x;
		mainViewTime.y = lablePosition.y;
		mainViewTime.defaultTextFormat = lableFormat;
		mainViewTime.autoSize = TextFieldAutoSize.CENTER;
		mainViewTime.text = lableText;	
		mainViewTime.selectable = false;
		
		addChild(mainViewTime);
	}
	
	function addTimerList() 
	{
		timerList = new List<TimeViewItem>();
		this.loadTimers();
	}
	
	function loadTimers()
	{
		var timerManager = TimerManager.instance;
		
		for (workTimer in timerManager.timerList) 
		{
			var ui = new TimeViewItem(workTimer.name, workTimer.time);
			workTimer.UI = ui;
			timerList.add(ui);
		}
	}
	
	function addSummaryTimer() 
	{
		var labelMarginBottom = 10;
		var lableText = "t(общ.) = 00:00:00";
		var lableFontSize = 21;
		var lableFontColor = 0x333333;
		var lableFormat = new TextFormat(Settings.style.font, lableFontSize, lableFontColor);
		lableFormat.align = TextFormatAlign.LEFT;
		var lablePosition = { x: Settings.width / 2, y: Settings.height - labelMarginBottom };
		
		summViewTime = new TextField();
		summViewTime.defaultTextFormat = lableFormat;
		summViewTime.width = 0;		
		summViewTime.x = lablePosition.x;
		summViewTime.y = lablePosition.y - lableFontSize - labelMarginBottom;
		summViewTime.autoSize = TextFieldAutoSize.CENTER;
		summViewTime.text = lableText;
		summViewTime.selectable = false;
		
		addChild(summViewTime);
	}
	
	function addEditButton() 
	{
		var marginTopEditButton = 10;
		var marginRightEditButton = 10;
		
		editButton = new EditButton();
		editButton.y = marginTopEditButton;
		editButton.x = Settings.width - editButton.width - marginRightEditButton;
		editButton.addEventListener(MouseEvent.CLICK, editButton_click);
		
		addChild(editButton);
	}
	
	private function editButton_click(e:MouseEvent):Void 
	{
		dispatchEvent(new ScreenEvent(ScreenEvent.CALL_SCREEN_BY_NAME, this, "EditScreen"));
	}
	
	function addBackButton()
	{
		var marginLeftBackButton = 10;
		var marginTopBackButton = 12;
		
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