import "HEntity.dart";
import "dart:web_audio" as WebAudio;


abstract class AudioNode{
  WebAudio.AudioNode webAudioNode;
  
  void connectTo(AudioNode node);
}


class Sound extends AudioNode{
  
  void connectTo(AudioNode node){
    this.webAudioNode.connectNode(node.webAudioNode);
  }
}


class AudioEffect extends AudioNode{
  
  List<AudioEffect> effects = [];
  
  
  void connectTo(AudioNode node){
    if (this.effects.length == 0){
      this.webAudioNode.connectNode(node.webAudioNode);
    }else{
      for (int i = 0; i < this.effects.length; i++){
        this.effects[i].connectTo(node);
      }
    }
  }
  
  void addEffect(AudioEffect effect){
    this.effects.add(effect);
    this.webAudioNode.connectNode(effect.webAudioNode);
  }
  
}

class AudioSource extends Component{
  String path;
  num intensity;
  num range;
  
  
  
  void update(){
    
  }
}

class AudioListener extends Component{
  
  
  void update(){
    
  }
}

class SoundManager{
  
  WebAudio.AudioListener mainListener = new WebAudio.AudioListener();
  List<AudioSource> sourceNodes = [];
  WebAudio.AudioContext context = new WebAudio.AudioContext();
  
  
  
  void play(){
    
  }
  
}