package
{
	import datacore.CityVo;
	import datacore.DataAnalysis;
	import datacore.DataVo;
	import datacore.NodeVo;
	
	import ds.Heap;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import path.PathManager;
	
	import view.CityView;
	
	public class AnalysisTools extends Sprite
	{
		[Embed(source='assets/forest09.png')]
		private var pngCls:Class;
		
		[Embed(source = "assets/st1_forest01.txt",mimeType = "application/octet-stream")]
		//[Embed(source = "assets/st4_island06.txt",mimeType = "application/octet-stream")]
		private var txtCls:Class;
		
		private var sp:Sprite;
		private var shape:Shape;
		private var lineShape:Shape;
		
		private var scene:Scene;
		public function AnalysisTools()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			sp = new Sprite;
			this.addChild(sp);
			
			lineShape = new Shape;
			this.addChild(lineShape);
			
			shape = new Shape;
			this.addChild(shape);
			
			scene = new Scene()
			this.addChild(scene);
			
			var dataVo:DataVo = DataAnalysis.getInstance().getTxt(new txtCls());
			scene.initScene(dataVo);
			drawNode(dataVo.nodeVec);
			
			//addBtimap(); 
		}
		
		private function drawPath(ary:Array):void{
			for(var i:int;i<ary.length-1;i++){
				drawLine(ary[i].data.point,ary[i+1].data.point,0x0000ff);
			}
		}
		
		private function drawCity(cityAry:Vector.<CityVo>):void{
			shape.graphics.beginFill(0xff0000,1);
			for(var i:int;i<cityAry.length;i++){
				shape.graphics.drawCircle(cityAry[i].pos.x ,cityAry[i].pos.y,5);
			}
			shape.graphics.endFill();
		}
		
		private function drawNode(nodeAry:Vector.<NodeVo>):void{
			shape.graphics.beginFill(0x00ff00,1);
			for(var i:int;i<nodeAry.length;i++){
				shape.graphics.drawCircle(nodeAry[i].point.x ,nodeAry[i].point.y,nodeAry[i].radius * 0.2);
				
				for(var j:int=0;j<nodeAry[i].edge.length;j++){
					drawLine(nodeAry[i].point,nodeAry[nodeAry[i].edge[j]].point);
				}
			}
			shape.graphics.endFill();
		} 
		
		private function drawLine(a:Point,b:Point,color:uint = 0x00ff00):void{
			lineShape.graphics.lineStyle(1,color);
			lineShape.graphics.moveTo(a.x,a.y);
			lineShape.graphics.lineTo(b.x,b.y);
		}
		
	
		
		private function addBtimap():void{
			var bitmap:Bitmap = new pngCls();
			var sourceBitmapdata:BitmapData = bitmap.bitmapData;
			
			var wNum:int = (1024-768)/2;
			var bitmapdate:BitmapData = new BitmapData(1280,768,true,0);
			var rec:Rectangle = new Rectangle(0,wNum,1024,768);
			var p:Point = new Point(wNum,0)
			bitmapdate.copyPixels(sourceBitmapdata,rec,p);
			
			var tempBitmapdate:BitmapData = new BitmapData(768,wNum,true,0);
			tempBitmapdate.draw(sourceBitmapdata);
			var ma:Matrix = new Matrix;
			ma.rotate(-90/180*Math.PI);
			ma.translate(1024 + wNum,768);
			bitmapdate.draw(tempBitmapdate,ma);
			
			tempBitmapdate = new BitmapData(768,wNum,true,0);
			rec = new Rectangle(0,768 + wNum,768,wNum);
			tempBitmapdate.copyPixels(sourceBitmapdata,rec,new Point);
			ma.identity();
			ma.rotate(-90/180*Math.PI);
			ma.translate(0,768);
			bitmapdate.draw(tempBitmapdate,ma);
			
			
			sp.addChild(new Bitmap(bitmapdate));
		}
		
		
	}
}