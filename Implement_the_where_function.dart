void main() {
  const list=[1,2,3,4];
//final odd = list.where((value) => value%2 !=0);
//print(odd);
  final odd = where(list,(value) => value%2 == 1);
  print(odd);
  }
List<T> where<T>(List<T> items, bool Function(T) f)
{
  var results = <T>[];
  for(var item in items) {
    if (f(item)) {
      results.add(item);
    }
  }
  return results;
}
