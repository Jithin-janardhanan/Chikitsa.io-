// import 'package:adhicine/homepageWidgets/date_selector_widgets.dart';
// import 'package:adhicine/homepageWidgets/header_widgets.dart';
// import 'package:flutter/material.dart';
// import '../homepageWidgets/empty_homepage.dart';
// import '../homepageWidgets/navbar.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const HeaderWidget(),
//             const DateSelectorWidget(),
//             const Expanded(
//               child: EmptyStateWidget(),
//             ),
//             // const BottomNavBarWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../homepageWidgets/date_selector_widgets.dart';
import '../homepageWidgets/header_widgets.dart';
import '../homepageWidgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(),
            const Expanded(
              child: DateSelectorWidget(),
            ),
            // const BottomNavBarWidget(),
          ],
        ),
      ),
    );
  }
}
