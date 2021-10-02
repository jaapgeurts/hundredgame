import std.stdio;
import std.random;
import std.typecons;

immutable int MARGIN = 40;
immutable int SIZEX = 596 - MARGIN * 2;
immutable int SIZEY = 843 - MARGIN * 2;
immutable int DISTANCE = 40;


struct Coord {
  int x;
  int y;
}

Nullable!Coord[100] positions;

int main(string[] args) {

  writeln("%!PS");
  writeln("<< /PageSize [595 842] >> setpagedevice");
  writeln("/Times-Roman findfont");
  writeln("18 scalefont");
  writeln("setfont");
  writeln("newpath");

  foreach(num ; 1..100) {
    int x,y;
    
    do {
     x = uniform(0,SIZEX)+MARGIN;
     y = uniform(0,SIZEY)+MARGIN;
    } while (tooClose(x,y));
    positions[num] = Coord(x,y).nullable;
    writeln(x," ",y," moveto");
    writeln("(",num,") show");
  }

  return 0;

}

bool tooClose(int x, int y) {
  foreach(coord ; positions) {
    if (!coord.isNull) {
      Coord co = coord.get;
      if (x > co.x-DISTANCE && x < co.x +DISTANCE
          && y > co.y-DISTANCE && y < co.y +DISTANCE)
          return true;
    }
  }
  return false;
}
