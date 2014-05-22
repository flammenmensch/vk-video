package application.commands {
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	import application.messages.SearchMessage;
	
	import domain.UserModel;
	import domain.VideoVO;
	
	public final class SearchCommand extends VkApiCommandBase {
		
		public var user:UserModel;
		
		public function execute(message:SearchMessage):void {
			var token:AsyncToken = this.vk.search(message.query, message.offset, user.accessToken);
			token.addResponder(new Responder(this.onResult, this.onFault));
		}
		
		override protected function onResult(event:ResultEvent):void {
			super.onResult(event)
			
			var result:Object = event.result;
			
			var videos:Array = result.response as Array;
			
			var arrayList:IList = new ArrayList();
			
			videos.forEach(function (item:Object, i:Number, a:Array):void {
				arrayList.addItem(VideoVO.create(item));
			});

			this.callback(arrayList);
		}
	}
}