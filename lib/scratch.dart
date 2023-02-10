import 'dart:io';

Future readFile(String path) async {
    var file = File(path);
    Future<String>? contents;
    await Future.delayed(const Duration(seconds: 2), () {
      contents = file.readAsString();
    });

    return contents;
}

void main() async {
  String path = "C:\\Users\\thoil\\OneDrive\\Desktop\\readme1.txt";
  print('Task 1');
  print(readFile(path));
  String? result = await readFile(path);
  print(result);
  print('Task 2');
  print('Task 3');
}