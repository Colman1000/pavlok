import 'package:get/get.dart';
import 'package:pavlok/screens/home/home_bindings.dart';
import 'package:pavlok/screens/home/home_view.dart';

final home = GetPage(
  name: HomeView.name,
  page: () => const HomeView(),
  binding: HomeBindings(),
);
