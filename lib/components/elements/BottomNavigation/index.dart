import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gorilla_hash/components/elements/loading/screen_spinner.dart';
import 'package:gorilla_hash/pages/p2p/index.dart';
import 'package:gorilla_hash/utilities/shortcuts/index.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ContainerScreens extends StatefulWidget {
  @override
  State<ContainerScreens> createState() => _ContainerScreensState();
}

class _ContainerScreensState extends State<ContainerScreens> {
  int _currentIndex = 3;
  bool loading = false;

  changeLoading(bool state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      setState(() {
        loading = state;
      });
    });
  }

  changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  renderPage() {
    switch (_currentIndex) {
      case 0:
        return;
      case 1:
        return;
      case 2:
        return;
      case 3:
        return p2pScreen();
      case 4:
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          return false;
        } else {
          changeIndex(0);
          return false;
        }
      },
      child: LoadingOverlay(
        isLoading: loading,
        color: Colors.black,
        progressIndicator: ScreenSpinner(
          label: '',
        ),
        child: Scaffold(
          body: renderPage(),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) {
              setState(() => _currentIndex = i);
            },
            items: [
              /// Home
              SalomonBottomBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/icons/home-solid.svg',
                  width: mq(context).width * 0.06,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/home-light.svg',
                  width: mq(context).width * 0.06,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: gc(context).primary),
                ),
                selectedColor: const Color.fromARGB(65, 91, 102, 202),
              ),

              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/History-light.svg',
                  width: mq(context).width * 0.06,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/History-solid.svg',
                  width: mq(context).width * 0.06,
                ),
                title: Text(
                  "Activity",
                  style: TextStyle(color: gc(context).primary),
                ),
                selectedColor: const Color.fromARGB(65, 91, 102, 202),
              ),

              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/add-light.svg',
                  width: mq(context).width * 0.06,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/add-light.svg',
                  width: mq(context).width * 0.06,
                ),
                title: Container(),
                selectedColor: const Color.fromARGB(65, 91, 102, 202),
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/clishcoin-light.svg',
                  width: mq(context).width * 0.06,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/clishcoin-solid.svg',
                  width: mq(context).width * 0.06,
                ),
                title: Text(
                  "LimboCoin",
                  style: TextStyle(color: gc(context).primary),
                ),
                selectedColor: const Color.fromARGB(65, 91, 102, 202),
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/cuentas-light.svg',
                  width: mq(context).width * 0.06,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/cuentas-solid.svg',
                  width: mq(context).width * 0.06,
                ),
                title: Text(
                  "Accounts",
                  style: TextStyle(color: gc(context).primary),
                ),
                selectedColor: const Color.fromARGB(65, 91, 102, 202),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
