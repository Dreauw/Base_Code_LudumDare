package {
	import net.flashpunk.FP;
	import net.flashpunk.Engine;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Dreauw
	 */
	public class Main extends Engine {
		public function Main() {
			super(640, 480, 60, false);
			if (new Error().getStackTrace().search(/:[0-9]+]$/m) > -1) {
				FP.console.enable();
				FP.console.toggleKey = Key.F1;
			}
			FP.screen.scale = 2;
		}
	}
}