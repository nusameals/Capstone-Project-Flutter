class MenuModel {
  int idMenu;
  int idCategory;
  String name;
  int price;
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
    required this.category,
    required this.calorie,
    required this.city,
    required this.description,
    required this.ingredients,
    required this.images,
  });

  factory MenuModel.fromJson(Map<String, dynamic> dataMenu) {
    return MenuModel(
      idMenu: dataMenu['id'],
      idCategory: dataMenu['category_id'],
      name: dataMenu['name'],
      price: dataMenu['price'],
      category: dataMenu['category'],
      calorie: dataMenu['calories'],
      city: dataMenu['city'],
      description: dataMenu['description'],
      ingredients: dataMenu['ingredients'],
      images: dataMenu['images'],
    );
  }
}
