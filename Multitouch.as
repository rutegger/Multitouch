package{
	

	
	public class Multitouch extends MovieClip{
		
		private var con:Sprite = new Sprite();
		
		public function Multitouch(){
			
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(TransformGestureEvent.GESTURE_ZOOM, onStageZoom, false, 0, true);
			stage.addEventListener(TransformGestureEvent.GESTURE_ROTATE, onStageRotate, false, 0, true);
			
			con.x = stage.stageWidth * 0.5;
			con.y = stage.stageHeight * 0.5;
			addChild(con);
			
			for(var i:uint = 0; i < 10; i++){				
				var b:Sprite = Sprite(new BoxMC());
				b.x = Math.random() * stage.stageWidth - (stage.stageWidth * 0.5);
				b.y = Math.random() * stage.stageHeight - (stage.stageHeight * 0.5);
				b.rotation = Math.random() * 360;
				b.addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0, true);
				b.addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0, true);
				b.addEventListener(TransformGestureEvent.GESTURE_ZOOM, onZoom, false, 0, true);
				b.addEventListener(TransformGestureEvent.GESTURE_ROTATE, onRotate, false, 0, true);
				con.addChild(b);
			}
			
		}
		
		private function onDown(me:MouseEvent):void {
			var b:Sprite = Sprite(me.currentTarget);
			con.addChild(b); // pops to top of display list
			b.startDrag();
		}
		
		private function onUp(me:MouseEvent):void {
			var b:Sprite = Sprite(me.currentTarget);			
			b.stopDrag();
		}
		
		private function onZoom(ge:TransformGestureEvent):void {
			ge.stopImmediatePropagation();
			var b:Sprite = Sprite(ge.currentTarget);
			b.scaleX *= ge.scaleX;
			b.scaleY *= ge.scaleY;
		}
		
		private function onRotate(ge:TransformGestureEvent):void {
			ge.stopImmediatePropagation();
			var b:Sprite = Sprite(ge.currentTarget);	
			b.rotation += ge.rotation;
		}
		
		private function onStageZoom(ge:TransformGestureEvent):void {
			con.scaleX *= ge.scaleX;
			con.scaleY *= ge.scaleY;
		}
		
		private function onStageRotate(ge:TransformGestureEvent):void {
			con.rotation += ge.rotation;
		}
		
		
	}
}