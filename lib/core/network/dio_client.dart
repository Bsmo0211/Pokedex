import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
}
