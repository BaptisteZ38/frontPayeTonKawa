import 'package:flutter_riverpod/flutter_riverpod.dart';

/* Utilisé pour garder en mémoire le nom de la séance */
final inputValueProvider = StateProvider<String>((ref) => "");