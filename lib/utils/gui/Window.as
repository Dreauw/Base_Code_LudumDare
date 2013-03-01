package utils.gui {
	import flash.display.Shape;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.filters.GlowFilter;
	public class Window extends Entity {
		
		public function Window(x:Number, y:Number, width:Number = 10, height:Number = 10, color:uint = 0) {
			var shape:Shape = new Shape();
			shape.graphics.beginFill(color, 0.7);
			shape.graphics.drawRect(5, 5, width+5, height+5);
			shape.graphics.endFill();
			super(x, y, Image.createFromShape(shape));
			shape.graphics.clear();
			shape.filters = [new GlowFilter(0, 1, 2, 2, 2)];
			shape.graphics.lineStyle(1, 0xFFFFFF, 1, true);
			shape.graphics.drawRect(5, 5, width, height);
			shape.graphics.endFill();
			shape.width += 10;
			shape.height += 10;
			shape.alpha = 0.7;
			addGraphic(Image.createFromShape(shape));
		}
		
	}

}