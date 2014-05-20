package infrastructure {
	
	public final class VkServiceFactory {
		
		public var configuration:Object;
		
		public function createVkService():VkService {
			var service:VkService = new VkService(this.configuration.API_URL, this.configuration.API_VERSION);
			
			return service;
		}
	}
}