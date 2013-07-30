package com.landys.baseTest.suits {
	import com.landys.baseTest.FuncGroupInfo;
	import com.landys.baseTest.FuncInfo;
	
	import flash.utils.getTimer;

	public class ArrayDimensionTestSuit extends BaseTestSuit {
		public function ArrayDimensionTestSuit() {
			super();
		}

		/**
		 * Create function group for array dimention test. 
		 * @return 
		 * 
		 */
		protected override function createFunGroup():FuncGroupInfo {
			var nParas:int = 3;
			
			return new FuncGroupInfo("Array dimension tests", 
				[new FuncInfo("OneDimension", testOneDimension, nParas), 
					new FuncInfo("TwoDimension", testTwoDimension, nParas), 
					new FuncInfo("TwoDimension2", testTwoDimension2, nParas),
					new FuncInfo("TwoDimension3", testTwoDimension3, nParas),
					new FuncInfo("ThreeDimension1", testThreeDimension1, nParas),
					new FuncInfo("ThreeDimension2", testThreeDimension2, nParas)], 
				nParas);
		}
		
		public override function getDefaultParaValues():Array {
			return [100000, 20, 5];
		}
		
		private function testOneDimension(n1:int, n2:int, n3:int):String {
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
			results += ("CreateOneDimension," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n; ++i) {
				total += a[i];
			}
			t2 = getTimer();
			results += ("ReadOneDimension," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testTwoDimension(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int, j:int;
			var n23:int = n2 * n3;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			var vr:Array;
			for (i=0; i<n1; ++i) {
				a[i] = [];
				for (j=0; j<n23; ++j) {
					a[i][j] = ++v;
				}
			}
			var t2:int = getTimer();
			results += ("CreateTwoDimension," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n1; ++i) {
				vr = a[i];
				for (j=0; j<n23; ++j) {
					total += vr[j];
				}
			}
			t2 = getTimer();
			results += ("ReadTwoDimension," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testTwoDimension2(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int, j:int;
			var n12:int = n1 * n2;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			for (i=0; i<n12; ++i) {
				a[i] = [];
				for (j=0; j<n3; ++j) {
					a[i][j] = ++v;
				}
			}
			var t2:int = getTimer();
			results += ("CreateTwoDimension2," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n12; ++i) {
				for (j=0; j<n3; ++j) {
					total += a[i][j];
				}
			}
			t2 = getTimer();
			results += ("ReadTwoDimension2," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testTwoDimension3(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int, j:int;
			var n12:int = n1 * n2;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			for (i=0; i<n3; ++i) {
				a[i] = [];
				for (j=0; j<n12; ++j) {
					a[i][j] = ++v;
				}
			}
			var t2:int = getTimer();
			results += ("CreateTwoDimension3," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n3; ++i) {
				for (j=0; j<n12; ++j) {
					total += a[i][j];
				}
			}
			t2 = getTimer();
			results += ("ReadTwoDimension3," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testThreeDimension1(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int, j:int, k:int;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			for (i=0; i<n1; ++i) {
				a[i] = [];
				for (j=0; j<n2; ++j) {
					a[i][j] = [];
					for (k=0; k<n3; ++k) {
						a[i][j][k] = ++v;
					}
				}
			}
			var t2:int = getTimer();
			results += ("CreateThreeDimension1," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n1; ++i) {
				for (j=0; j<n2; ++j) {
					for (k=0; k<n3; ++k) {
						total += a[i][j][k];
					}
				}
			}
			t2 = getTimer();
			results += ("CreateThreeDimension1," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
		
		private function testThreeDimension2(n1:int, n2:int, n3:int):String {
			var results:String = "";
			var i:int, j:int, k:int;
			var t1:int = getTimer();
			var a:Array = [];
			var v:int = 0;
			for (i=0; i<n3; ++i) {
				a[i] = [];
				for (j=0; j<n1; ++j) {
					a[i][j] = [];
					for (k=0; k<n2; ++k) {
						a[i][j][k] = ++v;
					}
				}
			}
			var t2:int = getTimer();
			results += ("CreateThreeDimension2," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			
			t1 = getTimer();
			var total:Number = 0;
			for (i=0; i<n3; ++i) {
				for (j=0; j<n1; ++j) {
					for (k=0; k<n2; ++k) {
						total += a[i][j][k];
					}
				}
			}
			t2 = getTimer();
			results += ("CreateThreeDimension2," + n1 + "*" + n2 + "*" + n3 + "," + (t2 - t1) + "\n");
			trace(total);
			return results;
		}
	}
}