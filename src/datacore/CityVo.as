package datacore
{
	import flash.geom.Point;
	/**
	 * 城市vo数据 
	 * @author liuyanfei QQ:421537900
	 * 
	 */	
	public class CityVo
	{
		public var name:String;
		public var pos:Point;
		public var start_population:int;
		public var level:int;
		public var owner:int;
		public var tower_range:Point;
		public var layer:int;
		public var count_node_number:int;
		public var tower:Boolean;
		public var fast_armies:Boolean;
		public var strong_armies:Boolean;
		public var fortification:Boolean;
		
		
		public function CityVo(obj:Object)
		{
			name = obj.name;
			pos = obj.pos;
			start_population = obj.start_population;
			level = obj.level;
			owner = obj.owner;
			tower_range = obj.tower_range;
			layer = obj.layer;
			count_node_number = obj.count_node_number;
			tower = obj.tower;
			fast_armies = obj.fast_armies;
			strong_armies = obj.strong_armies;
			fortification = obj.fortification;
		}
	}
}