import 'package:dart/dart.dart' as dart;
import 'package:dio/dio.dart';

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

  print('h1');
  await rsp(10);
  print('h2');
}

Future<int> slp(int num) {
  if (num % 2 == 0) {
    return Future.value(num * 2);
  } else {
    return Future.error(Exception('очень непридвиденная ошибка'));
    //тип исключения, получающий в себя сообщения.
  }
  //value - значение
}

Future<void> rsp(int num) {
  return Future.delayed(Duration(seconds: num)); //void - пустой тип
}
