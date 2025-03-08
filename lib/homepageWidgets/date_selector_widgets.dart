// import 'package:flutter/material.dart';

// class DateSelectorWidget extends StatefulWidget {
//   const DateSelectorWidget({Key? key}) : super(key: key);

//   @override
//   State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
// }

// class _DateSelectorWidgetState extends State<DateSelectorWidget> {
//   int _selectedIndex = 2; // Default to Saturday (index 2)

//   final List<String> _weekdays = [
//     'hr',
//     'Fri',
//     'Sat',
//     'Sun',
//     'Mon',
//     'Tue',
//     'Wed',
//     'Thu',
//   ];

//   final List<String> _fullDates = [
//     'Thursday, Sep 1',
//     'Friday, Sep 2',
//     'Saturday, Sep 3',
//     'Sunday, Sep 4',
//     'Monday, Sep 5',
//     'Tuesday, Sep 6',
//     'Wednesday, Sep 7',
//     'Thursday, Sep 8',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Text(
//                   '5 Medicines Left',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.chevron_left, color: Colors.black54),
//                   onPressed: () {
//                     setState(() {
//                       if (_selectedIndex > 0) {
//                         _selectedIndex--;
//                       }
//                     });
//                   },
//                 ),

//                 // Generate the date items
//                 for (int i = 0; i < _weekdays.length; i++) ...[
//                   if (i > 0) const SizedBox(width: 15),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _selectedIndex = i;
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 8),
//                       decoration: BoxDecoration(
//                         color: _selectedIndex == i
//                             ? Colors.black
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         _selectedIndex == i ? _fullDates[i] : _weekdays[i],
//                         style: TextStyle(
//                           color: _selectedIndex == i
//                               ? Colors.white
//                               : Colors.black54,
//                           fontWeight: _selectedIndex == i
//                               ? FontWeight.bold
//                               : FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],

//                 IconButton(
//                   icon: const Icon(Icons.chevron_right, color: Colors.black54),
//                   onPressed: () {
//                     setState(() {
//                       if (_selectedIndex < _weekdays.length - 1) {
//                         _selectedIndex++;
//                       }
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../homepageWidgets/empty_box.dart';
import 'empty_homepage.dart';
import 'medicine_list.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({Key? key}) : super(key: key);

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  int _selectedIndex = 2; // Default to Saturday (index 2)

  final List<String> _weekdays = [
    'hr',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
  ];

  final List<String> _fullDates = [
    'Thursday, Sep 1',
    'Friday, Sep 2',
    'Saturday, Sep 3',
    'Sunday, Sep 4',
    'Monday, Sep 5',
    'Tuesday, Sep 6',
    'Wednesday, Sep 7',
    'Thursday, Sep 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      '5 Medicines Left',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.chevron_left, color: Colors.black54),
                      onPressed: () {
                        setState(() {
                          if (_selectedIndex > 0) {
                            _selectedIndex--;
                          }
                        });
                      },
                    ),

                    // Generate the date items
                    for (int i = 0; i < _weekdays.length; i++) ...[
                      if (i > 0) const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: _selectedIndex == i
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _selectedIndex == i ? _fullDates[i] : _weekdays[i],
                            style: TextStyle(
                              color: _selectedIndex == i
                                  ? Colors.white
                                  : Colors.black54,
                              fontWeight: _selectedIndex == i
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],

                    IconButton(
                      icon: const Icon(Icons.chevron_right,
                          color: Colors.black54),
                      onPressed: () {
                        setState(() {
                          if (_selectedIndex < _weekdays.length - 1) {
                            _selectedIndex++;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Content based on selected date
        Expanded(
          child: _selectedIndex == 1
              ? MedicationSchedule()
              : const EmptyStateWidget(),
        ),
      ],
    );
  }
}

