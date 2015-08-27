package com.luschanso.tos.timer.controls;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Loutchansky Oleg
 */
class ScrollContainer extends Sprite
{
	public var listContent(get, null):List<Sprite>;
	
	var _listContent		:List<Sprite>;
	var mouseDownPosition	:Point;
	var scrollPosition		:Float = 0;
	var summaryHight 		:Float = 0;
	
	static inline var distanceScrollEvent = 5;

	public function new() 
	{
		super();		
		
		_listContent = new List<Sprite>();
		
		/*
			
			this.addChild(new NewClass());
			this.graphics.beginFill(0xFF8000, 0.4);
			this.graphics.drawRect(0, 0, Settings.width, Settings.height - 150);

		*/
		
		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		addEventListener(MouseEvent.MOUSE_MOVE, mouseMove);
	}
	
	public function moveToScrollPosition() 
	{	
		var summ = 0.0;
		
		for (item in this._listContent) 
		{
			item.y = scrollPosition + summ;
			summ += item.height;
		}
	}
	
	// 8b7bdcf9-6a93-43a3-9fca-73207b0016c2 Реализовать скрол
	function mouseMove(e:MouseEvent):Void
	{
		if (e.buttonDown)
		{
			if (Math.abs(e.stageY - mouseDownPosition.y) > distanceScrollEvent)
			{
				scrollPosition = e.stageY - mouseDownPosition.y;
				moveToScrollPosition();
			}
		}
	}
	
	function mouseDown(e:MouseEvent):Void
	{
		mouseDownPosition = new Point(e.stageX, e.stageY);
	}
	
	function get_listContent():List<Sprite> 
	{
		return listContent;
	}
	
	public function addContent(sprite:Sprite)
	{	
		sprite.y = summaryHight + scrollPosition;
		
		this._listContent.push(sprite);
		this.addChild(sprite);
		
		summaryHight += sprite.height;
	}
	
	public function removeContent(item)
	{
		this._listContent.remove(item);
		this.removeChild(item);
	}
}