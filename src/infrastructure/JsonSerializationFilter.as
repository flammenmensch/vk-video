package infrastructure {
	import mx.rpc.http.AbstractOperation;
	import mx.rpc.http.SerializationFilter;
	
	internal final class JsonSerializationFilter extends SerializationFilter {
		
		override public function deserializeResult(operation:AbstractOperation, result:Object):Object {
			return JSON.parse(result as String);
		}
		
	}
}