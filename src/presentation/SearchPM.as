package presentation {
	import mx.collections.IList;
	import mx.utils.StringUtil;
	
	import application.messages.SearchMessage;
	import application.messages.VideoMessage;
	
	import domain.VideoVO;
	
	public final class SearchPM {
		
		public var dispatcher:Function;
		
		[Bindable]
		public var isSearching:Boolean;
		
		[Bindable]
		public var searchResults:IList;
		
		[Bindable]
		public var searchQuery:String;
		
		public function selectVideo(video:VideoVO):void {
			this.dispatcher(new VideoMessage(VideoMessage.SELECT, video));
		}
		
		public function addVideo(video:VideoVO):void {
			this.dispatcher(new VideoMessage(VideoMessage.ADD, video));
		}
		
		public function search():void {
			if (this.searchQuery === null || StringUtil.trim(this.searchQuery) === "") {
				return;
			}
			
			this.dispatcher(new SearchMessage(this.searchQuery));	
		}
		
		public function searchComplete(results:IList=null):void {
			if (results === null) {
				return;
			}
			
			this.searchResults = results;
		}
	}
}