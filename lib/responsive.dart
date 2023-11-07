import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 750;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  
  


  static double getValue(context, double mob, double tab, double desk) {
    if (Responsive.isMobile(context)) {
      return mob;
    } else if (Responsive.isTablet(context)) {
      return tab;
    } else {
      return desk;
    }
  }

  static double getFontSize(context, double min, double max) {
    double _width = MediaQuery.of(context).size.width;
    double a =  (max-min)/(1200-350);
    double b = max - a*1200;
    double _size = a*_width +b;
    
    if (_size > max) {
      return max;
    } else if (_size < min) {
      return min;
    } else {
      return _size;
    }
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 750) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }

  
}
