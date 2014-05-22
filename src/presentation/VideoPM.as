package presentation {
	import application.messages.VideoMessage;
	
	import domain.VideoModel;
	
	public class VideoPM {
		
		[Bindable]
		public var video:VideoModel;
		
		public var dispatcher:Function;
		
		public function close():void {
			this.dispatcher(new VideoMessage(VideoMessage.DESELECT));
		}
	}
}