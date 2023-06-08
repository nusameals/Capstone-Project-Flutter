class MyOrder {
  final String id;
  final String dateTime;
  final String price;
  final String imageUrl;
  MyOrder({
    required this.id,
    required this.dateTime,
    required this.price,
    required this.imageUrl,
  });
}

final List<MyOrder> orderedList = [
  MyOrder(
    id: '1234',
    price: 'Rp60.000',
    dateTime: '29/04/2023 13:00',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
  ),
];
final List<MyOrder> processedList = [
  MyOrder(
    id: '67890',
    price: 'Rp75.000',
    dateTime: '29/04/2023 15:00',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
  ),
];
final List<MyOrder> finishedList = [
  MyOrder(
    id: '90123',
    price: 'Rp20.000',
    dateTime: '29/04/2023 16:00',
    imageUrl:
        'https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
  ),
];
