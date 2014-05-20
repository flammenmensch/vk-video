package application.commands {
	import domain.UserModel;

	public final class UpdateLoginStatusCommand {
		
		public var user:UserModel;
		
		public var status:Boolean;
		
		public function execute():void {
			this.user.setLoggedIn(this.status);
		}
	}
}