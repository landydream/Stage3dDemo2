package Game
{
	import com.adobe.utils.*;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.Stage3D;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3D;
	import flash.display3D.IndexBuffer3D;
	import flash.display3D.Program3D;
	import flash.display3D.VertexBuffer3D;
	import flash.display3D.textures.Texture;
	import flash.events.Event;
	import flash.geom.Matrix3D;
	import flash.geom.PerspectiveProjection;
	
	public class Stage3dGame extends Sprite
	{
		private const swfWidth:int = 640;
		private const swfHeight:int = 480;
		private const textureSize:int = 512;
		
		//舞台上的3D图形窗口
		private var context3D:Context3D;
		//用于渲染我们网格的着色器
		private var shaderProgram:Program3D;
		//网格用到的顶点
		private var vertexBuffer:VertexBuffer3D;
		//网格的顶点索引
		private var indexBuffer:IndexBuffer3D;
		//用于定义网格模型的数据
		private var meshVertexData:Vector.<Number>;
		//定义了每个顶点用到哪些数据的索引
		private var meshIndexData:Vector.<uint>;
		//影响模型位置和相机角度的矩阵
		private var projectionMaxtrix:PerspectiveMatrix3D = new PerspectiveMatrix3D();
		private var modelMatrix:Matrix3D = new Matrix3D();
		private var viewMatrix:Matrix3D = new Matrix3D();
		private var modelViewProjection:Matrix3D = new Matrix3D();
		
		//用于动画的帧计算器
		private var t:Number = 0;
		
		
		[Embed (source="bin/image/JumpyStar.png")]
		private var myTextureBitmap:Class;
		private var myTextureData:Bitmap = new myTextureBitmap();
		private var myTexture:Texture;
		
		public function Stage3dGame()
		{
			if(stage != null)
			{
				init();
			}
			else
			{
				this.addEventListener(Event.ADDED_TO_STAGE,init);
			}
		}
		
		
		private function init(e:Event = null):void
		{
			if(hasEventListener(Event.ADDED_TO_STAGE))
			{
				removeEventListener(Event.ADDED_TO_STAGE,init);
			}
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE,onContext3DCreate);
			stage.stage3Ds[0].requestContext3D();
		}
		
		private function onContext3DCreate(e:Event):void
		{
			this.removeEventListener(Event.ENTER_FRAME,enterFrame);
			//获取当前环境
			var t:Stage3D = e.target as Stage3D;
			context3D = t.context3D;
			
			if(context3D == null)
			{
				throw new Error("目前没有3D环境可用");
				return;
			}
			//设置错误检查,让flash抛出3D异常
			context3D.enableErrorChecking = true;
			initData();
			
			//3D后备缓冲区的像素尺寸
			context3D.configureBackBuffer(swfWidth,swfHeight,0,true);
			
			
			
			
		}
		
		private function initData():void
		{
			//为多边形定义他们各自使用的顶点
			//在这个实例中,正方形是由两个三角形组成的
			meshIndexData = Vector.<uint>
			([
				0,1,2, 0,2,3
			]);
			
			//4个顶点所使用的原始数据
			//位置x,y,z,纹理坐标u,v,法线x,y,z
			meshVertexData = Vector.<Number>
			([
				//x   y   z   u   v   nx  ny  nz
				 -1, -1,  1,  0,  0,  0,  0,  1,
				  1, -1,  1,  1,  0,  0,  0,  1,
				  1,  1,  1,  1,  1,  0,  0,  1,
				 -1,  1,  1,  0,  1,  0,  0,  1
			]);	
			
			
			
		}
		
		
		
		
		
		
		
		
		
	}
}