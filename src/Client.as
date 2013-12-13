package
{
	import engine.Engine2D;
	import engine.core.Scene_data;
	import engine.load.LoadInfo;
	import engine.load.LoadManager;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3D;
	
	import gameScene.Scene2D;
	
	public class Client extends Sprite
	{
		public function Client()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Engine2D.initEngine(stage,onComplete);
		}
		
		private function onComplete():void
		{
			
			Scene2D.scene2d = new Scene2D;
			
			//Scene2D.scene2d.switchScene("forest_01");
			
			this.addChild(Scene2D.scene2d);
			
			var loaderinfo : LoadInfo = new LoadInfo("assets/config.xml", LoadInfo.XML, onConfigLoad,10);
			LoadManager.getInstance().addSingleLoad(loaderinfo);
		}
		
		private function onConfigLoad(str:String):void{
			var xml:XML = XML(str);
			//trace(xml.scene[0].@data)
			Scene2D.scene2d.dataXML = xml;
			
			Scene2D.scene2d.switchScene(0);
		}
		
	}
}