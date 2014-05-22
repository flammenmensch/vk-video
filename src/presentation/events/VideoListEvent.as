package presentation.events {
	import flash.events.Event;
	
	import domain.VideoVO;
	
	public final class VideoListEvent extends Event {
		
		public static const PLAY_VIDEO:String = "playVideo";
		
		public static const ADD_VIDEO:String = "addVideo";
		
		private var __video:VideoVO;
		
		public function VideoListEvent(type:String, video:VideoVO, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			
			this.__video = video;
		}
		
		public function get video():VideoVO {
			return this.__video;
		}
		
		override public function clone():Event {
			return new VideoListEvent(this.type, this.video, this.bubbles, this.cancelable);
		}
	}
}