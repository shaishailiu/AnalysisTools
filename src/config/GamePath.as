package config
{
	public class GamePath
	{
		public function GamePath()
		{
		}
		
		public static function getSceneBack($key:String):String{
			return "../../war/backs/" + $key + ".png";
		}
		
		public static function getSceneConfig($key:String):String{
			return "../../war/scripts/levels/" + $key + ".txt";
		}
		
		public static function getMcConfig($key:String):String{
			return "../../war/animation/" + $key + ".png";
		}
		
		public static function getCityConfig($key:String,$owner:int,$lev:int):String{
			return "../../war/cities/" + $key + "_p" + $owner + "_s4_l" + $lev + ".png";
		}
		
		public static function getHpConfig($key:int):String{
			return "../../war/newgui/population_" + $key + ".png";
		}
		
	}
}