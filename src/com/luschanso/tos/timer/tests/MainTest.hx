package com.luschanso.tos.timer.tests;

import com.luschanso.tos.timer.TimerManager;
import com.luschanso.tos.timer.WorkTimer;
import haxe.unit.TestCase;
import sys.io.File;

/**
 * ...
 * @author Loutchansky Oleg
 */
class MainTest extends TestCase
{

	public function new() 
	{
		super();
		
	}
	
	public function testFileSys()
	{
		var testString = "Hello file system";
		var fileName = "test-data.txt";
		
		var fileOutput = File.write(fileName);
		fileOutput.writeString(testString);
		fileOutput.close();
		
		var fileContent = File.getContent(fileName);
		
		assertEquals(fileContent, testString);
	}
	
	public function testSerialization() 
	{
		var testVarName = "test";
		var testVarTime = 123.4;
		
		var workTimer = new WorkTimer(testVarName, testVarTime);
		var data = WorkTimer.serialize(workTimer);
		var workTimer2 = WorkTimer.unserialize(data);
		
		assertEquals(workTimer2.name, testVarName);
		assertEquals(workTimer2.time, testVarTime);
	}
	
	public function testTimerManager()
	{
		var timerManager = TimerManager.instance;
		timerManager.timerList.push(new WorkTimer("test1", 15));
		timerManager.timerList.push(new WorkTimer("test2", 30));
		
		timerManager.saveToStorage();
		
		timerManager.timerList = new List<WorkTimer>();
		timerManager.loadFromStorage();
		
		assertEquals(Lambda.count(timerManager.timerList), 2);
		
		assertEquals(Lambda.array(timerManager.timerList)[0].name, "test1");
		assertEquals(Lambda.array(timerManager.timerList)[0].time, 15);
		
		assertEquals(Lambda.array(timerManager.timerList)[1].name, "test2");
		assertEquals(Lambda.array(timerManager.timerList)[1].time, 30);
		
		timerManager.timerList = new List<WorkTimer>();
		var file = File.write("timers.bin");
		file.writeString("");
		file.close();
	}
	
}