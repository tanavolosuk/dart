// import 'package:dart/dart.dart' as dart;
// import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
//(пример с массивом студентов) когда мы отправляем какой-то запрос,
//то мы не знаем, когда придет ответ. async нужен чтобы пометить,
//что функция возвращает значение promise
//у promise тип future. await вернет значение

  //Dio client = Dio();
  //инициализируем клиент dio // ctrl + . (добавить пакет)

  //var response = await client.get('http://dummyjson.com/test');
  //print(response.data);

  //client.get('https://dummyjson.com/test').then((v) => print(v.data));
  //любой http запрос асинхронный,
  // мы не знаем когда придет ответ и придет ли он вообще
  //then выполняет то же самое что и async & await,
  //однако в случае его использования слово then придется писать постоянно

  //var text = response.data;
  //когда мы обращаемся к какому-то объекту через точку
  //мы получаем его св-в. Функция get - возвращает promise.
  //Мы у promise берем св-ва data

  // try {
  //   var response = await slp(3);
  //   print(response); //респонс без дата потому что класс дио создает
  // } catch (e) {
  //   print('Ошибки были но мы их исправили!!!');
  // }
  // print('successful');

  //print(await Future.value(4));
  //Future.value - явно передаем значение 4, мы выводим как сам тип обещания
  //await - ждем пока функция вернет значение

  //String url = 'https://dummyjson.com/products';
  // Dio client = Dio();
  // var response = await client.get(url);
  // Map<String, dynamic> data = response.data;
  // print(data);

  final url = Uri.https(
    'dummyjson.com',
    '/products',
  );
  final response = await http.get(url);

  if (response.statusCode != 200) {
    print('Error');
    return;
  }

  Map<String, dynamic> jsonData = convert.jsonDecode(response.body);
  //map(ключ, значение) функция которая не мутирует массив а возвращает итератор(новый массив)

  List<dynamic> products = jsonData["products"];

  int sum = 0;

  List<int> prices = products
      .map((p) => p["price"] as int)
      .toList(); // toList() - приведение массива

  //forEach берет и перебирает каждый элемент массива и что-то с ним делает.
  //Мы передаем в него функцию - что мы сделаем с этим элементом массива

  sum = prices.reduce((acc, p) => acc + p);
  double average = sum / products.length;
  print("average price: $average");
}
