import 'package:flutter/material.dart';

class FitBoiAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final AppBar appBar;
  
  const FitBoiAppBar({
    super.key, required this.appBar,
  });

  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios, 
          color: Colors.black,
          size: 16
        )
      ),
      title: Text(
        "Activity",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14
        )
      ),
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(3),
            maximumSize: Size(30,30),
            minimumSize: Size(30,30),
            shape: CircleBorder(),
            backgroundColor: Color(0xffffe6da),
            foregroundColor: Color(0xfffa7a3b),
          ),
          child: Icon(Icons.notifications),
          )
        
      ]
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}