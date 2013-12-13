package gameScene
{
	import datacore.DataAnalysis;
	import datacore.DataVo;
	
	import engine.core.Scene_data;
	
	import flash.display.Sprite;
	import flash.display3D.Context3D;
	import flash.display3D.Context3DBlendFactor;
	import flash.display3D.Context3DCompareMode;
	import flash.display3D.Context3DProgramType;
	import flash.events.Event;
	import flash.geom.Matrix3D;
	
	import gameScene.layers.SceneBackLayer;
	import gameScene.layers.SceneCityLayer;
	import gameScene.layers.SceneMcLayer;

	public class Scene2D extends Sprite
	{
		public static var scene2d:Scene2D;
		
		private var context3D:Context3D;
		/**
		 * 背景层 
		 */		
		private var _scneBackLayer:SceneBackLayer;
		/**
		 * 建筑层 
		 */		
		private var _sceneCity:SceneCityLayer;
		/**
		 * 角色动画层 
		 */		
		private var _sceneMcLyaer:SceneMcLayer;
		/**
		 * 场景数据 
		 */		
		private var _sceneData:DataVo;
		
		public var dataXML:XML;
		
		public function Scene2D()
		{
			context3D = Scene_data.context3D;
			
			_scneBackLayer = new SceneBackLayer();
			
			_sceneCity = new SceneCityLayer();
			
			_sceneMcLyaer = new SceneMcLayer();
			
			Scene_data.stage.addEventListener(Event.ENTER_FRAME,update);
		}
		/**
		 * 切换场景 
		 * @param $id 场景ID
		 * 
		 */		
		public function switchScene($id:int):void{
			_scneBackLayer.loadBack(dataXML.scene[$id].@map);
			
			DataAnalysis.getInstance().loadText(dataXML.scene[$id].@data,sceneDataLoad);
		}
		
		private function sceneDataLoad(datavo:DataVo):void{
			_sceneData = datavo;
			
			_sceneCity.addCity(_sceneData);
		}
		
		
		public function update(event:Event):void{
			context3D.clear(1,1,1,1);
			
			var ma:Matrix3D = new Matrix3D;
			
			context3D.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, ma, true);
			
			context3D.setDepthTest(false, Context3DCompareMode.LESS);
			context3D.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
			
			//_scneBackLayer.update();
			
			_sceneCity.update();
			
			_sceneMcLyaer.run();
			
			_sceneMcLyaer.update();
			
			context3D.present();
		}
		
		
		
	}
}