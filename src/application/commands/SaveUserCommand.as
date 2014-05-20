package application.commands {
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	import domain.UserModel;
	
	public final class SaveUserCommand {
		
		public var user:UserModel;
		
		public function execute():void {
			if (EncryptedLocalStore.isSupported) {
				var bytes:ByteArray = new ByteArray();
				
				bytes.writeObject({
					userId: this.user.userId,
					fullName: this.user.fullName,
					accessToken: this.user.accessToken,
					expirationDate: this.user.expirationDate
				});
				
				EncryptedLocalStore.setItem("user", bytes);
			}
		}
		
	}
}