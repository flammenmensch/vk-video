package application.commands {
	import spark.components.Window;
	
	import application.messages.SelectVideoMessage;
	
	import domain.VideoModel;
	
	import presentation.components.VideoWindow;
	
	public final class SelectVideoCommand {
		
		public var video:VideoModel;
		
		public function execute(message:SelectVideoMessage):void {
			var window:Window = new VideoWindow(message.video.player);
			
			window.width = 640;
			window.height = 480;
			window.resizable = false;
			window.maximizable = false;
			window.title = message.video.title;
			window.showStatusBar = false;
			
			window.open();
		}
	}
}