package gameScene.layers
{
	import config.GamePath;
	
	import engine.core.Scene_data;
	import engine.display3D.Display3DBackImg;
	import engine.display3D.Display3DQuad;
	import engine.programs.Program3DManager;
	import engine.programs.shaders.QuadShader;
	import engine.programs.shaders.StatShader;
	import engine.textures.TextureManager;

	public class SceneBackLayer extends SceneBaseLayer
	{
		private var _bgImg:Display3DBackImg;
		public function SceneBackLayer()
		{
			addShaders();
			
			_bgImg = new Display3DBackImg(Scene_data.context3D);
		}
		
		private function addShaders():void{
			Program3DManager.getInstance().registe(QuadShader.QUAD_SHADER,QuadShader);
		}
			
		public function loadBack($sceneName:String):void{
			_bgImg.loadTexture(GamePath.getSceneBack($sceneName));
		}
		
		override public function update():void{
			_bgImg.update();
		}
		
		
		
	}
}