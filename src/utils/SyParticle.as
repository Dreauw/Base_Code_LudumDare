package utils {
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.ParticleType;
	/**
	* ...
	* @author Dreauw
	*/
	
	public class SyParticle extends Entity {
		static public var instance : SyParticle;
		public function SyParticle() {
			super(0, 0, new Emitter(Assets.PARTICLES, 7, 7));
			layer = 0;
			registerParticle();
		}
		
		public function newType(name:String, frames:Array = null):ParticleType {
			return (graphic as Emitter).newType(name, frames);
		}

		private function registerParticle() : void {
			/*
			newType("foobar", [0])
				.setAlpha(1, 0)
				.setMotion(0, 20, 0.7, 360, 0, 0.4)
				.setGravity(5, 10);
			*/
		}

		static public function emit(name:String, x:Number, y:Number, nbr:Number = 1) : void {
			if (!instance || instance.world != FP.world) {
				instance = new SyParticle();
				if (instance.world) instance.world.remove(instance);
				FP.world.add(instance);
			}
			for (var i : Number = 0; i < nbr ; i++) {(instance.graphic as Emitter).emit(name, x, y);}
		}

	}

}