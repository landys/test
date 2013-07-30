package com.landys.baseTest {
	import com.landys.baseTest.suits.ArrayDimensionTestSuit;
	import com.landys.baseTest.suits.BaseObjectTestSuit;
	import com.landys.baseTest.suits.ITestSuit;

	public class MainEntry {
		
		/**
		 * Array of different test suits. 
		 */
		private var _testSuits:Array = [new BaseObjectTestSuit(), new ArrayDimensionTestSuit()];

		public function MainEntry() {
		}
		
		/**
		 * Data provider for the "Test Method Groups" combo box.
		 * @return 
		 * 
		 */
		public function getMethodGroupsDataProvider():Array {
			var methodGroups:Array = [];
			for each (var testSuit:ITestSuit in _testSuits) {
				var funcGroup:FuncGroupInfo = testSuit.getFunGroup();
				methodGroups.push(funcGroup.name);
			}
			return methodGroups;
		}
		
		/**
		 * Data provider for the "Test Methods" combo box.
		 * @return 
		 * 
		 */
		public function getMethodsDataProvider(groupIndex:int):Array {
			if (groupIndex >= _testSuits.length) return [];
			
			var methods:Array = [];
			var funcGroup:FuncGroupInfo = getFunGroup(groupIndex);
			var funcs:Array = funcGroup.funcs;
			for each (var func:FuncInfo in funcs) {
				methods.push(func.name);
			}
			
			return methods;
		}
		
		/**
		 * 
		 * @param groupIndex
		 * @return 
		 * 
		 */
		public function getDefaultParaValues(groupIndex:int):Array {
			var testSuit:ITestSuit = _testSuits[groupIndex];
			
			return testSuit.getDefaultParaValues();
		}
		
		private function getFunGroup(groupIndex:int):FuncGroupInfo {
			return _testSuits[groupIndex].getFunGroup();
		}

		public function runTest(groupIndex:int, methodIndex:int, paras:Array):String {
			var funcGroup:FuncGroupInfo = getFunGroup(groupIndex);
			var func:FuncInfo = funcGroup.funcs[methodIndex];
			
			func.run(paras);
			
			return String(func.result);
		}
	}
}