import 'package:flutter/material.dart';

import '../domain/model/post_model.dart';
import 'home_content_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    HomeContentView(
      avisos: List.generate(
        10,
        (index) => PostModel(
          title: 'Título ${index + 1}',
          content: 'Mussum ipsum cacildis vidis litrus abertis. Mussum ipsum cacildis vidis litrus abertis. Mussum ipsum cacildis vidis litrus abertis. ',
          imageUrl: 'https://picsum.photos/id/${index * 5}/1280/800',
        ),
      ),
      lembretes: List.generate(
        4,
        (index) => PostModel(
          title: 'Título ${index + 1}',
          content: 'Mussum ipsum cacildis vidis litrus abertis. Mussum ipsum cacildis vidis litrus abertis. Mussum ipsum cacildis vidis litrus abertis. ',
          imageUrl: 'https://picsum.photos/id/${index * 7}/1280/800',
        ),
      ),
    ),
    Container(color: Colors.blue.shade200),
    Container(color: Colors.yellow.shade200),
    Container(color: Colors.purple.shade200),
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
                leading: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                    maxRadius: 35,
                  ),
                ),
                trailing: Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Spacer(),
                      FloatingActionButton(
                        onPressed: () {},
                        child: const Icon(Icons.add),
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
                destinations: const [
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
              const VerticalDivider(thickness: 2, width: 2),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
