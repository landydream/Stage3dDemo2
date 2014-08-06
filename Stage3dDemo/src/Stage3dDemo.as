package
{
	import Game.Stage3dGame;
	import Game.Stage3dGame2;
	
	import flash.display.Sprite;
	
	public class Stage3dDemo extends Sprite
	{
		private var stage3dGame:Stage3dGame;
		private var stage3dGame2:Stage3dGame2;
		public function Stage3dDemo()
		{
			stage3dGame = new Stage3dGame();
			this.addChild(stage3dGame);
		}
	}
}