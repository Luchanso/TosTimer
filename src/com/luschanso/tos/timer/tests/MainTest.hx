package com.luschanso.tos.timer.tests;

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
	
}