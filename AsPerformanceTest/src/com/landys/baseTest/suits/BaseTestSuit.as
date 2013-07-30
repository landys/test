package com.landys.baseTest.suits {
	import com.landys.baseTest.FuncGroupInfo;

	public class BaseTestSuit implements ITestSuit {
		protected var _funcGroup:FuncGroupInfo;
		
		public function BaseTestSuit() {
			_funcGroup = createFunGroup();
		}
		
		protected function createFunGroup():FuncGroupInfo {
			// do nothing, need to be overridden.
			return null;
		}
		
		public function getFunGroup():FuncGroupInfo {
			return _funcGroup;
		}
		
		public function getDefaultParaValues():Array {
			return [];
		}
	}
}