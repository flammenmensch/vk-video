package application.commands {
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import spark.components.Alert;
	
	import application.errors.VkApiError;
	
	import infrastructure.VkService;
	
	public class VkApiCommandBase {
		
		public var vk:VkService;
		
		public var callback:Function;
		
		protected function onResult(event:ResultEvent):void {
			if (event.result.error) {
				this.callback(new VkApiError(event.result.error));
				
				return;
			}
		}
		
		protected function onFault(event:FaultEvent):void {
			this.callback(new Error(event.fault.faultString, event.fault.faultCode));
		}
		
	}
}