package com.landys.baseTest {
	public class FuncInfo {
		public var name:String;
		public var func:Function;
		public var nParas:int;
		
		public var result:Object;
		
		public function FuncInfo(iName:String, iFun:Function, iNParas:int) {
			name = iName;
			func = iFun;
			nParas = iNParas;
			result = null;
		}
		
		/**
		 * The result of the method will be saved into the "result" object.
		 * 
		 */
		public function run(paras:Array):void {
			if (paras == null || paras.length < nParas) {
				result = null;
				return;
			}
			
			if (nParas == 0) {
				result = func();
			}
			if (nParas == 1) {
				result = func(paras[0]);
			}
			else if (nParas == 2) {
				result = func(paras[0], paras[1]);
			}
			else if (nParas == 3) {
				result = func(paras[0], paras[1], paras[2]);
			}
			else {
				result = func(paras);
			}
		}
	}
}