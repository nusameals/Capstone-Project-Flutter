import 'package:flutter/material.dart';
import 'package:nusameals/view/component/button_primary.dart';
import 'package:nusameals/view/component/costum_snackbar.dart';
import 'package:nusameals/view/scan/result_scan.dart';
import 'package:provider/provider.dart';
import '../../model/menu_model.dart';
import '../../themes/constant.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../view_model/menu_view_model.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MenuViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final modelMenu = Provider.of<MenuViewModel>(context);
    Future<void> scanbarcode() async {
      String idMenu = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.QR,
      );
      MenuModel? scannedMenu = modelMenu.findMenuById(idMenu);
      if (scannedMenu != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScanScreen(scannedMenu),
          ),
        );
      } else {
        CustomSnackbar.showSnackbar(context, 'Menu not found');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryBlue,
        elevation: 1,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back,
            color: ColorTheme.light1,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Scan Menus',
          style: ThemeText.subHeadingR20W,
        ),
      ),
      body: Center(
        child: Container(
          color: ColorTheme.light4,
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorTheme.light1,
                ),
                child: Text(
                  'Please scan the menu via the QR Code then click the button below',
                  textAlign: TextAlign.center,
                  style: ThemeText.bodyR14,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Icon(
                Icons.qr_code_scanner,
                size: 250,
              ),
              const SizedBox(
                height: 90,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: PrimaryButton(
                  text: 'Scan',
                  onPressed: () {
                    scanbarcode();
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
