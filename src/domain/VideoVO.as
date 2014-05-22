package domain {
	
	public final class VideoVO {
		
		[Bindable]
		public var title:String;
		
		[Bindable]
		public var player:String;
		
		[Bindable]
		public var thumbnail:String;
		
		[Bindable]
		public var duration:Number;
		
		[Bindable]
		public var viewed:Boolean;
		
		[Bindable]
		public var added:Boolean;
		
		[Bindable]
		public var videoId:String;
		
		[Bindable]
		public var ownerId:String;
		
		public static function create(source:Object):VideoVO {
			var video:VideoVO = new VideoVO();
			
			video.videoId = source.id || "-1";
			video.ownerId = source.owner_id || "-1";
			video.title = source.title || "";
			video.player = source.player || "";
			video.thumbnail = source.image_medium || "";
			video.duration = source.duration || 0;
			video.viewed = false;
			video.added = false;
			
			return video;
		}
	}
}