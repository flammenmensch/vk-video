package application.commands {
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	import domain.UserModel;
	
	import infrastructure.VkService;
	
	public final class GetUserInfoCommand extends VkApiCommandBase {
		
		public var user:UserModel;
		
		public function execute():void {
			var token:AsyncToken = this.vk.getUserInfo(user.userId, user.accessToken);
			
			token.addResponder(new Responder(this.onResult, this.onFault));
		}
		
		override protected function onResult(event:ResultEvent):void {
			super.onResult(event);
			
			var result:Object = event.result;
			var users:Array = result.response;
			
			if (users.length) {
				var info:Object = users[0];
				
				this.user.setFullName(info.first_name + " " + info.last_name);
			}
			
			this.callback(true);
		}
	}
}