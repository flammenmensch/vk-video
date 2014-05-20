package presentation {
	import application.messages.LoginMessage;
	
	import domain.UserModel;
	
	public final class LoginPM {
		
		[Bindable]
		public var user:UserModel;
		
		[Bindable]
		public var loggingIn:Boolean;
		
		public var dispatcher:Function;
		
		public function login():void {
			this.dispatcher(new LoginMessage(LoginMessage.LOGIN));
		}
		
		public function logout():void {
			this.dispatcher(new LoginMessage(LoginMessage.LOGOUT));
		}
	}
}