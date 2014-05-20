package domain {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.IList;
	
	public final class ListCollectionModel extends EventDispatcher {
		
		private var __listCollection:IList;
		
		public function setListCollection(value:IList):void {
			if (this.__listCollection !== value) {
				this.__listCollection = value;
				this.dispatchEvent(new Event("listCollectionChanged"));
			}
		}
		
		[Bindable("listCollectionChanged")]
		public function get listCollection():IList {
			return this.__listCollection;
		}
		
	}
}