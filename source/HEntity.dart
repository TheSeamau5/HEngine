library HEntity;

import "HMath.dart";



abstract class Component{
  
  Entity parent;
  
  String type;
  
  void update();
}

class Entity{
    
  String name = "";
  
  Point position;
  num rotation;
  Point scale;
  
  List<Entity> children = [];
  List<Component> components = [];
  
  Entity.Default(){
    this.position = new Point.zero();
    this.rotation = 0;
    this.scale = new Point(1,1,0);
  }
  
  //To be implemented
  void update(){
    
  }
  
  //To be implemented
  Component getComponent(String componentType){
    for (int i = 0; i < this.components.length; i++){
      if (this.components[i].type == componentType){
        return this.components[i];
      }
    }
  }
  
}

