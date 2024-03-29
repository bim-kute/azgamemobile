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
	public class ContentMyItemNormal extends MovieClip 
	{
		private var content:MovieClip;
		public var _idAvt:String;
		public var _idListAvt:String;
		
		public function ContentMyItemNormal() 
		{
			
			content = new ContentMyItemNormalMc();
			addChild(content);
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			
		}
		
		private function onAddToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			
			
			content.useItemVisibleMc.visible = false;
			content.useItemMc.addEventListener(MouseEvent.MOUSE_UP, onUseAvatar);
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		private function onRemoveFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			
			content.useItemMc.removeEventListener(MouseEvent.MOUSE_UP, onUseAvatar);
			
		}
		
		private function onUseAvatar(e:MouseEvent):void 
		{
			dispatchEvent(new Event(ConstTlmn.USE_AVATAR));
		}
		
		public function addInfo(idAvt:String, idListAvt:String, nameAvt:String, timeUse:String, linkAvt:String, 
									expire:String, idWeb:String, canUse:Boolean):void 
		{
			_idAvt = idAvt;
			_idListAvt = idListAvt;
			
			content.itemNameTxt.text = nameAvt;
			
			content.useItemVisibleMc.visible = canUse;
			var date:Date = new Date();
			
			var month:Number = date.month + 1;
			var year:Number = date.fullYear;
			month = month + 1;
			if (month > 12) 
			{
				month = month - 12;
				year = year + 1;
			}
			
			content.itemLimitTxt.text = String(date.dateUTC) + "/" + String(month) + "/" + String(year);
			
			
			content.itemTimeUseTxt.text = timeUse;
			content.itemLimitTxt.text = expire;
			
			var image:ImageItem = new ImageItem();
			content.containerImg.addChild(image);
			image.x = 5;
			image.y = 18;
			image.addImg(linkAvt + "/WAZ/" + idWeb + ".png");
			
		}
		
		
		protected function format(number:int):String 
		{
			var numString:String = number.toString()
			var result:String = ''

			while (numString.length > 3)
			{
					var chunk:String = numString.substr(-3)
					numString = numString.substr(0, numString.length - 3)
					result = ',' + chunk + result
			}

			if (numString.length > 0)
			{
					result = numString + result
			}

			return result
		}
	}

}