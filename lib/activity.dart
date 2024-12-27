
class Actiivity{

  String level;
  double r=0;
  Actiivity(this.level);
  @override
  String toString() {
    return '$level';
  }

  String getWater(){
    if(level=='Active'){
      r=300;
    }
    else if(level=='Moderate'){
      r=100;
    }
    else{
      r+=0;
    }
    return r.toString();
  }
}
List<Actiivity>acts=[
  Actiivity('Active'),
  Actiivity('Moderate'),
  Actiivity('Low'),
];
