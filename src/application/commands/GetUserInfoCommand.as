package application.commands {
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import domain.UserModel;
	
	import infrastructure.VkService;
	
	public final class GetUserInfoCommand {
		
		public var user:UserModel;
		
		public var vk:VkService;
		
		public var callback:Function;
		
		public function execute():void {
			var token:AsyncToken = this.vk.getUserInfo(user.userId, user.accessToken);
			token.addResponder(new Responder(this.onResult, this.onFault));
		}
		
		private function onResult(event:ResultEvent):void {
			var result:Object = event.result;
			var users:Array = result.response;
			
			if (users.length) {
				var info:Object = users[0];
				
				this.user.setFullName(info.first_name + " " + info.last_name);
			}
			
			this.callback(true);
		}
		
		private function onFault(event:FaultEvent):void {
			this.callback(new Error(event.fault.faultString));
		}
		
	}
}