package application.commands {
	import flash.data.EncryptedLocalStore;
	
	import domain.UserModel;
	
	public class LogoutCommand {
		
		public var user:UserModel;
		
		public function execute():void {
			
			this.user.setAccessToken(null);
			this.user.setExpirationDate(new Date());
			this.user.setFullName(null);
			this.user.setUserId(0);
			
			if (EncryptedLocalStore.isSupported) {
				EncryptedLocalStore.removeItem("user");
			}
			
		}
		
	}
}