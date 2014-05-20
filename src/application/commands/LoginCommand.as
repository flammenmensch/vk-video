package application.commands {
	import flash.display.Stage;
	import flash.events.LocationChangeEvent;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
	import mx.utils.StringUtil;
	
	import domain.UserModel;

	public final class LoginCommand {
		
		public var stage:Stage;
		
		public var user:UserModel;
		
		public var configuration:Object;
		
		public var callback:Function;
		
		private var __webView:StageWebView;
		
		public function execute():void {
			var url:String = StringUtil.substitute("{0}?client_id={1}&scope={2}&redirect_uri={3}&display=page&v={4}&response_type=token",
				this.configuration.OAUTH_URL,
				this.configuration.APP_ID,
				this.configuration.PERMISSIONS,
				this.configuration.REDIRECT_URI,
				this.configuration.API_VERSION
			);
			
			this.__webView = new StageWebView();
			this.__webView.stage = this.stage;
			this.__webView.viewPort = new Rectangle(0, 0, this.stage.stageWidth, this.stage.stageHeight);
			this.__webView.addEventListener(LocationChangeEvent.LOCATION_CHANGE, this.webView_locationChangeHandler);
			this.__webView.loadURL(url);
		}
		
		private function webView_locationChangeHandler(event:LocationChangeEvent):void {
			if (event.location.match(StringUtil.substitute("^{0}#access_token=[A-Fa-f0-9].+", this.configuration.REDIRECT_URI))) {
				var hash:String = event.location.split("#")[1];
				var params:Array = hash.split("&");
				
				var pair:Array;
				for each (var p:String in params) {
					pair = p.split("=");
					
					if (pair[0] === "access_token") {
						this.user.setAccessToken(pair[1] as String);
					}
					
					if (pair[0] === "user_id") {
						this.user.setUserId(parseInt(pair[1]))
					}
					
					if (pair[0] === "expires_in") {
						var expirationDate:Date = new Date();
						expirationDate.setTime(expirationDate.getTime() + parseInt(pair[1]));
						
						this.user.setExpirationDate(expirationDate);
					}
				}
				
				this.__webView.removeEventListener(LocationChangeEvent.LOCATION_CHANGE, this.webView_locationChangeHandler);
				this.__webView.dispose();
				
				this.callback(true);
			}
		}
		
	}
}