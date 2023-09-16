
void main(){
  List  list = [1,1,5,5, 7,7,7,4, 2,2, 3,3 ];
  for (var i = 0; i < list.length; i ++){
    for (var i2 = i+1; i2 < list.length; i2 ++){
      if (i == i2 ){
        break;

      }
    }
  }
}

