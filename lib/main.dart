import 'package:eshop/commen/util/injection/injectable_init.dart';
import 'package:eshop/features/app/presentation/ui/e_shop_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const EshopApp());
}
