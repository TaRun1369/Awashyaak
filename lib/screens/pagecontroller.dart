// import '../screens/homePage.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class PageController extends StatefulWidget {
//   const PageController({super.key});

//   @override
//   State<PageController> createState() => _PageControllerState();
// }

// class _PageControllerState extends State<PageController> {
//   final PageController controller = PageController();

  
//   int index = 0;
//   var listScrollController = new ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     // final PageController controller = PageController();
//     return Scaffold(
//       body: PageView(
//         onPageChanged: (page) {
//           setState(() {
//             index = page;
//           });
//         },
//         controller: controller,
//         children: [
//           const HomePage(),
//           Scaffold(
//             backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//             body: Container(
//               padding: const EdgeInsets.all(20),
//               child: FutureBuilder(
//                 future: client.getArticle(searchQuery),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<List<Article>> snapshot) {
//                   if (snapshot.hasData) {
//                     List<Article>? newsData = snapshot.data;
//                     return SingleChildScrollView(
//                       child: Column(
//                         verticalDirection: VerticalDirection.down,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Center(
//                             child: Container(
//                               height: MediaQuery.of(context).size.height * 0.85,
//                               padding: const EdgeInsets.symmetric(vertical: 5),
//                               child: ListView(
//                                 scrollDirection: Axis.vertical,
//                                 children: newsData!.map((item) {
//                                   return InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => IndiPage(
//                                             author: item.author,
//                                             description: item.description,
//                                             content: item.content,
//                                             publishedAt: item.publishedAt,
//                                             title: item.title,
//                                             url: item.url,
//                                             urlToImage: item.urlToImage,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     child: Stack(children: [
//                                       Container(
//                                         margin: const EdgeInsets.symmetric(
//                                             horizontal: 5, vertical: 5),
//                                         height: 200,
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(20.0),
//                                           child: Image.network(
//                                             item.urlToImage ??
//                                                 "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fwhite&psig=AOvVaw0i4DsAfbXSvJxV2ovFyKRx&ust=1671035012769000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCLChnNSA9_sCFQAAAAAdAAAAABAE",
//                                             height: 300,
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         height: 200,
//                                         decoration: BoxDecoration(
//                                           borderRadius: const BorderRadius.all(
//                                               Radius.circular(20)),
//                                           gradient: LinearGradient(
//                                             begin: Alignment.topCenter,
//                                             end: Alignment.bottomCenter,
//                                             colors: [
//                                               const Color.fromARGB(
//                                                       255, 247, 247, 247)
//                                                   .withOpacity(0),
//                                               const Color.fromARGB(
//                                                   255, 91, 0, 140),
//                                             ],
//                                           ),
//                                         ),
//                                         // width: 160,
//                                         margin: const EdgeInsets.symmetric(
//                                             horizontal: 5, vertical: 5),
//                                       ),
//                                       Column(
//                                         children: [
//                                           const SizedBox(
//                                             height: 130,
//                                           ),
//                                           Container(
//                                             padding: const EdgeInsets.all(20),
//                                             // width: 180,
//                                             child: Text(
//                                               item.title as String,
//                                               maxLines: 4,
//                                               overflow: TextOverflow.fade,
//                                               style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ]),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//                   return Center(
//                     child: LoadingBouncingLine.circle(),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//             color: Color.fromARGB(255, 217, 163, 255),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             )),
//         padding: const EdgeInsets.fromLTRB(10, 5, 10, 1),
//         child: GNav(
//           selectedIndex: index,
//           onTabChange: (index) {
//             setState(() {
//               controller.jumpToPage(index);
//             });
//           },
//           iconSize: 15,
//           activeColor: const Color.fromARGB(255, 91, 0, 140),
//           tabBackgroundColor: const Color.fromARGB(255, 226, 186, 255),
//           gap: 7,
//           hoverColor: Colors.black45,
//           tabs: const [
//             GButton(
//               icon: Icons.home,
//               text: "Home",
//             ),
//             GButton(
//               icon: Icons.search,
//               text: "search",
//             ),
//             GButton(
//               icon: Icons.person,
//               text: "account",
//             ),
//             GButton(
//               icon: Icons.adjust,
//               text: "settings",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }