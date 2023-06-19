class MenuModel {
  int idMenu;
  int idCategory;
  String name;
  int price;
  String createdAt;
  String updateddAt;
  String? deletedAt;
  String calorie;
  String city;
  String description;
  String ingredients;
  String images;
  CategoryModel category;

  MenuModel({
    required this.idMenu,
    required this.idCategory,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.updateddAt,
    this.deletedAt,
    required this.calorie,
    required this.city,
    required this.description,
    required this.ingredients,
    required this.images,
    required this.category,
  });

  factory MenuModel.fromJson(Map<String, dynamic> dataMenu) {
    return MenuModel(
      idMenu: dataMenu['ID'],
      idCategory: dataMenu['category_id'],
      name: dataMenu['name'],
      price: dataMenu['price'],
      createdAt: dataMenu['CreatedAt'],
      updateddAt: dataMenu['UpdatedAt'],
      deletedAt: dataMenu['DeletedAt'],
      calorie: dataMenu['calories'],
      city: dataMenu['city'],
      description: dataMenu['description'],
      ingredients: dataMenu['ingredient'],
      images: dataMenu['images'],
      category: CategoryModel.fromJson(dataMenu['Category']),
    );
  }
}

class CategoryModel {
  int idCategory;
  String name;
  dynamic menus;

  CategoryModel({
    required this.idCategory,
    required this.name,
    this.menus,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      idCategory: json['id'],
      name: json['name'],
      menus: json['menus'],
    );
  }
}
