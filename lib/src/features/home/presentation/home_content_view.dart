import 'dart:math';

import 'package:flutter/material.dart';

import '../domain/model/post_model.dart';
import 'widgets/m3card.dart';

class HomeContentView extends StatelessWidget {
  const HomeContentView({
    super.key,
    required this.avisos,
    required this.lembretes,
  });

  final List<PostModel> avisos;
  final List<PostModel> lembretes;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Row(
            children: [
              FlutterLogo(),
              SizedBox(width: 16),
              Text('SliverAppBar'),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
            height: 500,
            decoration: BoxDecoration(
              color: Colors.red.shade200,
              borderRadius: BorderRadius.circular(32),
              image: const DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.pexels.com/photos/1037992/pexels-photo-1037992.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                  // 'https://picsum.photos/id/250/1280/800'
                  // 'https://img.freepik.com/free-vector/abstract-halftone-background_23-2148595343.jpg?t=st=1731886348~exp=1731889948~hmac=20765f828193140f5f6d4fb5c72289c003a715cc7a16b407b748eb1b02d06630&w=1480',
                ),
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  top: 32,
                  left: 32,
                  child: SizedBox(
                    width: 500,
                    child: const Text(
                      'Noto - A Typeface for the World',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 32,
                  right: 32,
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.yellow.shade200,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 600,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Material Design',
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Material 3 is the latest version of Google’s open-source design system. Design and build beautiful, usable products with Material 3.',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 72,
                            child: FilledButton(
                              onPressed: () {},
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 600,
            child: M3Card(
              post: PostModel(
                title: 'Título Principal',
                content:
                    'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. ',
                imageUrl:
                    'https://picsum.photos/id/${Random().nextInt(200)}/1280/800',
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Text(
              'Avisos',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: avisos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                PostModel aviso = avisos[index];
                return M3Card(post: aviso, width: 400);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
            child: Text(
              'Outra seção',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 4 / 3,
          ),
          itemCount: lembretes.length,
          itemBuilder: (context, index) {
            final lembrete = lembretes[index];
            return M3Card(
              post: lembrete,
              width: 0,
            );
          },
        ),
      ],
    );
  }
}
