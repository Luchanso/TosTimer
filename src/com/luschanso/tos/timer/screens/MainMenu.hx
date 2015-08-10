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
		
		this.addChild(new MenuItem("Начать сессию"));
	}
}