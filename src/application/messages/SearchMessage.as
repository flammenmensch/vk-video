package application.messages {
	public final class SearchMessage {
		
		private var __query:String;
		
		public function SearchMessage(query:String) {
			this.__query = query;
		}
		
		public function get query():String {
			return this.__query;
		}
	}
}