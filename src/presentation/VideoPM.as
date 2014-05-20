package presentation {
	import application.messages.SelectVideoMessage;
	
	import domain.VideoModel;
	
	public class VideoPM {
		
		[Bindable]
		public var video:VideoModel;
		
		public var dispatcher:Function;
		
		public function close():void {
			this.dispatcher(new SelectVideoMessage(SelectVideoMessage.DESELECT));
		}
	}
}