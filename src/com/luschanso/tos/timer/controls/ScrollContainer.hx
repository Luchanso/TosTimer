package com.luschanso.tos.timer.controls;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ScrollContainer extends Sprite
{
	var _listContent:List<Sprite>;
	
	var listContent(get, null):List<Sprite>;

	public function new() 
	{
		super();
		
		_listContent = new List<Sprite>();
		
		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
	}
	
	private function mouseDown(e:MouseEvent):Void 
	{
		trace("test: " + e.localX + "x" + e.localY);
	}
	
	function get_listContent():List<Sprite> 
	{
		return listContent;
	}
	
	public function addContent(sprite:Sprite)
	{
		this._listContent.push(sprite);
		this.addChild(sprite);
	}
	
	public function removeContent(item)
	{
		this._listContent.remove(item);
		this.removeChild(item);
	}
}