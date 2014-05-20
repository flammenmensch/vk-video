package presentation {
	import application.messages.LoginMessage;
	
	import domain.UserModel;

	public final class HeaderPM {
		
		public var dispatcher:Function;
		
		[Bindable]
		public var user:UserModel;
		
		public function logout():void {
			this.dispatcher(new LoginMessage(LoginMessage.LOGOUT));
		}
	}
}