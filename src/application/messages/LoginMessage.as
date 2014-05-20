package application.messages {
	
	public final class LoginMessage {
		
		public static const LOGIN:String = "login";
		
		public static const LOGOUT:String = "logout";

		private var __type:String;
		
		public function LoginMessage(type:String) {
			this.__type = type;
		}
		
		[Selector]
		public function get type():String {
			return this.__type;
		}
	}
}