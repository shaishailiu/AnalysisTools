package gameScene.layers
{
	import config.GamePath;
	
	import datacore.CityVo;
	import datacore.DataVo;
	
	import engine.core.Scene_data;
	import engine.core.TextureVo;
	import engine.display3D.Display3DContainer;
	import engine.load.LoadInfo;
	import engine.load.LoadManager;
	import engine.mc.Display3DMovieClip;
	import engine.mc.Display3DMovieClipShader;
	import engine.mc.MovieClip3D;
	import engine.mc.MovieClipManager;
	import engine.programs.Program3DManager;
	import engine.text.Text3Dynamic;
	import engine.text.TextFieldManager;
	import engine.textures.TextureManager;
	
	import flash.display.Bitmap;
	import flash.utils.getTimer;

	public class SceneMcLayer extends SceneBaseLayer
	{
		private var _contaniner:Display3DContainer;
		
		private var _mcVec:Vector.<Display3DMovieClip>;
		
		private var _time:int;
		
		public function SceneMcLayer()
		{
			addShaders();
			
			_contaniner = new Display3DContainer();
			
			_mcVec = new Vector.<Display3DMovieClip>;
			
			MovieClipManager.getInstance().init(_contaniner);
			
			addMc();
		}
		
		private function addShaders():void{
			Program3DManager.getInstance().registe(Display3DMovieClipShader.DISPLAY3D_MOVIECLIP_SHADER,Display3DMovieClipShader);
		}
		
		
		private function addMc():void{
			var movie:MovieClip3D = MovieClipManager.getInstance().getMc(GamePath.getMcConfig("unit2_walk"),32,32,128);
			movie.x = 200;
			movie.y = 200;
			movie.add();
			
			movie = MovieClipManager.getInstance().getMc(GamePath.getMcConfig("unit2_walk"),32,32,128);
			movie.x = 100;
			movie.y = 100;
			movie.add();
			
			
			
		}
		
		public function run():void{
			var t:uint = getTimer();
			var timeOut:int = t - _time;
			for(var i:int;i<_contaniner.childrenList.length;i++){
				Display3DMovieClip(_contaniner.childrenList[i]).updateFrame(timeOut);
			}
			_time = t;
		}
		
		override public function update():void{
			_contaniner.update();
		}
		
	}
}