package {
	import net.flashpunk.FP;
	import net.flashpunk.Engine;
	import net.flashpunk.utils.Key;
	import flash.system.Capabilities;
	
	/**
	 * ...
	 * @author Dreauw
	 */
	dynamic public class Main extends Engine {
		public function Main() {
			super(640, 480, 60, false);
			if (Capabilities.isDebugger) {
				FP.console.enable();
				FP.console.toggleKey = Key.F1;
			}
			FP.screen.scale = 2;
		}
	}
}