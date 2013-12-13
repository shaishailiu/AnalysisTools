package path
{
	import datacore.CityVo;
	import datacore.NodeVo;
	
	import ds.Graph;
	import ds.GraphNode;
	
	import examples.Astar.Astar;
	import examples.Astar.AstarNode;
	
	import flash.geom.Point;

	public class PathManager
	{
		private static var _instance:PathManager;
		
		private var _graph:Graph;
		
		public function PathManager()
		{
		}
		public static function getInstance():PathManager{
			if(!_instance){
				_instance = new PathManager;
			}
			return _instance;
		}
		
		public function initData(nodeVec:Vector.<NodeVo>):void{
			_graph = new Graph;
			
			for(var i:int=0;i<nodeVec.length;i++){
				var node:AstarNode = new AstarNode(nodeVec[i]);
				_graph.addNode(node,i);
			}
			
			for(i=0;i<nodeVec.length;i++){
				for(var j:int=0;j<nodeVec[i].edge.length;j++){
					var weight:Number = Point.distance(nodeVec[i].point,nodeVec[nodeVec[i].edge[j]].point);
					_graph.addArc(i,nodeVec[i].edge[j],weight);
				}
			}
			
		}
		
		public function findPath(start:CityVo,end:CityVo):Array{
			return Astar.find(_graph,start.count_node_number,end.count_node_number);
		}
		
		
		
	}
}