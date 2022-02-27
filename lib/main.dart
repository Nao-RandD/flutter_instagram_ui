import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_ui/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Debugとアプリ右上に表示されるものを非表示にする
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        canvasColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "reel",
            icon: Icon(Icons.ondemand_video_rounded),
          ),
          BottomNavigationBarItem(
            label: "shop",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: "mypage",
            icon:  Container(
              width: 40.0,
              height: 40.0,
              // EdgeInsets.allは上下左右に余白を作りたい場合に使用する
              padding: const EdgeInsets.all(3.0),
              // 画像などのコンテンツの角を丸くした場合に便利なClipRRectで画像をラップする
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset('assets/users/icon.png'),
              ),
            ),
          ),
        ],
      ),
      // SafeAreaを使用するとOSに関わらず適切な領域にWidgetを収めてくれる
      // (iPhone XRなどのノッチがあるタイプに対応できる)
      // Scaffoldのbodyでラップするのが一番簡単で公式でも紹介がある
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // 開始と終了にはスペースを開けないために.spaceBetweenとしている
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset(
                    'assets/instagram.png',
                    color: Colors.white,
                    width: 130,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_box_outlined,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      Image.asset(
                        'assets/heart.png',
                        color: Colors.white,
                        height: 20.0,
                      ),
                      const SizedBox(width: 8.0),
                      Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 130,
              child: Padding(
                padding:
                // 水平方向と垂直方向に余白。下記と同義
                // const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),）
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Story(
                        image: "assets/users/habu.jpeg",
                        name: "habu",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/masuda.jpeg",
                        name: "masuda",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/fujii.jpeg",
                        name: "fujii",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/tanigawa.jpeg",
                        name: "tanigawa",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/masuda.jpeg",
                        name: "masuda",
                      ),
                      const SizedBox(width: 16.0),
                      Story(
                        image: "assets/users/fujii.jpeg",
                        name: "fujii",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 区切り線をContainerで表現している
            Container(
              height: 2.0,
              color: Colors.white.withOpacity(0.2),
            ),
            // 残りのスペースにドーンと広げるためにExpanded
            
            Expanded(
                child: ListView(
                  children: [
                    Post(
                      userName: 'naoRandD',
                      userImage: 'assets/users/icon.png',
                      image: 'assets/posts/0.jpg',
                    ),
                    Post(
                      userName: 'naoRandD',
                      userImage: 'assets/users/icon.png',
                      image: 'assets/posts/1.jpg',
                    ),
                    Post(
                      userName: 'naoRandD',
                      userImage: 'assets/users/icon.png',
                      image: 'assets/posts/2.jpg',
                    ),
                  ],
                ))
          ],
        )
      ),
    );
  }
}

class Story extends StatelessWidget {
  final String image;
  final String name;

  const Story({Key key, this.image, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              colors: instagramColors,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}

class Post extends StatelessWidget {
  final String userImage;
  final String userName;
  final String image;
  String musicName = 'music・オリジナル音源';

  Post({
    Key key,
    this.userName,
    this.userImage,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.asset(userImage),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        musicName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Image.asset(
            image,
            filterQuality: FilterQuality.high,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/heart.png',
                    color: Colors.white,
                    height: 30.0,
                  ),
                  const SizedBox(width: 16.0),
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  const SizedBox(width: 16.0),
                  Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "いいね！: naoRandD、他",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "ほげほげほげほげ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              Text(
                "ふがふがふがふが...",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              Text(
                "続きを読む",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "コメント",
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            "21分前",
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 10.0,
            ),
          ),
        )
      ],
    );
  }
}


