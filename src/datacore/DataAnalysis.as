package datacore
{
	import config.GamePath;
	
	import engine.load.LoadInfo;
	import engine.load.LoadManager;
	
	import flash.geom.Point;

	public class DataAnalysis
	{
		private static var _instance:DataAnalysis;
		
		
		private var playerAry:Array;
		private var PLYAER_KEY:String = "@player";
		
		private var cityAry:Array;
		private var CITY_KEY:String = "@city";
		
		private var nodeAry:Array;
		private var NODE_KEY:String = "@path_count_node";
		
		private var flag:String;
		
		private var _fun:Function;
		
		public function DataAnalysis()
		{
		}
		
		public static function getInstance():DataAnalysis{
			if(!_instance){
				_instance = new DataAnalysis;
			}
			return _instance;
		}
		
		public function loadText($key:String,fun:Function):void{
			_fun = fun;
			var loaderinfo : LoadInfo = new LoadInfo(GamePath.getSceneConfig($key), LoadInfo.XML, onTxtLoad,10);
			LoadManager.getInstance().addSingleLoad(loaderinfo);
		}
		
		private function onTxtLoad(str:String):void{
			var vo:DataVo = getTxt(str);
			
			_fun(vo);
		}
		
		public function getTxt(str:String):DataVo{
			playerAry = new Array;
			cityAry = new Array;
			nodeAry = new Array;
			//var str:String = new txtCls();
			var ary:Array = str.split("\r\n\t");
			trace(ary)
			
			for(var i:int;i<ary.length;i++){
				if(String(ary[i]).indexOf("@") != -1){
					if(ary[i] == PLYAER_KEY){
						playerAry.push(new Object);
					}else if(ary[i] == CITY_KEY){
						cityAry.push(new Object);
					}else if(ary[i] == NODE_KEY){
						nodeAry.push(new Object);
					}
					flag= ary[i];
					continue;
				}
				
				
				if(String(ary[i]).indexOf("{") != -1 || String(ary[i]).indexOf("}") != -1){
					continue;
				}
				
				if(flag == PLYAER_KEY){
					addAttribute(playerAry[playerAry.length-1],String(ary[i]));
				}else if(flag == CITY_KEY){
					addAttribute(cityAry[cityAry.length-1],String(ary[i]));
				}else if(flag == NODE_KEY){
					addAttribute(nodeAry[nodeAry.length-1],String(ary[i]));
				}
			}
			
			//trace(playerAry.length)
			//drawCity();
			//drawNode();
			
			var nodeVec:Vector.<NodeVo> = new Vector.<NodeVo>;
			for(i=0;i<nodeAry.length;i++){
				var nodeVo:NodeVo = new NodeVo(nodeAry[i]);
				nodeVec.push(nodeVo);
			}
			
			var cityVec:Vector.<CityVo> = new Vector.<CityVo>;
			for(i=0;i<cityAry.length;i++){
				var cityVo:CityVo = new CityVo(cityAry[i]);
				cityVec.push(cityVo);
			}
			
			var dataVo:DataVo = new DataVo;
			dataVo.cityVec = cityVec;
			dataVo.nodeVec = nodeVec;
			dataVo.playerAry = playerAry;
			
			return dataVo;
		}
		
		private function addAttribute(obj:Object,str:String):void{
			str = str.slice(2,-1);
			var ary:Array = str.split(" ");
			
			if(ary[1] == "edge"){
				if(!obj.hasOwnProperty("edge")){
					obj["edge"] = new Array;
				}
				obj["edge"].push(int(ary[2]));
				return;
			}
			
			if(ary[0] == "float"){
				obj[String(ary[1])] = Number(ary[2]);
			}else if(ary[0] == "int"){
				obj[String(ary[1])] = int(ary[2]);
			}else if(ary[0] == "string"){
				obj[String(ary[1])] = String(ary[2]);
			}else if(ary[0] == "point"){
				obj[String(ary[1])] = new Point(Number(String(ary[2]).slice(0,-1)) + 1280/2 ,-Number(ary[3])+ 768/2);
			}else if(ary[0] == "bool"){
				obj[String(ary[1])] = String(ary[2]) == "true" ? true : false;
			}else{
				trace("未知参数");
			}
			
			
		}
		
		
		
	}
}