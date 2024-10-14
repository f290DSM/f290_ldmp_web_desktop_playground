import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Row(
            children: [
              FlutterLogo(),
              SizedBox(width: 16),
              Text('SliverAppBar'),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                  .shade300,
            );
          },
        ),
      ],
    ),
    Container(color: Colors.blue.shade200),
    Container(color: Colors.green.shade200),
    Container(color: Colors.yellow.shade200),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: Expanded(
          child: Row(
            children: [
              NavigationRail(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  maxRadius: 35,
                ),
                trailing: Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Spacer(),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                selectedIndex: _selectedIndex,
                labelType: NavigationRailLabelType.all,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                // groupAlignment: 0.5,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.feed_outlined),
                    selectedIcon: Icon(Icons.feed),
                    label: Text('Feed'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite_outline),
                    selectedIcon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings_outlined),
                    selectedIcon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.person_outlined),
                    selectedIcon: Icon(Icons.person),
                    label: Text('Account'),
                  ),
                ],
              ),
              VerticalDivider(thickness: 2, width: 2),
              Expanded(
                child: IndexedStack(
                  children: pages,
                  index: _selectedIndex,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
