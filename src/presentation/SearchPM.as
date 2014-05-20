package presentation {
	import mx.utils.StringUtil;
	
	import application.messages.SearchMessage;
	import application.messages.SelectVideoMessage;
	
	import domain.ListCollectionModel;
	
	public final class SearchPM {
		
		public var dispatcher:Function;
		
		[Bindable]
		public var isSearching:Boolean;
		
		[Bindable]
		public var searchResults:ListCollectionModel;
		
		public function selectVideo(video:Object):void {
			this.dispatcher(new SelectVideoMessage(SelectVideoMessage.SELECT, video));
		}
		
		public function search(query:String):void {
			if (query === null || StringUtil.trim(query) === "") {
				return;
			}
			
			this.dispatcher(new SearchMessage(query));	
		}
		
	}
}