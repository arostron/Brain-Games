




class Brain2Beats{
  //variables 
  int currentthreshold; 
  String currentwavetype; 
  String soundFile; 
  AudioPlayer song; 
  Minim minim;

  //constructor method
  Brain2Beats(int thresholdIN, String wavetype, String _soundFile, AudioPlayer _song, Minim m){
    currentthreshold = thresholdIN;
    currentwavetype = wavetype; 
    soundFile = _soundFile;
    //println(soundFile); 
    //song = _song; 
    minim = m;
    //println("meow3");
    song = minim.loadFile(soundFile); //curre problem 
    //println("meow4");
  }
  
  //instance methods
  void playSong(int value){
    if(value >= currentthreshold){
      song.play(); 
     song = minim.loadFile(soundFile); //reload song 
    }
  }
  
}//end class