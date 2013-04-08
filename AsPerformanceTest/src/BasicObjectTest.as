package {
	import flash.system.System;
	import flash.utils.getTimer;

	public class BasicObjectTest {
		public function BasicObjectTest() {
		}
		
		private var testFunctions:Array = [testCreateClassObjects, testCreateObjectStringKeyObjects, testCreateObjectIntKeyObjects, 
			testCreateArrayObjects, testReadClassObjects, testReadObjectStringKeyObjects, testReadObjectIntKeyObjects, 
			testReadArrayObjects];
		
		private var testFunctionsString:Array = ["CreateClassObjects", "CreateObjectStringKeyObjects", "CreateObjectIntKeyObjects", 
			"CreateArrayObjects", "ReadClassObjects", "ReadObjectStringKeyObjects", "ReadObjectIntKeyObjects", 
			"ReadArrayObjects"];
		
		public function getMethodsDataProvider():Array {
			return testFunctionsString;
		}
		
		public function testCreateObjectArrayClass(methodIndex:int, dataSize:int):String {
			return testFunctions[methodIndex](dataSize);
		}
		
		//// test read objects
		private function testReadClassObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var a:Array = createClassObjects(n);
			var i:int;
			var total:int = 0;
			var t1:int = getTimer();
			for (i=0; i<n; ++i) {
				total += (a[i].min + a[i].max);
			}
			var t2:int = getTimer();
			results += ("class-n-time," + n + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function testReadObjectStringKeyObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var a:Array = createObjectStringKeyObjects(n);
			var i:int;
			var total:int = 0;
			var t1:int = getTimer();
			for (i=0; i<n; ++i) {
				total += (a[i].min + a[i].max);
			}
			var t2:int = getTimer();
			results += ("objcetStringKey-n-time," + n + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function testReadObjectIntKeyObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var a:Array = createObjectIntKeyObjects(n);
			var i:int;
			var total:int = 0;
			var t1:int = getTimer();
			for (i=0; i<n; ++i) {
				total += (a[i][0] + a[i][1]);
			}
			var t2:int = getTimer();
			results += ("objectIntKey-n-time," + n + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function testReadArrayObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var a:Array = createArrayObjects(n);
			var i:int;
			var total:int = 0;
			var t1:int = getTimer();
			for (i=0; i<n; ++i) {
				total += (a[i][0] + a[i][1]);
			}
			var t2:int = getTimer();
			results += ("array-n-time," + n + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		//// test create objects
		private function testCreateClassObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var t1:int = getTimer();
			m1 = System.totalMemory / unit;
			var a:Array = createClassObjects(n);
			m2 = System.totalMemory / unit;
			var t2:int = getTimer();
			results += ("class-n-begin-end-cost-time," + n + "," + m1 + "," + m2 + "," + (m2 - m1) + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function testCreateObjectStringKeyObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var t1:int = getTimer();
			m1 = System.totalMemory / unit;
			var a:Array = createObjectStringKeyObjects(n);
			m2 = System.totalMemory / unit;
			var t2:int = getTimer();
			results += ("objcetStringKey-n-begin-end-cost-time," + n + "," + m1 + "," + m2 + "," + (m2 - m1) + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function testCreateObjectIntKeyObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var t1:int = getTimer();
			m1 = System.totalMemory / unit;
			var a:Array = createObjectIntKeyObjects(n);
			m2 = System.totalMemory / unit;
			var t2:int = getTimer();
			results += ("objectIntKey-n-begin-end-cost-time," + n + "," + m1 + "," + m2 + "," + (m2 - m1) + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function testCreateArrayObjects(n:int):String {
			var m1:Number;
			var m2:Number;
			var unit:Number = 1024 * 1024;
			var results:String = "";
			var t1:int = getTimer();
			m1 = System.totalMemory / unit;
			var a:Array = createArrayObjects(n);
			m2 = System.totalMemory / unit;
			var t2:int = getTimer();
			results += ("array-n-begin-end-cost-time," + n + "," + m1 + "," + m2 + "," + (m2 - m1) + "," + (t2 - t1) + "\n");
			
			return results;
		}
		
		private function createClassObjects(n:int):Array {
			var a:Array = [];
			var o:BasicValue;
			for (var i:int=0; i<n; ++i) {
				o = new BasicValue(i, i);
				a.push(o);
			}
			
			return a;
		}
		
		private function createObjectStringKeyObjects(n:int):Array {
			var a:Array = [];
			var o:Object;
			for (var i:int=0; i<n; ++i) {
				o = {min:i, max:i};
				a.push(o);
			}
			
			return a;
		}
		
		private function createObjectIntKeyObjects(n:int):Array {
			var a:Array = [];
			var o:Object;
			for (var i:int=0; i<n; ++i) {
				o = new Object();
				o[0] = i;
				o[1] = i;
				a.push(o);
			}
			
			return a;
		}
		
		private function createArrayObjects(n:int):Array {
			var a:Array = [];
			var o:Array;
			for (var i:int=0; i<n; ++i) {
				o = [i, i];
				a.push(o);
			}
			
			return a;
		}
	}
}