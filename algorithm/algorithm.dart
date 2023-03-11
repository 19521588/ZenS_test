import 'dart:io';
import 'dart:math';

void miniMaxSum(List<int> arr){
  int _max=arr.reduce(max);
  int _min=arr.reduce(min);

  int total_of_array=arr.reduce((value, element) => value+element);
  int maxSum=total_of_array-_min;
  int minSum=total_of_array-_max;
  print('$minSum $maxSum');
}

void findEvenElements(List<int> arr){
  arr.forEach((element) { 
    if(element%2==0){
      stdout.write('$element ');
    }
  });
}

void findOddElements(List<int> arr){
  arr.forEach((element) { 
    if(element%2==1){
      stdout.write('$element ');
    }
  });
}

void main() {

    stdout.write('Mời bạn nhập danh sách: ');
    String input = stdin.readLineSync()!;
    List<int> list=input.split(' ').map((e) => int.parse(e)).toList();
    miniMaxSum(list);
    stdout.write('Danh sách các phần tử chẵn: ');
    findEvenElements(list);
    print("");
    stdout.write('Danh sách các phần tử lẻ: ');
    findOddElements(list);
}