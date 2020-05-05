import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _paneAnimationController;
  Animation<double> _bottomPaneAnimation;
  Animation<double> _posterSizeAnimation;
  Animation<double> _blurPosterAnimation;
  Animation<Color> _colorPaneAnimation;
  bool isOpen = false;

  @override
  void initState() {
    _paneAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _bottomPaneAnimation = Tween<double>(begin: -300, end: 0.0).animate(
      CurvedAnimation(parent: _paneAnimationController, curve: Curves.easeIn),
    );
    _posterSizeAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(parent: _paneAnimationController, curve: Curves.easeIn),
    );
    _blurPosterAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _paneAnimationController, curve: Curves.easeIn),
    );
    _colorPaneAnimation =
        ColorTween(begin: Colors.black87, end: Colors.black.withOpacity(0.9))
            .animate(_paneAnimationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _paneAnimationController,
        builder: (BuildContext context, Widget widget) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: _posterSizeAnimation.value,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/wallhaven-dgzzlo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _blurPosterAnimation.value,
                      sigmaY: _blurPosterAnimation.value,
                    ),
                    child: Container(
                      color: Colors.white.withOpacity(0.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: _bottomPaneAnimation.value,
                child: GestureDetector(
                  onTap: () {
                    if (isOpen) {
                      _paneAnimationController.reverse();
                    } else {
                      _paneAnimationController.forward();
                    }
                    isOpen = !isOpen;
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    color: _colorPaneAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Mulher-Maravilha 2',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Descrição',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Wonder Woman 1984 é um futuro filme estadunidense de super-herói de 2020,'
                          ' baseado na personagem homônima da DC Comics e distribuído pela Warner Bros. Pictures.'
                          ' Será a sequência de Wonder Woman de 2017, e o nono filme do Universo Estendido da DC.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
