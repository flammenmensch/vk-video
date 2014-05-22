package application.errors {
	public final class VkApiError extends Error {
		
		private var __error:Object;
		
		public function VkApiError(error:Object) {
			super(error.error_msg, error.error_code);
			
			this.__error = error;
		}
		
		public function get error():Object {
			return this.__error;
		}
	}
}