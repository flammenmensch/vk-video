package presentation.events {
	import flash.events.Event;
	
	public final class VideoListEvent extends Event {
		
		public static const PLAY:String = "play";
		
		private var __video:Object;
		
		public function VideoListEvent(type:String, video:Object, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
			
			this.__video = video;
		}
		
		public function get video():Object {
			return this.__video;
		}
		
		override public function clone():Event {
			return new VideoListEvent(this.type, this.video, this.bubbles, this.cancelable);
		}
	}
}