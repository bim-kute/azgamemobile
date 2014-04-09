package view.window.shop 
{
	import control.ConstTlmn;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import view.userInfo.avatar.Avatar;
	
	/**
	 * ...
	 * @author bimkute
	 */
	public class ContentItemGold extends MovieClip 
	{
		private var content:MovieClip;
		public var _idAvt:String;
		public var _goldAvt:String;
		public var _chipAvt:String;
		public function ContentItemGold() 
		{
			super();
			content = new ContentGoldMc();
			addChild(content);
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			
		}
		
		private function onAddToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			
			
			
			content.buyAvatarBtn.addEventListener(MouseEvent.MOUSE_UP, onBuyAvatar);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		private function onRemoveFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			
			content.buyAvatarBtn.removeEventListener(MouseEvent.MOUSE_UP, onBuyAvatar);
			
		}
		
		private function onBuyAvatar(e:MouseEvent):void 
		{
			dispatchEvent(new Event(ConstTlmn.BUY_ITEM));
		}
		
		public function addInfo(idAvt:String, nameAvt:String, chip:String, gold:String, linkAvt:String, expire:String):void 
		{
			_idAvt = idAvt;
			_goldAvt = gold;
			_chipAvt = chip;
			
			content.itemNameTxt.text = nameAvt;
			content.itemGoldTxt.text = gold;
			content.itemChipTxt.text = chip;
			
			var image:Avatar = new Avatar();
			content.containerImg.addChild(image);
			image.addImg(linkAvt);
			
		}
	}

}