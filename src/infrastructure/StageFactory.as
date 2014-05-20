package infrastructure {
	import flash.display.Stage;
	
	import mx.core.FlexGlobals;
	import mx.managers.SystemManager;
	
	public final class StageFactory {
		
		public function createStage():Stage {
			return SystemManager.getSWFRoot(FlexGlobals.topLevelApplication).stage;
		}
		
	}
}