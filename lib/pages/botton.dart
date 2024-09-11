import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/pages/home.dart';
import 'package:beauty/pages/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  int _one=1;
  int _two=0;
  int _three=0;

  final List<Widget> _pages = [
    Product(),
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        shape:CircleBorder(),
        backgroundColor: BG2,
        child: Icon(Icons.shopping_cart_outlined, color: third),
        onPressed: () {
          setState(() {
            _currentIndex = 1;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      backgroundColor: B,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: BG2,
        child: Container(
          height: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home,
                    color: _currentIndex == 0 ? third : BG,),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.grid_view, color: _one == 0? BG: third,),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
              ),
              SizedBox(width: 48.0),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline, color: third ,),
                onPressed: () {
                  setState(() {
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.person_outline, color:third ,),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
