import 'package:coffee/button/tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:coffee/constant/const.dart';
part './button/fab_button.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen>
    with TickerProviderStateMixin {
  late final TabController _tabcontroller;
  bool get _isLastPage => screens.length - 1 == _selectedIndex;
  int isv = 0;
  int _selectedIndex = 0;
  @override
  void initState() {
    _tabcontroller = TabController(
      animationDuration: const Duration(seconds: 1),
      vsync: this,
      length: 3,
    );
    super.initState();
  }

  void _changeAndIncrement([int? val]) {
    setState(() => isv++);
    if (_isLastPage && val == null) {
      Navigator.pushNamed(context, '/home');
      return;
    }
    _changedot(_selectedIndex);
    _changePage(val);
  }

  void _changedot(value) {
    _tabcontroller.animateTo(value);
  }

  void _changePage([int? val]) {
    setState(() {
      if (val != null) {
        _selectedIndex = val;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onboardcolor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white),
            ),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
              softWrap: true,
            ),
            Expanded(child: _pageViewitems()),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(indicatorSize: 12, selectedIndex: _selectedIndex),
                _StartFabButton(
                  isLastPage: _isLastPage,
                  onPressed: () {
                    _changeAndIncrement();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _pageViewitems() {
    return PageView.builder(
      itemCount: screens.length,
      onPageChanged: (value) => _changeAndIncrement(value),
      clipBehavior: Clip.none,
      itemBuilder: (context, i) => screens[_selectedIndex],
    );
  }
}
