library HDataStructures;

import "HEntity.dart";

abstract class Node{
  Entity entity;
  
  bool operator >  (Node node);
  bool operator <  (Node node);
  bool operator >= (Node node);
  bool operator <= (Node node);
  bool operator == (Node node);
  
}

//comparisons to be implemented
class OneWayNode extends Node{
  Node nextNode;
}

//comparisons to be implemented
class BidirectionalNode extends OneWayNode{
  Node previousNode; 
}


class BinaryNode extends Node{
  BinaryNode leftChild;
  BinaryNode rightChild;
  bool checkX = true;
  bool isRemoved = false;
  
  bool operator > (BinaryNode node){
    num v1,v2;
    if (node.checkX == true){
      v1 = this.entity.position.x;
      v2 = node.entity.position.x;
    }else{
      v1 = this.entity.position.y;
      v2 = node.entity.position.y;
    }
    
    return v1 > v2;
  }
  
  bool operator < (BinaryNode node){
    num v1, v2;
    if (node.checkX == true){
      v1 = this.entity.position.x;
      v2 = node.entity.position.x;
    }else{
      v1 = this.entity.position.y;
      v2 = node.entity.position.y;
    }
    
    return v1 < v2;
  }
  
  bool operator == (BinaryNode node){
    num v1, v2;
    if (node.checkX == true){
      v1 = this.entity.position.x;
      v2 = node.entity.position.x;
    }else{
      v1 = this.entity.position.y;
      v2 = node.entity.position.y;
    }
    
    return v1 == v2;
  }

  bool operator >= (BinaryNode node){
    return !(this < node);
  }
  
  bool operator <= (BinaryNode node){
    return !(this > node);
  }
  
  void insert(BinaryNode node){
    bool nodeGoesLeft = (node < this);
    node.checkX = !this.checkX;
    if (nodeGoesLeft == true){
      if (this.leftChild == null){
        this.leftChild = node;
      }else{
        this.leftChild.insert(node);
      }
    }else{
      if (this.rightChild == null){
        this.rightChild = node;
      }else{
        this.rightChild.insert(node);
      }
    }
  }
  
  void remove(){
    this.isRemoved = true;
  }
  
}

class QuadNode extends Node{
  Node northEastChild;
  Node northWestChild;
  Node southWestChild;
  Node southEastChild;
}

abstract class Tree{
  Node rootNode;
  
  void insert(Node node);
  
  void remove(Node node);
}

class KDTree extends Tree{
  
  bool treeNeedsUpdating = false;
  
  KDTree(){
    this.rootNode = new BinaryNode();
    this.rootNode.entity = new Entity.Default();
  }
  
  KDTree.WithRoot(Entity entity){
    this.rootNode = new BinaryNode();
    this.rootNode.entity = entity;
  }
  
  KDTree.WithNode(BinaryNode node){
    this.rootNode = node;
  }
  
  void insert(BinaryNode node){
    if (this.rootNode == null){
      this.rootNode = node;
    }else{
      this.rootNode.insert(node);
    }
  }
  
  void remove(BinaryNode node){
    removeFromNode(node, this.rootNode);
  }
  
  void removeFromNode(BinaryNode node, BinaryNode startnode){
    
  }
  
  
}
