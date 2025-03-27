import 'package:flutter/material.dart'; 


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(backgroundColor: (Colors.white70)),
          onPressed: () {}, icon: Icon(Icons.grid_view)),
        IconButton(
          style: IconButton.styleFrom(backgroundColor: (Colors.white70)),
    
            onPressed: () {}, icon: Icon(Icons.notifications_active)),
      ],
    );
  }
}
