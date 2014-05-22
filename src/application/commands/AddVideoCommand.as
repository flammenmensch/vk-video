package application.commands {
	import mx.events.CloseEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Alert;
	
	import application.messages.VideoMessage;
	
	import domain.UserModel;
	import domain.VideoVO;
	
	public final class AddVideoCommand extends VkApiCommandBase {
	
		public var user:UserModel;
		
		private var __video:VideoVO;
		
		public function execute(message:VideoMessage):void {
			this.__video = message.video;
			
			var token:AsyncToken = this.vk.addVideo(message.video.videoId, message.video.ownerId, user.accessToken);
			
			token.addResponder(new Responder(this.onResult, this.onFault));
		}
		
		override protected function onResult(event:ResultEvent):void {
			super.onResult(event);
			
			Alert.show("Видео сохранено", "Сообщение", Alert.OK, null, this.okClickHandler);
		}
		
		private function okClickHandler(event:CloseEvent):void {
			this.__video.added = true;
			
			this.callback(true);
		}
	}
}