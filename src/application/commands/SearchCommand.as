package application.commands {
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import application.messages.SearchMessage;
	
	import domain.ListCollectionModel;
	import domain.UserModel;
	
	import infrastructure.VkService;
	
	public final class SearchCommand {
		
		public var callback:Function;
		
		public var searchResults:ListCollectionModel;
		
		public var user:UserModel;
		
		public var vk:VkService;
		
		public function execute(message:SearchMessage):void {
			var token:AsyncToken = this.vk.search(message.query, user.accessToken);
			token.addResponder(new Responder(this.onResult, this.onFault));
		}
		
		private function onResult(event:ResultEvent):void {
			var result:Object = event.result;
			
			if (result.error) {
				this.callback(new Error(result.error));
			}
			
			var videos:Array = result.response as Array;
			
			this.searchResults.setListCollection(new ArrayCollection(videos));
			
			this.callback(true);
		}
		
		private function onFault(event:FaultEvent):void {
			this.callback(new Error(event.fault.faultString));
		}
	}
}