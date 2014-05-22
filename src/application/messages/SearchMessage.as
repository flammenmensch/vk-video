package application.messages {
	public final class SearchMessage {
		
		private var __query:String;
		
		private var __offset:uint;
		
		public function SearchMessage(query:String, offset:uint=0) {
			this.__query = query;
		}
		
		public function get offset():uint {
			return this.__offset;
		}
		
		public function get query():String {
			return this.__query;
		}
	}
}