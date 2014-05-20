package domain {
	import flash.data.EncryptedLocalStore;
	import flash.utils.ByteArray;
	
	public final class UserModelFactory {
		
		public function createUserModel():UserModel {
			var user:UserModel = new UserModel();
			
			if (EncryptedLocalStore.isSupported) {
				var bytes:ByteArray = EncryptedLocalStore.getItem("user");
				
				if (bytes) {
					var object:Object = bytes.readObject() as Object;
					
					user.setUserId(object.userId);
					user.setAccessToken(object.accessToken);
					user.setExpirationDate(object.expirationDate);
					user.setFullName(object.fullName);
					
					user.setLoggedIn(true);
				}
			}
			
			return user;
		}
		
	}
}