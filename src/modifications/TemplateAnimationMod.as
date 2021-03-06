package modifications 
{
	import modifications.Mod;
	/**
	 * Class that holds the various timelines used to animate various elements on the master template/compositor to create an animation.
	 * This class is to be used as a base class.
	 * @author 
	 */
	public class TemplateAnimationMod extends Mod
	{
		protected var timelinesData:Vector.<Object>;
		protected var displayOrderList:String;
		protected var characterName:String;
		protected var animationName:String;
		
		public function TemplateAnimationMod() 
		{
			modType = Mod.MOD_TEMPLATEANIMATION; 
			timelinesData = new Vector.<Object>();
		}
		public function GetDataForTimelinesCreation():Vector.<Object>
		{
			return timelinesData;
		}
		
		public function GetCharacterName():String
		{
			return characterName;
		}
		
		public function GetAnimationName():String
		{
			return animationName;
		}
		
		public function GetDisplayOrderList():String
		{
			return displayOrderList;
		}
		
		public function Dispose():void
		{
			
		}
		
	}

}