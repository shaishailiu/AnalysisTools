package datacore
{
	import flash.geom.Point;
	/**
	 * 节点Vo数据 
	 * @author liuyanfei QQ:421537900
	 * 
	 */	
	public class NodeVo
	{
		public var edge:Array;
		public var layer:int;
		public var number:int;
		public var point:Point;
		public var radius:int;
		
		public var x:int;
		public var y:int;
		
		public function NodeVo(obj:Object)
		{
			edge = obj.edge;
			layer = obj.layer;
			number = obj.number;
			point = obj.point;
			radius = obj.radius;
			
			x = point.x;
			y = point.y;
		}
		
	}
}