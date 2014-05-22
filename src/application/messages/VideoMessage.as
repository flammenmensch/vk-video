package application.messages {
	import domain.VideoVO;

	public final class VideoMessage {
		
		public static const SELECT:String = "select";
		
		public static const DESELECT:String = "deselect";
		
		public static const ADD:String = "add";
		
		private var __video:VideoVO;
		
		private var __action:String;
		
		public function VideoMessage(action:String, video:VideoVO=null) {
			this.__action = action;
			this.__video = video;
		}
		
		[Selector]
		public function get action():String {
			return this.__action;
		}
		
		public function get video():VideoVO {
			return this.__video;
		}
	}
}