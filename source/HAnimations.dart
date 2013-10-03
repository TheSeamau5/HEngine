library HAnimations;

import "HEntity.dart";
import "HTexture.dart";


//To be implemented
class Animation{
  String name;
  int currentFrame = 0;
  List<Texture> textures;
  
  //To be implemented
  void play(){
    
  }
  
  //To be implemented
  void stop(){
    
    
  }
  
  //To be implemented
  void update(){
    
  }
  
}

//To be implemented
class AnimationController extends Component{
  List<Animation> animations;
  String currentAnimation;
  String type = "animation";
  
  //To be implemented
  void play(String animation){
    
  }
  
  //To be implemented
  void playCurrent(){
    
    
  }
  
  //To be implemented
  void playNext(){
    
  }
  
  //To be implemented
  void stop(){
    
  }
  
  //To be implemented
  void update(){
    
  }
}