package presentation.components {
	import flash.events.Event;
	import flash.events.NativeWindowBoundsEvent;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import mx.events.FlexEvent;
	
	import spark.components.Window;
	
	public class VideoWindow extends Window {
		
		private var __stageWebView:StageWebView;
		
		private var __url:String;
		
		public function VideoWindow(url:String) {
			super();
			
			this.__url = url;
			
			this.addEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
		}
		
		private function creationCompleteHandler(event:FlexEvent):void {
			this.systemManager.stage.nativeWindow.addEventListener("closing", window_closingHandler);
			this.systemManager.stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE, window_resizeHandler);
			
			this.__stageWebView = new StageWebView(true);
			this.__stageWebView.viewPort = new Rectangle(0, 0, this.width, this.height);
			this.__stageWebView.stage = this.stage;
			
			this.__stageWebView.loadURL(this.__url);
		}
		
		private function window_closingHandler(event:Event):void {
			this.__stageWebView.dispose();
		}
		
		private function window_resizeHandler(event:NativeWindowBoundsEvent):void {
			this.__stageWebView.viewPort.copyFrom(event.afterBounds);
		}
	}
}