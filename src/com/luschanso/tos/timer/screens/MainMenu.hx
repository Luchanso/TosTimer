package com.luschanso.tos.timer.screens;

import com.luschanso.tos.timer.controls.MenuItem;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Luchanso
 */
class MainMenu extends Screen
{
	public function new()
	{
		super();
		
		this.screenName = "MainMenu";
		
		var beginSessionItem = new MenuItem("Начать сессию");
		
		var exportItem = new MenuItem("Экспорт");
		exportItem.y = beginSessionItem.realHeight;
		
		var instructionItem = new MenuItem("Инструкция");
		instructionItem.y = exportItem.y + exportItem.realHeight;
		
		this.addChild(beginSessionItem);
		this.addChild(exportItem);
		this.addChild(instructionItem);
		// 04e6ce81-8aeb-451d-81fc-cdeb1f49576e TODO: Связать элементы с переходами на другие экраны
	}
}