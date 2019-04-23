import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speis_eks/blocs/launches_bloc.dart';
import 'package:speis_eks/blocs/missions_bloc.dart';
import 'package:speis_eks/pages/launches_page.dart';
import 'package:speis_eks/pages/missions_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speis EKS',
      theme: ThemeData.light(),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final List<Widget> screens = [
    BlocProvider(
      bloc: MissionsBloc(),
      child: MissionsPage(),
    ),
    BlocProvider(
      bloc: LaunchesBloc(),
      child: LaunchesPage(),
    )
  ];

  @override
  State<StatefulWidget> createState() => _MainScreenState(0);
}

class _MainScreenState extends State<MainScreen> {
  
  int _currentScreenIndex;

  /// Initializes the main screen state at the given screen index
  _MainScreenState(this._currentScreenIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text("Missions"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_capslock),
            title: Text("Launches"),
          )
        ],
        onTap: (index) {
          _setScreenIndex(index);
        },
      ),
    );
  }

  void _setScreenIndex(int index) {
    setState(() {
      _currentScreenIndex = index;
    });
  }

}
