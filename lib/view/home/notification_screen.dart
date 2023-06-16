import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notifications', style: TextStyle(fontFamily: 'Poppins'),),
          leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: (){

                    }, child: Text('Clear All',
                  style: TextStyle(color: Colors.blue,fontSize: 15,fontFamily: 'Poppins'),)
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                      title: Text('Update Profile',
                        style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Poppins'),
                      ),
                      subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Please update your profile',style: TextStyle(fontFamily: 'Poppins')),
                          InkWell(
                            onTap: (){},
                            child: Text('go to Profile',
                              style: TextStyle(fontWeight: FontWeight.w900,color: Color(0xFF0669BD),fontFamily: 'Poppins'),),
                          )
                        ],
                      ),
                      trailing: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF0669BD),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text('T',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 28,fontFamily: 'Poppins'),),
                        ),
                      )
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                  ),
                  ListTile(
                      title: Text('Update Menu',
                        style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Poppins'),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Check the latest menu, maybe it suits you',style: TextStyle(fontFamily: 'Poppins'),),
                          InkWell(
                            onTap: (){},
                            child: Text('See details',
                              style: TextStyle(fontWeight: FontWeight.w900,color: Color(0xFF0669BD),fontFamily: 'Poppins'),),
                          )
                        ],
                      ),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network('https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
                          width: 60,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text('Order Status',
                      style: TextStyle(fontWeight: FontWeight.w900,fontFamily: 'Poppins'),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your order is being processed',
                        style: TextStyle(fontFamily: 'Poppins'),),
                        InkWell(
                          onTap: (){},
                          child: Text('See details',
                            style: TextStyle(fontWeight: FontWeight.w900,color: Color(0xFF0669BD),fontFamily: 'Poppins'),),
                        )
                      ],
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network('https://plus.unsplash.com/premium_photo-1671013032391-e6cff46babe5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
                        width: 60,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Divider(
                    indent: 15,
                    endIndent: 15,
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
