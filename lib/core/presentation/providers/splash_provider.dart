import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
Future<void> splashDelay(Ref ref) async {
  await Future.delayed(const Duration(milliseconds: 2000));
}
