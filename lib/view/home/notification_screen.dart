import 'package:flutter/material.dart';
import 'package:nusameals/view/main_screen.dart';
import '../../themes/constant.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool showNotifications = true;

  void clearNotifications() {
    setState(() {
      showNotifications = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.light1,
        elevation: 1,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back,
            color: ColorTheme.dark1,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notifications',
          style: ThemeText.subHeadingR20,
        ),
      ),
      body: showNotifications
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: clearNotifications,
                          child: Text(
                            'Clear All',
                            style: ThemeText.bodyR16B,
                          )),
                    ],
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      ListTile(
                          title: Text(
                            'Update Profile',
                            style: ThemeText.bodyB18,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Please update your profile',
                                style: ThemeText.bodyR14,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                child: Text(
                                  'Go to Profile',
                                  style: ThemeText.bodyB14B,
                                ),
                              )
                            ],
                          ),
                          trailing: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: ColorTheme.primaryBlue,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'T',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          )),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      ListTile(
                          title: Text(
                            'Update Menu',
                            style: ThemeText.bodyB18,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Check the latest menu, maybe it suits you',
                                style: ThemeText.bodyR14,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen()));
                                },
                                child: Text(
                                  'See details',
                                  style: ThemeText.bodyB14B,
                                ),
                              )
                            ],
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1587652813868-6988baecfc90?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1852&q=80',
                              width: 60,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          )),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text(
                          'Order Status',
                          style: ThemeText.bodyB18,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your order is being processed',
                              style: ThemeText.bodyR14,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'See details',
                                style: ThemeText.bodyB14B,
                              ),
                            )
                          ],
                        ),
                        trailing: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1572656306390-40a9fc3899f7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                            width: 60,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 15,
                        endIndent: 15,
                        thickness: 2,
                      ),
                    ],
                  )),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.notifications,
                    color: ColorTheme.dark5,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'No recent notifications',
                    style: ThemeText.bodyR14Dark4,
                  ),
                ],
              ),
            ),
    );
  }
}
