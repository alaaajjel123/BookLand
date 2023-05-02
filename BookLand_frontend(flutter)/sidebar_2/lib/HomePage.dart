
import 'package:flutter/material.dart';
import '../Models/Clone.dart';
import '../Widgets/Widgets.dart';
import '../Widgets/SearchBar.dart';
/*
import '../Constants/Constants.dart';

import '../UI/Account.dart';
import '../UI/AssemblingAnalyticsPage.dart';
import '../UI/ButtonExample.dart';
import '../UI/CustomStepper.dart';
import '../UI/DoubleCardExample.dart';
import '../UI/ExpandedBottomNav.dart';
import '../UI/ExpandileExample.dart';
import '../UI/GoogleSearchPage.dart';
import '../UI/ImgExample.dart';
import '../UI/InkkExample.dart';
import '../UI/InterLacedDashBoard.dart';
import '../UI/DribbbleBalExample.dart';
import '../UI/ProductDetailsPage.dart';
import '../UI/RichCalculator.dart';
import '../UI/SendMoneyPage.dart';
import '../UI/Tesla/Page.dart';
import '../UI/TimerDrawerPage.dart';


*/
import 'UI/ComplexDrawerPage.dart';
/*
import 'UI/CurrenciesPage.dart';
import 'UI/ScrollerSamplePage.dart';
*/
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        searchField(),
        clonesResult(),
      ],
    );
  }

  Widget searchField() {
    return SearchBar(
      onChanged: (z) => setState(() => query = z.toLowerCase()),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 8),
      child: Card(
        elevation: 0,
        color: Colors.grey.shade50,
        child: ListTile(
          leading: Icon(Icons.search, color: Colors.grey),
          title: TextField(
            controller: searchController,
            onChanged: (z) => setState(() => query = z.toLowerCase()),
            decoration: InputDecoration(
              hintText: "Search FlutterShip...",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
          trailing: IconButton(onPressed: clearSearch, icon: Icon(Icons.clear, color: Colors.grey)),
        ),
      ),
    );
  }

  Widget clonesResult() {
    Widgets.push(ComplexDrawerPage(), context);
    List<Clone> _clones = clones.where((clone) {
      return clone.title.toString().toLowerCase().contains(query) ||
          clone.title.toString().toLowerCase().contains(query);
    }).toList();
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: false,
        itemCount: _clones.length,
        itemBuilder: (BuildContext context, int index) {
          Clone clone = _clones[0];
          return ColorTile(
              icon: clone.icon,
              color: clone.color,
              title: clone.title,
              subtitle: clone.subtitle,
              onTap: () {
                Widgets.push(ComplexDrawerPage(), context);
              });
        },
      ),
    );
  }

  static List<Clone> clones = [
    /*
    Clone(TimerDrawerPage(), Colorz.timerBlue, Icons.calendar_today, "Timer Drawer",
        "Simple clean drawer design from dribbble.com"),
    Clone(AccountPage(), Colors.pink, Icons.person, "Account Page",
        "Colorful & BW Account Dashboard"),
    Clone(CurrenciesPage(), Colors.green, Icons.monetization_on, "Currency page",
        "Crypto currency coins app design dribbble.com"),
    Clone(SendMoneyPage(), Colorz.sendMoneyBlue, Icons.dialpad, "Send Money",
        "Money transfer screen design from dribbble.com"),
    Clone(ScrollerSamplePage(), Colors.blue, Icons.list, "Scroller Sample",
        "Example use case of scroller widget"),
    Clone(GoogleSearchPage(), Colors.amber, Icons.search, "Google Search Clone",
        "Cloing a google search results page"),
        */
    Clone(ComplexDrawerPage(), Colors.black, Icons.menu, "Complex Drawer",
        "Designing a complex drawer menu"),
        /*
    Clone(InterLacedDashBoard(), Colors.purple, Icons.dashboard_outlined, "Interlaced Dashboard",
        "Designing a mixed account dashboard"),
    Clone(AssemblingAnalyticsPage(), Colors.blue, Icons.apps, "Assembling Analytics",
        "Analytics page with auto assembling animated widgets"),
    Clone(ExpandedBottomNavigationBarPage(), Colorz.complexDrawerBlack, Icons.dns,
        "Expanded Bottom Navigation Bar", "A custom bottom navigation bar with additional menus"),
    Clone(RichCalculatorPage(), Colors.black, Icons.calculate, "Rich Calculator",
        "A Non functioning calculator ui"),
    Clone(ProductDetailsPage(), Colors.red, Icons.computer, "Product Details",
        "An Imaginary UI of Apple Macbook Customization Page"),
    Clone(ImgExample(), Colors.green, Icons.photo, "Img", "Example use case of Img widget"),
    Clone(ButtonExample(), Colors.deepPurple, Icons.touch_app, "Buttons",
        "Example use case of Button Widget"),
    Clone(InkkExample(), Colors.blue, Icons.touch_app, "Inkk", "Example use case of Inkk Widget"),
    Clone(StepperExample(), Colors.green, Icons.format_list_numbered, "Custom Stepper",
        "Example use case of custom stepper widget design"),
    Clone(DribbbleBallExamplePage(), Colors.pink, Icons.sports_basketball, "Dribbble Ball",
        "Example use case of dribbble ball type of loading widgets"),
    Clone(ExpandileExamplePage(), Colorz.iphone12Purple, Icons.expand_circle_down_outlined,
        'Expandile example', 'To use expadile widget'),
    Clone(DoubleCardExample(), Colorz.doubleCardBlue, Icons.layers, 'Double card example page',
        'To use the double card widget'),
    Clone(TeslaCarAppPage(), Colorz.complexDrawerBlack, Icons.car_rental, 'Tesla car control',
        'Remote application model to control a tesla car for educational purpose only'),
    */
  ];

  void clearSearch() {
    searchController.clear();
    query = '';
    FocusScope.of(context).unfocus();
  }
}
