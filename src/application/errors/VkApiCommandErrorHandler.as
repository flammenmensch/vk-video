package application.errors {
	import spark.components.Alert;
	
	
	public final class VkApiCommandErrorHandler {
		
		public function handleError(error:VkApiError):void {
			Alert.show(error.error.error_msg, "Произошла ошибка");
		}
		
	}
}