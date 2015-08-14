package com.luschanso.tos.timer.screens;

import com.luschanso.tos.timer.controls.MenuItem;
import com.luschanso.tos.timer.ScreenEvent;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Luchanso
 */
class MainMenu extends Screen
{
	public function new()
	{
		super();
		
		var beginSessionItem = new MenuItem("Начать сессию");
		beginSessionItem.addEventListener(MouseEvent.CLICK, beginSessionItem_click);
		
		var exportItem = new MenuItem("Экспорт");
		exportItem.addEventListener(MouseEvent.CLICK, exportItem_click);
		exportItem.y = beginSessionItem.realHeight + 1;
		
		var instructionItem = new MenuItem("Инструкция");
		instructionItem.addEventListener(MouseEvent.CLICK, instructionItem_click);
		instructionItem.y = exportItem.y + exportItem.realHeight + 1;
		
		this.addChild(beginSessionItem);
		this.addChild(exportItem);
		this.addChild(instructionItem);		
	}
	
	// c2294e1d-65ed-46ba-b4ee-c473ca57a73c TODO: Прописать правильные линки
	private function instructionItem_click(e:MouseEvent):Void
	{
		this.dispatchEvent(new ScreenEvent(ScreenEvent.CALL_SCREEN_BY_NAME, this, ""));
	}
	
	private function exportItem_click(e:MouseEvent):Void
	{
		this.dispatchEvent(new ScreenEvent(ScreenEvent.CALL_SCREEN_BY_NAME, this, ""));
	}
	
	private function beginSessionItem_click(e:MouseEvent):Void
	{
		this.dispatchEvent(new ScreenEvent(ScreenEvent.CALL_SCREEN_BY_NAME, this, "WorkScreen"));
	}
}