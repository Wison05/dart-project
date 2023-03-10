import 'dart:math';

int getNum(int min, int max) {
  Random r = new Random();
  return min + r.nextInt(max-min);
}

class Unit{
  int xp;//경험치
  Unit(this.xp);

  void getXp(int _xp){
    xp = xp + _xp;
  }

}

// abstract class AttackType{
  /* abstract의 특징은 기능을 정의하지 않음.*/
//   void punch();
//
//   void kick();
// }


//플레이어 클래스 정의
class User extends Unit{

  //속성
  String name; //이름
  int hp; //체력
  int minDmg; //최소데미지
  int maxDmg; //최대데미지
  int def; //방어력
  late int xp;

  User({required this.name, required this.hp,required this.minDmg,required this.maxDmg,required this.def, required int xp})
      :super(xp);

  //기능
  //die
    /*bool isDead(){
      if(hp <= 0) return true;
      else return false;
      }
    */
  bool isDead() => hp<=0? true:false;
  // => : return

  //attack
  int attack(){
    super.getXp(10);
    xp = super.xp;
    return getNum(minDmg, maxDmg);
  }

  //dmg
  void getDmg(int dmg){
    //데미지에서 방어력만큼 차감
    dmg -= def;
    if (dmg < 0) dmg = 0;
    hp -= dmg;
  }
  

}