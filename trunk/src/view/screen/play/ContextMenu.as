package view.screen.play 
{
	import com.adobe.air.filesystem.events.FileMonitorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import model.MyDataTLMN;
	import view.Base;
	
	import view.screen.play.Avatar;
	
	/**
	 * ...
	 * @author Bim kute
	 */
	public class ContextMenu extends Base 
	{
		private var avatar:Avatar;
		public function ContextMenu() 
		{
			
			content = new UserInfoBoard();
			addChild(content);
			
			avatar = new Avatar();
			content.posAvatar.addChild(avatar);
			avatar.x = -25;
			avatar.y = -20;
			
			content.addFriendBtn.addEventListener(MouseEvent.CLICK, onClickAddFriend);
			content.removeFriendBtn.addEventListener(MouseEvent.CLICK, onClickRemoveFriend);
			content.kickBtn.addEventListener(MouseEvent.CLICK, onClickKick);
			content.closeBtn.addEventListener(MouseEvent.CLICK, onClose);
			content.kickBtn.buttonMode = true;
			content.closeBtn.buttonMode = true;
			content.addFriendBtn.buttonMode = true;
			content.removeFriendBtn.buttonMode = true;
			
			
		}
		
		private function onClose(e:MouseEvent):void 
		{
			dispatchEvent(new Event("close"));
		}
		
		public function removeAllEvent():void 
		{
			content.kickBtn.removeEventListener(MouseEvent.CLICK, onClickKick);
			content.addFriendBtn.removeEventListener(MouseEvent.CLICK, onClickAddFriend);
			content.removeFriendBtn.removeEventListener(MouseEvent.CLICK, onClickRemoveFriend);
			content.kickBtn.removeEventListener(MouseEvent.CLICK, onClickKick);
			content.closeBtn.removeEventListener(MouseEvent.CLICK, onClose);
		}
		
		private function onClickViewInfo(e:MouseEvent):void 
		{
			dispatchEvent(new Event("view"));
		}
		
		private function onClickAddFriend(e:MouseEvent):void 
		{
			dispatchEvent(new Event("add friend"));
		}
		private function onClickRemoveFriend(e:MouseEvent):void 
		{
			dispatchEvent(new Event("remove friend"));
		}
		
		private function onClickKick(e:MouseEvent):void 
		{
			dispatchEvent(new Event("kick"));
		}
		
		public function setInfo(userName:String, money:String, level:String, linkAvatar:String, friend:Boolean):void 
		{
			content.userName.text = userName;
			content.userMoney.text = money;
			content.level.txt.text = level;
			
			if (friend) 
			{
				content.removeFriendBtn.visible = true;
			}
			else 
			{
				content.removeFriendBtn.visible = false;
			}
			
			avatar.addImg(linkAvatar);
		}
		
	}

}