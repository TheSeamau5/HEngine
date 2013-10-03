library HCollider;

import "HEntity.dart";
import "HMath.dart";

abstract class Collider extends Component{
  List<Collider> colliders;
  
  String type;
  
  bool collidesWith(Collider collider);
  
  void onCollision(Collider collider){
    colliders.add(collider);
  }
  
}



//TO BE IMPLEMENTED
class AABBCollider extends Collider{
  num width, height;
  
  String type = "AABBCollider";

  AABBCollider(this.width, this.height);
  
  
  
  
  void onCollision(Collider collider){
    super.onCollision(collider);
    
  }
  
}

//TO BE IMPLEMENTED
class CircleCollider extends Collider{
  num radius;
  
  String type = "CircleCollider";
  
  CircleCollider(this.radius);
  
}

//TO BE IMPLEMENTED
class BoxCollider extends Collider{
  Point UR, UL, LR, LL;
  
  String type = "BoxCollider";
  
  BoxCollider(num width, num height){
    this.UL = this.parent.position + new Point(-width/2, -height/2, 0);
    this.LL = this.parent.position + new Point(-width/2,  height/2, 0);
    this.LR = this.parent.position + new Point( width/2,  height/2, 0);
    this.UR = this.parent.position + new Point( width/2, -height/2, 0);
  }
  
}


bool collisionHasOccuredBetween(Collider colliderA, Collider colliderB){
  
}


bool isCirclevsCircleCollision(CircleCollider colliderA, CircleCollider colliderB){
  Point centerA = colliderA.parent.position;
  Point centerB = colliderB.parent.position;
  
  if (centerA.z != centerB.z){
    return false;
  }
  
  num distanceBetweenCenters = distance(centerA, centerB);
  
  num sumOfRadii = colliderA.radius + colliderB.radius;
  
  return sumOfRadii > distanceBetweenCenters;
  
}


bool isAABBvsAABBCollision(AABBCollider colliderA, AABBCollider colliderB){
  Point centerA = colliderA.parent.position;
  Point centerB = colliderB.parent.position;
  
  if (centerA.z != centerB.z){
    return false;
  }
  
  if (abs(centerA.x - centerB.x) < (colliderA.width  + colliderB.width )/2 &&  
      abs(centerA.y - centerB.y) < (colliderA.height + colliderB.height)/2){
    
    return true;
  }
  return false;
  
}

bool isBoxvsBoxCollision(BoxCollider colliderA, BoxCollider colliderB){
  Point centerA = colliderA.parent.position;
  Point centerB = colliderB.parent.position;
  
  if (centerA.z != centerB.z){
    return false;
  }
  
  
  Point axis1 = colliderA.UR - colliderA.UL;
  Point axis2 = colliderA.UR - colliderA.LR;
  Point axis3 = colliderB.UL - colliderB.LL;
  Point axis4 = colliderB.UL - colliderB.UR;
  
  List<Point> axes = [axis1, axis2, axis3, axis4];
  
  List<num> aVals = new List(4);
  List<num> bVals = new List(4);
  for (int i = 0; i < 4; i++){
    aVals[0] = dot(project(colliderA.UR,axes[i]), axes[i]);
    aVals[1] = dot(project(colliderA.UL,axes[i]), axes[i]);
    aVals[2] = dot(project(colliderA.LR,axes[i]), axes[i]);
    aVals[3] = dot(project(colliderA.LL,axes[i]), axes[i]);
    
    bVals[0] = dot(project(colliderB.UR,axes[i]), axes[i]);
    bVals[1] = dot(project(colliderB.UL,axes[i]), axes[i]);
    bVals[2] = dot(project(colliderB.LR,axes[i]), axes[i]);
    bVals[3] = dot(project(colliderB.LL,axes[i]), axes[i]);
    
    if (!(minFromList(bVals) <= maxFromList(aVals)) &&
        !(maxFromList(bVals) >= minFromList(aVals))){
      return false;
    }
  } 
  
  return true;
}