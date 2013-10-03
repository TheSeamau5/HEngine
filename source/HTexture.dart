library HTexture;

import 'dart:html';
import "HEntity.dart";


//TO BE IMPLEMENTED
class Texture{
  String source;
  ImageElement image;
  num width;
  num height;
  
}

class TextureComponent extends Component{
  Texture texture;
  String type = "textureComponent";
}