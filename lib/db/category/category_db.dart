import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_1/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category name';

abstract class CategoryDbFunction {
  Future<List<CategoryModel>> getCategory();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deletecategory(String categoryID);
}

class CategoryDB implements CategoryDbFunction {
  CategoryDB.internal();

  static CategoryDB instance = CategoryDB.internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomecategorylistlistener =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expensecategortlistlistener =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    categoryDB.put(value.id, value);
    refershUI();
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return categoryDB.values.toList();
  }

  Future<void> refershUI() async {
    final allcategories = await getCategory();
    print(allcategories);
    incomecategorylistlistener.value.clear();
    expensecategortlistlistener.value.clear();
    await Future.forEach(
      allcategories,
      (CategoryModel category) {
        if (category.type == CategoryType.income) {
          incomecategorylistlistener.value.add(category);
          print(incomecategorylistlistener.value);
        } else {
          expensecategortlistlistener.value.add(category);
        }
      },
    );

    incomecategorylistlistener.notifyListeners();
    expensecategortlistlistener.notifyListeners();
  }

  @override
  Future<void> deletecategory(String categoryID) async {
    final CategoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await CategoryDB.delete(categoryID);
    refershUI();
  }
}
