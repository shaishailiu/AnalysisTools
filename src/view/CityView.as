package view
{
	import datacore.CityVo;
	
	import flash.display.Sprite;
	
	public class CityView extends Sprite
	{
		public var data:CityVo;
		public function CityView()
		{
			super();
		}
		
		public function initData($data:CityVo):void{
			this.data = $data;
			drawBack();
			this.x = data.pos.x;
			this.y = data.pos.y;
		}
		
		private function drawBack():void{
			var color:uint;
			if(data.owner == 1){
				color = 0xff0000;
			}else if(data.owner == 2){
				color = 0x0000ff;
			}else if(data.owner == 0){
				color = 0x868585;
			}
			
			this.graphics.beginFill(color,1);
			this.graphics.drawCircle(0,0,10);
			this.graphics.endFill();
		}
		
	}
}