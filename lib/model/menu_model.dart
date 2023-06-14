// ignore_for_file: public_member_api_docs, sort_constructors_first
class MenuCategory {
  String idCategory;
  String name;
  String createdAt;
  String updateddAt;
  List<MenuModel> menu;
  MenuCategory({
    required this.idCategory,
    required this.name,
    required this.createdAt,
    required this.updateddAt,
    required this.menu,
  });
  factory MenuCategory.fromJson(Map<String, dynamic> dataMenu) {
    var list = dataMenu['menu'] as List;
    List<MenuModel> listProduct =
        list.map((e) => MenuModel.fromJson(e)).toList();
    return MenuCategory(
        idCategory: dataMenu['id_category'],
        name: dataMenu['name'],
        createdAt: dataMenu['created_at'],
        updateddAt: dataMenu['updated_at'],
        menu: listProduct);
  }
}

class MenuModel {
  String idMenu;
  String idCategory;
  String name;
  String price;
  String createdAt;
  String updateddAt;
  String category;
  String calorie;
  String city;
  String description;
  String ingredients;
  String images;

  MenuModel({
    required this.idMenu,
    required this.idCategory,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updateddAt,
    required this.category,
    required this.calorie,
    required this.city,
    required this.description,
    required this.ingredients,
    required this.images,
  });

  factory MenuModel.fromJson(Map<String, dynamic> dataMenu) {
    return MenuModel(
      idMenu: dataMenu['id_menu'],
      idCategory: dataMenu['id_category'],
      name: dataMenu['name'],
      price: dataMenu['price'],
      createdAt: dataMenu['created_at'],
      updateddAt: dataMenu['updated_at'],
      category: dataMenu['category'],
      calorie: dataMenu['calorie'],
      city: dataMenu['city'],
      description: dataMenu['description'],
      ingredients: dataMenu['ingredients'],
      images: dataMenu['images'],
    );
  }
}
