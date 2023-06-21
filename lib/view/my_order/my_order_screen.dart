// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../themes/constant.dart';
import '../../view_model/my_order_view_model.dart';
import '../component/card_my_order.dart';
import 'orders_details.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MyOrderViewModel>(context, listen: false).fetchMyOrders();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: ColorTheme.primaryBlue,
        title: Text(
          'My Orders',
          style: ThemeText.subHeadingR20W,
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Ordered'),
            Tab(text: 'Processed'),
            Tab(text: 'Finished'),
          ],
          labelStyle:
              GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 14),
          unselectedLabelStyle:
              GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 14),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderedTab(),
          _buildProcessedTab(),
          _buildFinishedTab(),
        ],
      ),
    );
  }

  Widget _buildOrderedTab() {
    return Consumer<MyOrderViewModel>(
      builder: (context, viewModel, _) {
        final orderedOrders = viewModel.myOrders
            .where((order) => order.orderStatus == 'Ordered')
            .toList();

        if (viewModel.isLoading) {
          return const Center(
            child: SpinKitCircle(
              color: ColorTheme.primaryBlue,
            ),
          );
        } else if (orderedOrders.isEmpty) {
          return _listIsEmpty();
        }

        return ListView.builder(
          itemCount: orderedOrders.length,
          itemBuilder: (context, index) {
            final order = orderedOrders[index];
            final firstOrderDetail =
                order.orderDetail.isNotEmpty ? order.orderDetail.first : null;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(order: order),
                  ),
                );
              },
              child: CardMyOrder(
                  id: order.idOrder,
                  dateTime: order.orderDate,
                  price: order.totalPrice,
                  imageUrl: firstOrderDetail!.images),
            );
          },
        );
      },
    );
  }

  Widget _buildProcessedTab() {
    return Consumer<MyOrderViewModel>(
      builder: (context, viewModel, _) {
        final processedOrders = viewModel.myOrders
            .where((order) => order.orderStatus == 'Processed')
            .toList();

        if (viewModel.isLoading) {
          return const Center(
            child: SpinKitCircle(
              color: ColorTheme.primaryBlue,
            ),
          );
        } else if (processedOrders.isEmpty) {
          return _listIsEmpty();
        }

        return ListView.builder(
          itemCount: processedOrders.length,
          itemBuilder: (context, index) {
            final order = processedOrders[index];
            final firstOrderDetail =
                order.orderDetail.isNotEmpty ? order.orderDetail.first : null;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(order: order),
                  ),
                );
              },
              child: CardMyOrder(
                  id: order.idOrder,
                  dateTime: order.orderDate,
                  price: order.totalPrice,
                  imageUrl: firstOrderDetail!.images),
            );
          },
        );
      },
    );
  }

  Widget _buildFinishedTab() {
    return Consumer<MyOrderViewModel>(
      builder: (context, viewModel, _) {
        final finishedOrders = viewModel.myOrders
            .where((order) => order.orderStatus == 'Finished')
            .toList();

        if (viewModel.isLoading) {
          return const Center(
            child: SpinKitCircle(
              color: ColorTheme.primaryBlue,
            ),
          );
        } else if (finishedOrders.isEmpty) {
          return _listIsEmpty();
        }

        return ListView.builder(
          itemCount: finishedOrders.length,
          itemBuilder: (context, index) {
            final order = finishedOrders[index];
            final firstOrderDetail =
                order.orderDetail.isNotEmpty ? order.orderDetail.first : null;

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(order: order),
                  ),
                );
              },
              child: CardMyOrder(
                  id: order.idOrder,
                  dateTime: order.orderDate,
                  price: order.totalPrice,
                  imageUrl: firstOrderDetail!.images),
            );
          },
        );
      },
    );
  }

  Widget _listIsEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.restaurant,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'You have not ordered anything yet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
