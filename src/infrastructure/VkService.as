package infrastructure {
	import mx.rpc.AsyncToken;
	import mx.rpc.http.HTTPService;

	public class VkService {
		
		private var __httpService:HTTPService;
		
		private var __apiVersion:String;
		
		public function VkService(apiUrl:String, apiVersion:String) {
			this.__apiVersion = apiVersion;
			
			this.__httpService = new HTTPService(apiUrl);
			
			this.__httpService.method = "GET";
			this.__httpService.resultFormat = "text";
			this.__httpService.contentType = "application/json";
			this.__httpService.serializationFilter = new JsonSerializationFilter();
		}
		
		public function getUserInfo(userId:Number, accessToken:String):AsyncToken {
			return this.sendRequest("users.get", {
				user_id: userId,
				access_token: accessToken
			});
		}
		
		public function search(query:String, offset:uint, accessToken:String):AsyncToken {
			return this.sendRequest("video.search", {
				q: query,
				sort: 2,
				count: 200,
				offset: offset,
				filters: "long",
				access_token: accessToken
			});
		}
		
		public function addVideo(videoId:String, ownerId:String, accessToken:String):AsyncToken {
			return this.sendRequest("video.add", {
				video_id: videoId,
				owner_id: ownerId,
				access_token: accessToken
			});
		}
		
		private function sendRequest(method:String, params:Object):AsyncToken {
			this.__httpService.url = method;
			
			return this.__httpService.send(params);
		}
	}
}