package
{
	import datacore.CityVo;
	import datacore.DataVo;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import path.PathManager;
	
	import view.CityView;
	
	public class Scene extends Sprite
	{
		private var _sceneData:DataVo;
		
		private var _cityViewVec:Vector.<CityView>;
		
		private var pathShape:Shape;
		public function Scene()
		{
			super();
		}
		public function initScene($data:DataVo):void{
			_sceneData = $data;
			
			PathManager.getInstance().initData($data.nodeVec);
			
			addCity();
			
			pathShape = new Shape;
			this.addChild(pathShape);
			
			this.addEventListener(MouseEvent.CLICK,onMouseClick);
		}
		
		private function addCity():void{
			
			_cityViewVec = new Vector.<CityView>;
			
			var cityVec:Vector.<CityVo> = _sceneData.cityVec;
			for(var i:int;i<cityVec.length;i++){
				var cityView:CityView = new CityView;
				cityView.initData(cityVec[i]);
				this.addChild(cityView);
				_cityViewVec.push(cityView);
			}
		}
		private var beginCity:CityView;
		protected function onMouseClick(event:MouseEvent):void
		{
			if(!beginCity){
				beginCity = event.target as CityView;
			}else{
				var endCity:CityView = event.target as CityView;
				
				var t:int = getTimer();
				var pathAry:Array = PathManager.getInstance().findPath(beginCity.data,endCity.data);
				trace("findPathTime: " + (getTimer() - t))
				
				drawPath(pathAry);
				
				beginCity = null;
			}
		}
		
		private function drawPath(ary:Array):void{
			pathShape.graphics.clear();
			
			for(var i:int;i<ary.length-1;i++){
				drawLine(ary[i].data.point,ary[i+1].data.point,0x0000ff);
			}
		}
		
		private function drawLine(a:Point,b:Point,color:uint = 0x00ff00):void{
			pathShape.graphics.lineStyle(1,color);
			pathShape.graphics.moveTo(a.x,a.y);
			pathShape.graphics.lineTo(b.x,b.y);
		}
		
	}
}