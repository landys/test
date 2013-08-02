package com.landys.baseTest.suits {
	import com.landys.baseTest.FuncGroupInfo;
	import com.landys.baseTest.FuncInfo;
	
	import flash.utils.getTimer;
	
	public class ArrayVsVectorTestSuit extends BaseTestSuit {
		public function ArrayVsVectorTestSuit() {
			super();
		}
		
		/**
		 * Create function group for array dimention test. 
		 * @return 
		 * 
		 */
		protected override function createFunGroup():FuncGroupInfo {
			var nParas:int = 3;
			
			return new FuncGroupInfo("Array VS Vector tests", 
				[new FuncInfo("IntArray", testIntArray, nParas), 
					new FuncInfo("ClassArray", testClassArray, nParas),
					new FuncInfo("IntVector", testIntVector, nParas),  
					new FuncInfo("ClassVector", testClassVector, nParas)], 
				nParas);
		}
		
		public override function getDefaultParaValues():Array {
			return [1000000, 1, 1];
		}
		
		private function testIntArray(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int;
			var n:int = n1 * n2 * n3;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			for (i=0; i<n; ++i) {
				a[i] = ++v;
			}
			var t2:int = getTimer();
			results += ("CreateIntArray," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n; ++i) {
				total += a[i];
			}
			t2 = getTimer();
			results += ("ReadIntArray," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testIntVector(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int;
			var n:int = n1 * n2 * n3;
			var t1:int = getTimer();
			var a:Vector.<int> = new Vector.<int>();
			var v:int = 0;
			for (i=0; i<n; ++i) {
				a.push(++v);
			}
			var t2:int = getTimer();
			results += ("CreateIntVector," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n; ++i) {
				total += a[i];
			}
			t2 = getTimer();
			results += ("ReadIntVector," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testClassArray(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int;
			var n:int = n1 * n2 * n3;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			for (i=0; i<n; ++i) {
				++v;
				a[i] = new BasicValue(v, v);
			}
			var t2:int = getTimer();
			results += ("CreateClassArray," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n; ++i) {
				total += (a[i].min + a[i].max);
			}
			t2 = getTimer();
			results += ("ReadClassArray," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testClassVector(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int;
			var n:int = n1 * n2 * n3;
			var t1:int = getTimer();
			var a:Vector.<BasicValue> = new Vector.<BasicValue>();
			var v:int = 0;
			for (i=0; i<n; ++i) {
				++v;
				a.push(new BasicValue(v, v));
			}
			var t2:int = getTimer();
			results += ("CreateClassVector," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n; ++i) {
				total += (a[i].min + a[i].max);
			}
			t2 = getTimer();
			results += ("ReadClassVector," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
	}
}