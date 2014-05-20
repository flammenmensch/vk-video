package domain {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public final class UserModel extends EventDispatcher {
		
		private var __accessToken:String;
		
		private var __expirationDate:Date;
		
		private var __userId:uint;
		
		private var __loggedIn:Boolean;
		
		private var __fullName:String;
		
		public function setFullName(value:String):void {
			if (this.__fullName !== value) {
				this.__fullName = value;
				this.dispatchEvent(new Event("fullNameChanged"));
			}
		}
		
		public function setLoggedIn(value:Boolean):void {
			if (this.__loggedIn !== value) {
				this.__loggedIn = value;
				this.dispatchEvent(new Event("loggedInChanged"));
			}
		}
		
		public function setAccessToken(value:String):void {
			if (this.__accessToken !== value) {
				this.__accessToken = value;
				this.dispatchEvent(new Event("accessTokenChanged"));
			}
		}
		
		public function setExpirationDate(value:Date):void {
			if (this.__expirationDate !== value) {
				this.__expirationDate = value;
				this.dispatchEvent(new Event("expirationDateChanged"));
			}
		}
		
		public function setUserId(value:uint):void {
			if (this.__userId !== value) {
				this.__userId = value;
				this.dispatchEvent(new Event("userIdChanged"));
			}
		}
		
		[Bindable("fullNameChanged")]
		public function get fullName():String {
			return this.__fullName;
		}
		
		[Bindable("loggedInChanged")]
		public function get loggedIn():Boolean {
			return this.__loggedIn;
		}
		
		[Bindable("userIdChanged")]
		public function get userId():uint {
			return this.__userId;
		}
		
		[Bindable("accessTokenChanged")]
		public function get accessToken():String {
			return this.__accessToken;
		}
		
		[Bindable("expirationDateChanged")]
		public function get expirationDate():Date {
			return this.__expirationDate;
		}
		
	}
}