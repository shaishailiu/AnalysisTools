package view
{
	import config.GamePath;
	
	import datacore.CityVo;
	
	import engine.core.Scene_data;
	import engine.load.LoadInfo;
	import engine.load.LoadManager;
	import engine.text.Text3Dynamic;
	import engine.text.TextFieldManager;
	
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class City
	{
		private var _data:CityVo;
		
		public var imgView:Text3Dynamic;
		
		public var hpView:Text3Dynamic;
		
		public var txt:TextField;
		
		public function City()
		{
			initTxt();
		}
		
		private function initTxt():void{
			txt = new TextField;
			txt.width = 48;
			txt.height = 15;
			txt.selectable = false;
		}
		
		public function add():void{
			imgView.add();
			hpView.add();
			
			Scene_data.stage.addChild(txt);
		}
		
		public function remove():void{
			
		}

		public function get data():CityVo
		{
			return _data;
		}

		public function set data(value:CityVo):void
		{
			_data = value;
			
			
			imgView = TextFieldManager.getInstance().getText3Dynamic(128,128);
			imgView.x = _data.pos.x - 128/2;
			imgView.y = _data.pos.y - 100;
			
			
			var loaderinfo : LoadInfo = new LoadInfo(
				GamePath.getCityConfig(getKey(_data),_data.owner,_data.level),
				LoadInfo.BITMAP, onHeightImgLoad,10,imgView);
			
			LoadManager.getInstance().addSingleLoad(loaderinfo);
			
			hpView = TextFieldManager.getInstance().getText3Dynamic(48,12);
			hpView.x = _data.pos.x - 48/2;
			hpView.y = _data.pos.y + 15;
			
			loaderinfo = new LoadInfo(
				GamePath.getHpConfig(_data.owner),
				LoadInfo.BITMAP, onHeightImgLoad,10,hpView);
			
			LoadManager.getInstance().addSingleLoad(loaderinfo);
			
			txt.x = _data.pos.x - 48/2;
			txt.y = _data.pos.y + 12;
			
			txt.htmlText = "<p align='center'><font color='#ffffff' size='10'>" + _data.start_population + "/" + _data.start_population + "</font></p>"
			
		}
		
		
		private function onHeightImgLoad(bitmap:Bitmap,info:Object):void{
			info.bitmapdata = bitmap.bitmapData;
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

		
	}
}