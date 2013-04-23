package  
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.filters.BevelFilter;
	import flash.filters.BlurFilter;
	import flash.filters.ConvolutionFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	import flash.utils.setTimeout;
	import net.flashpunk.Engine;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author Dreauw
	 */
	public class Preloader extends MovieClip {
		private var label : TextField = new TextField();
		private var progressBar : Shape = new Shape();
		private var background : Shape = new Shape();
		private var paused : Boolean = false;
		private var bWidth:Number;
		private var bHeight:Number;
		public function Preloader() {
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			bWidth = stage.stageWidth - 200;
			bHeight = 20;
			
			background.x = 100;
			background.y = (stage.stageHeight - bHeight) / 2;
			addChild(background);
			
			progressBar.x = 100;
			progressBar.y = (stage.stageHeight - bHeight) / 2;
			addChild(progressBar);
			
			
			var format:TextFormat = new TextFormat();
			label.autoSize = TextFieldAutoSize.LEFT;  
			label.text = "Loading 0%";
			label.selectable = false;
			format.font = "default";
			format.color = 0xFFFFFF;
			format.size = 32;
			label.defaultTextFormat = format;
			label.embedFonts = true;
			
			label.x = (stage.stageWidth - 200)/2;
			label.y = progressBar.y - label.height - bHeight - 14;
			label.filters = [new GlowFilter(0, 1, 4, 4, 8)];
			addChild(label);
			
			background.graphics.beginFill(0, 0.5);
			background.graphics.drawRect(2, 2, bWidth, bHeight);
			background.graphics.endFill();
			background.filters = [new GlowFilter(0, 1, 4, 4, 8)];
			background.graphics.lineStyle(2, 0xFFFFFF, 1, true);
			background.graphics.drawRect(1, 1, bWidth+2, bHeight+2);
			background.graphics.endFill();
			background.width += 2;
			background.height += 2;
		}

		private function ioError(e:IOErrorEvent):void {
			trace(e.text);
		}

		private function progress(e:ProgressEvent):void {
			var percent:Number = e.bytesLoaded / e.bytesTotal;
			label.text = "Loading " + (percent * 100).toFixed().toString() + "%";
			var height2:uint = Math.ceil(bHeight / 4);
			var width2:Number = percent * bWidth;
			progressBar.graphics.beginFill(0xCC0000, 1);
			progressBar.graphics.drawRect(2, 2, width2, bHeight);
			progressBar.graphics.endFill();
			progressBar.graphics.beginFill(0xFFFFFF, 0.3);
			progressBar.graphics.drawRect(2, 2, width2, height2);
			progressBar.graphics.endFill();
			progressBar.graphics.beginFill(0, 0.3);
			height2 = Math.floor(bHeight / 4);
			progressBar.graphics.drawRect(2, bHeight-height2+2, width2, height2);
			progressBar.graphics.endFill();
			progressBar.width += 2;
			progressBar.height += 2;
		}

		private function checkFrame(e:Event):void {
			if (currentFrame == totalFrames) {
				stop();
				loadingFinished();
			}
		}

		private function loadingFinished():void {
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			removeChild(progressBar);
			removeChild(label);
			progressBar = null;
			label = null;
			startup();
		}

		private function startup():void {
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass() as Engine);
		}

	}
}