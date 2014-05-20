package application.messages {
	public final class SelectVideoMessage {
		
		public static const SELECT:String = "select";
		
		public static const DESELECT:String = "deselect";
		
		private var __video:Object;
		
		private var __action:String;
		
		public function SelectVideoMessage(action:String, video:Object=null) {
			this.__action = action;
			this.__video = video;
		}
		
		[Selector]
		public function get action():String {
			return this.__action;
		}
		
		public function get video():Object {
			return this.__video;
		}
	}
}