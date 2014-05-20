package domain {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class VideoModel extends EventDispatcher {
		
		private var __video:VideoVO;
		
		public function setVideo(value:VideoVO):void {
			if (this.__video !== value) {
				this.__video = value;
				this.dispatchEvent(new Event("videoChanged"));
			}
		}
		
		[Bindable("videoChanged")]
		public function get video():VideoVO {
			return this.__video;
		}
	}
}