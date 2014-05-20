package application.commands {
	import domain.VideoModel;
	
	public final class DeselectVideoCommand {
		
		public var video:VideoModel;
		
		public function execute():void {
			this.video.setVideo(null);
		}
		
	}
}