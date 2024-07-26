/***********************************************************
* This Flutter application displays an Instagram-like profile page of Arlecchino, a character
* from the popular video game, Genshin Impact.
* 
* The top section includes a [1] circular avatar, [2] edit bio button, [3] number of posts (dynamic), 
* followers (static), and following (also static), and [4] a horizontally scrollable category section 
* for text button icons of Posts, Reels, Tagged, Likes, and Saved.
*
* Below that is a widget of a vertically scrollable image grid (3 random pictures per row) with a 
* floating action button that adds random images as posts. The program initally has 4 posts, and 
* every time the button is pressed, it adds a random Arlecchino picture/post to the end of the list.
*
* @author RebberChicken
* @created_date 2023-07-05 13:07
* DO NOT COPY OR USE THE CODE FOR OTHER PURPOSES.
***********************************************************/

import 'dart:math'; // For random number generator
import 'package:flutter/material.dart'; // For icons, widgets, and material design

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[850],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[700],
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.grey[900]!,     // Requires a "!" because it asserts that the value is not null and converts it to Color (non-nullable).
          secondary: Colors.grey[700]!,
        ),
      ),
      home: const HomePage(title: "@arlecchino"), // Sets the title of the profile page to "@arlecchino"
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({required this.title, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of initial image files already present in the grid
  List<String> imageFiles = [
    "assets/arle1.jpg",
    "assets/arle2.jpg",
    "assets/arle3.jpg",
    "assets/arle4.jpg"
  ];

  Random random = Random(); // Instance of random number
  int count = 4;  // 4 initial number of images

  // Function to add random images to the grid
  void addRandomImages() {
    setState(() {
      imageFiles.add("assets/arle${random.nextInt(7) + 1}.jpg"); // Add random images from arle1 to arle7, and the +1 is to avoid out of bounds index
      count++; // Increment the number of posts
      print("Added post! Current posts: $count.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addRandomImages,
          backgroundColor: Colors.white, // Set background color to white
          child: const Icon(Icons.add, color: Colors.black), // Set icon color to black
        ),
        appBar: AppBar(
          title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Column(
                    children: <Widget>[
                      ClipOval(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/arle1.jpg"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Arlecchino",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Text("|", style: TextStyle(fontSize: 20)),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextButton(
                              onPressed: () {
                                print("Edit Bio");
                              },
                              child: Text("Edit Bio", style: TextStyle(color: Colors.grey[50])),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: <Widget>[
                                Text("$count", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                const Text("Posts"),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: <Widget>[
                                Text("703M", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                Text("Followers"),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: <Widget>[
                                Text("23", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                Text("Following"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "I am The Knave, Arlecchino, Fourth of the Fatui Harbingers. The children of the House of the Hearth call me Father. Always keep moving forward. Never let yourself be constrained by power.",
                        style: TextStyle(color: Colors.grey[300]),
                        textAlign: TextAlign.justify, // Justify the text
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () { print("Posts"); },
                        icon: Icon(Icons.image, color: Colors.grey[300]), // Add icon
                        label: Text("Posts", style: TextStyle(color: Colors.grey[300])),
                      ),
                      TextButton.icon(
                        onPressed: () { print("Reels"); },
                        icon: Icon(Icons.video_library, color: Colors.grey[300]), // Add icon
                        label: Text("Reels", style: TextStyle(color: Colors.grey[300])),
                      ),
                      TextButton.icon(
                        onPressed: () { print("Tagged"); },
                        icon: Icon(Icons.tag, color: Colors.grey[300]), // Add icon
                        label: Text("Tagged", style: TextStyle(color: Colors.grey[300])),
                      ),
                      TextButton.icon(
                        onPressed: () { print("Likes"); },
                        icon: Icon(Icons.favorite, color: Colors.grey[300]), // Add icon
                        label: Text("Likes", style: TextStyle(color: Colors.grey[300])),
                      ),
                      TextButton.icon(
                        onPressed: () { print("Saved"); },
                        icon: Icon(Icons.bookmark, color: Colors.grey[300]), // Add icon
                        label: Text("Saved", style: TextStyle(color: Colors.grey[300])),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: createImageGrid(),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      );
  }

  Widget createImageGrid() {
      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: imageFiles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageFiles[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }
}
