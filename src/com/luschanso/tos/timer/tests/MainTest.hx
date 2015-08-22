package com.luschanso.tos.timer.tests;

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
	
}