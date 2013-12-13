package gameScene.layers
{
	import config.GamePath;
	
	import datacore.CityVo;
	import datacore.DataVo;
	
	import engine.core.TextureVo;
	import engine.display3D.Display3DContainer;
	import engine.load.LoadInfo;
	import engine.load.LoadManager;
	import engine.text.Text3Dynamic;
	import engine.text.TextFieldManager;
	import engine.textures.TextureManager;
	
	import flash.display.Bitmap;
	
	import view.City;

	public class SceneCityLayer extends SceneBaseLayer
	{
		private var _contaniner:Display3DContainer;
		
		public function SceneCityLayer()
		{
			_contaniner = new Display3DContainer();
			TextFieldManager.getInstance().init(_contaniner);
			//addCity();
		}
		
		public function addCity($dataVo:DataVo):void{
			
			var cityVec:Vector.<CityVo> = $dataVo.cityVec;
			
			for(var i:int;i<cityVec.length;i++){
				var city:City = new City;
				city.data = cityVec[i];
				city.add();
				/*
				var city:Text3Dynamic;
				city = TextFieldManager.getInstance().getText3Dynamic(128,128);
				city.x = cityVec[i].pos.x - 128/2;
				city.y = cityVec[i].pos.y - 100;
				
				city.data = cityVec[i];
				
				var loaderinfo : LoadInfo = new LoadInfo(
								GamePath.getCityConfig(getKey(cityVec[i]),cityVec[i].owner,cityVec[i].level),
								LoadInfo.BITMAP, onHeightImgLoad,10,city);
				
				LoadManager.getInstance().addSingleLoad(loaderinfo);
				*/
			}
			
		}
		
		public function getKey(cityVo:CityVo):String{
			var name:String = cityVo.name;
			
			if(cityVo.tower){
				return "tower";
			}
			if(cityVo.fast_armies){
				return "stable";
			}
			if(cityVo.fortification){
				return "castle";
			}
			if(cityVo.strong_armies){
				return "forge";
			}
			
			return "city";
		}
		
		private function onHeightImgLoad(bitmap:Bitmap,info:Object):void{
			info.bitmapdata = bitmap.bitmapData;
		}
		
		override public function update():void{
			_contaniner.update();
		}
		
	}
}