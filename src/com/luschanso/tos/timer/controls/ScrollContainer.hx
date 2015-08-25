package com.luschanso.tos.timer.controls;

import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.geom.Point;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ScrollContainer extends Sprite
{
	public var listContent(get, null):List<Sprite>;
	
	var _listContent		:List<Sprite>;
	var mouseDownPosition	:Point;
	
	static inline var distanceScrollEvent = 5;

	public function new() 
	{
		super();
		
		_listContent = new List<Sprite>();
		
		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		addEventListener(MouseEvent.MOUSE_UP, mouseUp);
	}
	
	// 8b7bdcf9-6a93-43a3-9fca-73207b0016c2 Реализовать скрол
	private function mouseUp(e:MouseEvent):Void 
	{
		if (Math.abs(e.stageY - mouseDownPosition.y) > distanceScrollEvent) 
		{
			
		}
	}
	
	private function mouseDown(e:MouseEvent):Void 
	{
		mouseDownPosition = new Point(e.stageX, e.stageY);		
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