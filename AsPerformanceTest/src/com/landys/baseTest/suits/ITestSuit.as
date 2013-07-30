package com.landys.baseTest.suits {
	import com.landys.baseTest.FuncGroupInfo;

	/**
	 *  
	 * @author landys
	 * 
	 */
	public interface ITestSuit {
		function getFunGroup():FuncGroupInfo;
		function getDefaultParaValues():Array;
	}
}