import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          greeting(),
          searchBar(),
          topFlavorsCard(),
          popularIceCreams(),
        ],
      ),
    );
  }

  Widget greeting() {
    return const ListTile(
      title: Text(
        "Hey Emma",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text("What flavor do you like to eat?"),
      trailing: CircleAvatar(
        backgroundImage: NetworkImage("https://picsum.photos/200/300"),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 231, 231),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Expanded(flex: 1, child: Icon(Icons.search)),
              const Expanded(
                flex: 6,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFFFF4F8A)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topFlavorsCard() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Top Flavours",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            color: Color.fromARGB(255, 250, 93, 145),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network("https://picsum.photos/150/100"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Vanilla Ice Cream"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "1 KG",
                            style: TextStyle(backgroundColor: Colors.yellow),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.star_rate_sharp,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          Text("4.9"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Color.fromARGB(255, 145, 3, 51),
                          ),
                          const Text("14,60"),
                          FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.add),
                            mini: true,
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget popularIceCreams() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Popular Ice Cream",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 500,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Container(
                height: 60,
                color: Colors.red,
                child: Image.network("https://picsum.photos/50/50"),
              ),
              Container(
                height: 60,
                color: Color(0xFFFC877E),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Vanilla")),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
