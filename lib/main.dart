import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'designs/home_page.dart';

import 'provider/provider_class.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => TodoProvider()),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.brown),
        debugShowCheckedModeBanner: false,
        home: GroceriesList(),
      ),
    ),
  );
}
/*
ChangeNotifierProvider It listens to a ChangeNotifier extended by the model class,
exposes it to its children and descendants, and rebuilds depends whenever notifyListeners is called.*/
