import 'package:flutter/material.dart';
import 'package:flutter_challenge/views/app_bar.dart';
import 'package:provider/provider.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page ?? 0;
      notifyListeners();
    });
  }
  double get offset => _offset;
  double get page => _page;
}

class LeopardPage extends StatelessWidget {
  const LeopardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 128,
        ),
        BigTitle(),
        TravelDescriptionLabel()
      ],
    );
  }
}

class TravelDescriptionLabel extends StatelessWidget {
  const TravelDescriptionLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24),
        child: Text(
          'NEXT VICTIM',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ));
  }
}

class BigTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset(-40 - 0.5 * notifier.offset, 0),
          child: child,
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          width: 450,
          child: FittedBox(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            child: Text(
              '74',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
    // return Center(child: Image.asset('assets/leopard.png'));
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Image.asset(
        'assets/vulture.png',
        height: MediaQuery.of(context).size.height / 3,
      ),
    ));
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
            left: -0.85 * notifier.offset,
            height: 300,
            width: MediaQuery.of(context).size.width * 1.6,
            child: IgnorePointer(child: Image.asset('assets/leopard.png')));
      },
    );
  }
}

class VultureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
            left: 1.15 * MediaQuery.of(context).size.width -
                0.85 * notifier.offset,
            child: IgnorePointer(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Image.asset(
                'assets/vulture.png',
                height: MediaQuery.of(context).size.height / 3,
              ),
            )));
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
          body: SafeArea(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            PageView(
              controller: _pageController,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                LeopardPage(),
                VulturePage(),
              ],
            ),
            MyAppBar(),
            LeopardImage(),
            VultureImage(),
          ],
        ),
      )),
    );
  }
}
