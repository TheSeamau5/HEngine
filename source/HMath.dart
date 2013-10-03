library HMath;

import 'dart:math';

num map(num value, num low1, num high1, num low2, num high2){
    return low2 + (high2 - low2) * (value - low1)/(high1 - low1); 
}


num abs(num value){
  if(value < 0){
    return -value;
  }
  return value;
}

class Point{
    num x,y,z;
    Point(this.x, this.y, this.z);
    Point.zero() : x = 0, y = 0, z = 0;
    Point.polar(num theta, num radius){
        x = cos(theta) * radius;
        y = sin(theta) * radius;
        z = 0;
    }
    
    Point operator + (Point p){
        return new Point(x + p.x, y + p.y, z + p.z);
    }
    
    Point operator - (Point p){
        return new Point(x - p.x, y - p.y, z - p.z);
    }
    
    Point operator * (dynamic p){
        if (p is num){
            return new Point(x * p, y * p, z * p);
        }else if (p is Point){
            return new Point(x * p.x, y * p.y, z * p.z);
        }else{
            throw new ArgumentError("can only multiply vector or scalar values");
        }
    }
    
    Point operator / (dynamic p){
      if (p is num){
          if (p == 0){
            throw new ArgumentError("cannot divide by zero");
          }
          return new Point(x / p, y /p, z /p);
      }else if (p is Point){
        if (p.x == 0 || p.y == 0){
          throw new ArgumentError("cannot divide by zero");
        }else{
          if (p.z == 0){
            return new Point(x / p.x, y / p.y, z);
          }else{
            return new Ponint(x / p.x, y / p.y, z / p.z);
          }
        }
      }
    }
    
    void rotateAround(Point P, num angle){
        num newX = P.x + (x - P.x) * cos(angle) - (y - P.y) * sin(angle);
        num newY = P.y + (x - P.x) * sin(angle) + (y - P.y) * cos(angle);
        x = newX;
        y = newY;
    }
    
    toString() => "{x: $x, y:$y, z: $z}";
    
    num length() => sqrt(dot(this, this));
}

num distance(Point P, Point Q){
    return sqrt( (Q.x - P.x) * (Q.x - P.x) + 
                 (Q.y - P.y) * (Q.y - P.y) + 
                 (Q.z - P.z) * (Q.z - P.z)
               );
}

num dot(Point P, Point Q){
    return (P.x * Q.x) + (P.y * Q.y) + (P.z * Q.z);
}


num minFromList(List<num> list){
  num minimum = list[0];
  for(int i = 1; i < list.length; i++){
    minimum = min(minimum, list[i]);
  }
  return minimum;
}

num maxFromList(List<num> list){
  num maximum = list[0];
  for (int i = 1; i < list.length; i++){
    maximum = max(maximum, list[i]);
  }
  return maximum;
}

Point cross(Point P, Point Q){
    num x = P.y * Q.z - P.z * Q.y;
    num y = P.z * Q.x - P.x * Q.z;
    num z = P.x * Q.y - P.y * Q.x;
    return new Point(x,y,z);
}


Point project(Point P, Point Axis){
  return Axis *(dot(P, Axis)/dot(Axis,Axis));
}

class Vector extends Point{
    Vector(x,y,z) : super(x,y,z);
}

