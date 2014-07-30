package
{
	import Game.Stage3dGame;
	
	import flash.display.Sprite;
	
	public class Stage3dDemo extends Sprite
	{
		private var stage3dGame:Stage3dGame;
		public function Stage3dDemo()
		{
			stage3dGame = new Stage3dGame();
			this.addChild(stage3dGame);
		}
	}
}