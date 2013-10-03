import 'dart:html';
import 'dart:async';
import 'HEntity.dart';
import 'HTexture.dart';

abstract class Renderer{
  
  CanvasElement canvas;
  //CanvasRenderingContext context;
  
  void drawEntity(Entity entity);
  
  void draw();
}


class CanvasRenderer extends Renderer{
  
  CanvasRenderingContext2D context;
  
  CanvasElement shadowCanvas;
  CanvasRenderingContext2D shadowContext;
  
  
  CanvasRenderer(CanvasElement canvas){
    this.canvas = canvas;
    this.context = canvas.getContext("2d");
    this.shadowCanvas = new CanvasElement();
    this.shadowCanvas.width = canvas.width;
    this.shadowCanvas.height = canvas.height;
    this.shadowContext = this.shadowCanvas.getContext("2d");
  }


  Future drawToShadowCanvas(Entity entity){
    num x = entity.position.x;
    num y = entity.position.y;
    Texture texture = entity.getComponent("textureComponent").texture;
    num width = texture.width;
    num height = texture.height;
    num scaleX = entity.scale.x;
    num scaleY = entity.scale.y;
    num rotation = entity.rotation;
    
    
    this.shadowContext.save();
    this.shadowContext.setTransform(1, 0, 0, 1, 0, 0);
    this.shadowContext.translate(x, y);
    this.shadowContext.rotate(rotation);
    this.shadowContext.drawImageScaled(texture.image, 0, 0, width * scaleX, height * scaleY);
    this.shadowContext.restore();
  }
  
  Future drawShadowCanvasToCanvas(){
    this.context.save();
    this.context.setTransform(1, 0, 0, 1, 0, 0);
    this.context.drawImage(this.shadowCanvas, 0, 0);
    this.context.restore();
  }
  
  void drawEntity(Entity entity){
    drawToShadowCanvas(entity);
  }
  
  void draw(){
    drawShadowCanvasToCanvas();
  }
  
}