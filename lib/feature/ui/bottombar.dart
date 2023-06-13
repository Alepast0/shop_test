import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int activePageIndex;

  const BottomBar({Key? key, required this.activePageIndex}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentPageIndex = 0;

  void _setActivePage(int index) {
    if (ModalRoute.of(context)?.settings.name == '/Catalog' && (index == 0 || index == 2)) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/Category');
          break;
        case 1:
          Navigator.pushNamed(context, '/Basket');
          break;
      }
    } else {
      setState(() {
        _currentPageIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/Category');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/Basket');
          break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.activePageIndex >= 0 && widget.activePageIndex <= 3) {
      _currentPageIndex = widget.activePageIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      selectedLabelStyle: const TextStyle(fontSize: 10),
      showUnselectedLabels: true,
      currentIndex: _currentPageIndex,
      onTap: _setActivePage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Поиск',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket_outlined),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Аккаунт',
        ),
      ],
      selectedItemColor: const Color.fromRGBO(51, 100, 224, 1),
      unselectedItemColor: Colors.grey,
    );
  }
}
